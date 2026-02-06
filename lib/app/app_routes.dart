import 'package:crafty_bay_app/features/auth/presentations/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentations/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget widget = SizedBox();
    switch (settings.name) {
      case SplashScreen.name:
        widget = const SplashScreen();
        break;
      case SignupScreen.name:
        widget = const SignupScreen();
        break;
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
