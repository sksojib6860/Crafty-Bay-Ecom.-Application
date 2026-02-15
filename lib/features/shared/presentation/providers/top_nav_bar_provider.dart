import 'package:flutter/cupertino.dart';

class TopNavBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  set changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
