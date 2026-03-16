import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/models/user_model.dart';

class AuthController {
  static UserModel? userModel;
  static String? token;

  static const String _tokenKey = 'token';
  static const String _userKey = 'user';

  static Future<void> saveUserData(
    String newToken,
    UserModel newUserData,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, newToken);
    await preferences.setString(_userKey, jsonEncode(newUserData.toJson()));
    userModel = newUserData;
    token = newToken;
  }

  static Future<void> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userModel = UserModel.fromJson(
      jsonDecode(preferences.getString(_userKey)!),
    );
    token = preferences.getString(_tokenKey);
  }

  static Future<bool> isifUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.containsKey(_tokenKey);
  }

  static Future<void> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_tokenKey);
    await preferences.remove(_userKey);
  }
}
