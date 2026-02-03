import 'package:flutter/cupertino.dart';

class LanguageProviders extends ChangeNotifier {
  Locale _currentLocale = Locale('en');

  final List<Locale> _supportedLocate = [Locale('en'), Locale('bn')];

  List<Locale> get supportedLocale => _supportedLocate;

  Locale get currentLocale => _currentLocale;

  void changeLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }
}
