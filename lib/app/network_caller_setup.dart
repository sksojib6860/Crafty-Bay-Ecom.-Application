import 'package:crafty_bay_app/app/crafty_bay_app.dart';
import 'package:crafty_bay_app/core/services/network_caller.dart';
import 'package:crafty_bay_app/features/auth/presentations/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: {'Content-Type': 'application/json', 'token': 'token'},
    onUserUnAuthorized: () {
      moveToSignInScreen();
    },
    deData: ['data'],
  );
}

void moveToSignInScreen() {
  Navigator.pushNamed(
    CraftyBayApp.navigatorKey.currentContext!,
    SignupScreen.name,
  );
}
