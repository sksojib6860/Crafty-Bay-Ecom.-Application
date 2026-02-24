import 'package:flutter/material.dart';

import '../features/auth/presentations/screens/login_screen.dart';
import '../features/auth/presentations/screens/otp_screen.dart';
import '../features/auth/presentations/screens/signup_screen.dart';
import '../features/auth/presentations/screens/splash_screen.dart';
import '../features/product/presentations/screen/product_list_screen.dart';
import '../features/product/presentations/screen/products_details_screen.dart';
import '../features/shared/presentation/screen/top_nav_bar_controller.dart';

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
      case OtpVerificationScreen.name:
        widget = const OtpVerificationScreen();
        break;
      case LoginScreen.name:
        widget = const LoginScreen();
        break;
      case TopNavBarController.name:
        widget = const TopNavBarController();
        break;
      case ProductListScreen.name:
        final String categoryName = settings.arguments as String;
        widget = ProductListScreen(categoryName: categoryName);
        break;
      case ProductsDetailsScreen.name:
        widget = ProductsDetailsScreen();
        break;
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
