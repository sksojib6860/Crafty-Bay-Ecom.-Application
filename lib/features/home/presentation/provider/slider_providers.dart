import 'package:flutter/material.dart';

import '../../../../app/network_caller_setup.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../model/slider_model.dart';

class SliderProviders extends ChangeNotifier {
  bool _isSliderInProgress = false;
  bool get isSliderInProgress => _isSliderInProgress;
  List<SliderModels> _sliderModels = [];
  List<SliderModels> get sliderModels => _sliderModels;
  String? _errorMessage;
  String? get errorMassage => _errorMessage;

  Future<bool> getHomeSliders() async {
    bool isSuccess = false;
    _isSliderInProgress = true;
    notifyListeners();
    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.sliderUrl,
    );
    if (response.isSuccess) {
      List<SliderModels> sliderList = [];
      for (Map<String, dynamic> sliders in response.body['data']['results']) {
        sliderList.add(SliderModels.fromJson(sliders));
        _sliderModels = sliderList;
        isSuccess = true;
        _errorMessage = null;
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _isSliderInProgress = false;
    return isSuccess;
  }
}
