import 'package:crafty_bay_app/app/controllers/auth_controller.dart';
import 'package:crafty_bay_app/features/auth/presentations/screens/login_screen.dart';
import 'package:crafty_bay_app/features/shared/presentation/screen/top_nav_bar_controller.dart';
import 'package:flutter/material.dart';

import '../widget/utils/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateNextScreen();
  }

  Future<void> _navigateNextScreen() async {
    await Future.delayed(Duration(seconds: 4));
    final bool isUserAlreadyLoggedIn = await AuthController.isifUserLoggedIn();
    if (isUserAlreadyLoggedIn) {
      await AuthController.getUserData();
      Navigator.pushNamedAndRemoveUntil(
        context,
        TopNavBarController.name,
        (context) => false,
      );
    } else {
      await AuthController.clearUserData();
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.name,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final localization = context.l10n;
    // final languageProvider = context.read<LanguageProviders>();
    // // Watch the ThemeProvider so the widget rebuilds when themeMode changes.
    // // Use a nullable watch to avoid a crash if the provider isn't registered.
    // final themeProvider = context.watch<ThemeProvider?>();
    // final isDark = themeProvider?.themeMode == ThemeMode.dark;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: Center(child: AppLogo(height: 120))),
            const SizedBox(height: 20),
            CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text("Version: 0.0.1"),
          ],
        ),
      ),
    );
  }
}
