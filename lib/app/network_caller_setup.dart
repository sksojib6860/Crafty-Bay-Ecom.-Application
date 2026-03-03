import 'package:flutter/material.dart';

import '../core/services/network_caller.dart';
import '../features/auth/presentations/screens/signup_screen.dart';
import 'crafty_bay_app.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: {'Content-Type': 'application/json', 'token': 'token'},
    onUserUnAuthorized: () {
      moveToSignInScreen();
    },
    deData: ["msg"],
  );
}

void moveToSignInScreen() {
  Navigator.pushNamed(
    CraftyBayApp.navigatorKey.currentContext!,
    SignupScreen.name,
  );
}
