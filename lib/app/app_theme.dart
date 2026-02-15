import 'package:crafty_bay_app/app/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColor.themeColor,
    brightness: Brightness.light,
    progressIndicatorTheme: _circularProgressIndicatorTheme,
    scaffoldBackgroundColor: Colors.white,
    textTheme: _textTheme,
    inputDecorationTheme: _textFormField,
    filledButtonTheme: _filledButtonTheme,
    navigationBarTheme: _navigationBarTheme,
  );

  static final ThemeData _darkThemeData = ThemeData(
    colorSchemeSeed: AppColor.themeColor,
    brightness: Brightness.dark,
    progressIndicatorTheme: _circularProgressIndicatorTheme,
    scaffoldBackgroundColor: Colors.black,
    textTheme: _textTheme,
    inputDecorationTheme: _textFormField,
    filledButtonTheme: _filledButtonTheme,
    navigationBarTheme: _navigationBarTheme,
  );

  static NavigationBarThemeData get _navigationBarTheme {
    return NavigationBarThemeData(
      indicatorColor: AppColor.themeColor,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static ProgressIndicatorThemeData get _circularProgressIndicatorTheme =>
      ProgressIndicatorThemeData(color: AppColor.themeColor);

  static TextTheme get _textTheme {
    return TextTheme(
      bodyMedium: TextStyle(color: Colors.grey),
      headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      bodySmall: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
    );
  }

  static InputDecorationTheme get _textFormField {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.themeColor),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.themeColor),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.themeColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 12),
        backgroundColor: AppColor.themeColor,
      ),
    );
  }

  static ThemeData get lightTheme => _lightThemeData;
  static ThemeData get darkTheme => _darkThemeData;
}
