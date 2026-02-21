import 'package:flutter/cupertino.dart';

class TopNavBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void changeCategoryIndex() {
    _selectedIndex = 1;
    notifyListeners();
  }

  void backToHomePage() {
    _selectedIndex = 0;
    notifyListeners();
  }
}
