import 'package:flutter/foundation.dart';

import '../../../../app/network_caller_setup.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../model/categories_model.dart';

class CategoriesProvider extends ChangeNotifier {
  final int _pageSize = 30;
  int _currentPage = 0;
  int? _lastPage;
  bool _getMoreCategoriesInProgress = false;
  bool _loadMoreCategoriesListInProgress = false;
  final bool _getInitialCategoryListInProgress = false;

  bool get getInitialCategoryListInProgress =>
      _getInitialCategoryListInProgress;

  bool get loadMoreCategoriesListInProgress =>
      _loadMoreCategoriesListInProgress;

  bool get getMoreCategoriesInProgress => _getMoreCategoriesInProgress;
  final List<CategoriesModel> _categories = [];

  List<CategoriesModel> get categories => _categories;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getCategories() async {
    bool isSuccess = false;
    if (_lastPage != null && _currentPage >= _lastPage!) {
      return false;
    }
    _currentPage++;
    if (_isInitialLoading) {
      _getMoreCategoriesInProgress = true;
    } else {
      _loadMoreCategoriesListInProgress = true;
    }
    notifyListeners();
    NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.getCategoriesUrl(_currentPage, _pageSize),
    );
    if (response.isSuccess) {
      List<CategoriesModel> categoryList = [];
      for (Map<String, dynamic> categories
          in response.body['data']['results'] ?? _lastPage) {
        categoryList.add(CategoriesModel.fromJson(categories));
      }
      _categories.addAll(categoryList);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    if (_isInitialLoading) {
      _getMoreCategoriesInProgress = false;
    } else {
      _loadMoreCategoriesListInProgress = false;
    }
    notifyListeners();
    return isSuccess;
  }

  bool get _isInitialLoading {
    return _currentPage == 1;
  }
}
