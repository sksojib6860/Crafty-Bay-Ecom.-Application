// File: `lib/features/auth/presentations/screens/splash_screen.dart`
import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/app/providers/language_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/providers/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    final languageProvider = context.read<LanguageProviders>();
    // Watch the ThemeProvider so the widget rebuilds when themeMode changes.
    // Use a nullable watch to avoid a crash if the provider isn't registered.
    final themeProvider = context.watch<ThemeProvider?>();
    final isDark = themeProvider?.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: Text(localization.hello)),
      body: Column(
        children: [
          Text(localization.changeYourLanguage),
          DropdownMenu(
            dropdownMenuEntries: languageProvider.supportedLocale.map((e) {
              return DropdownMenuEntry(value: e, label: e.languageCode);
            }).toList(),
            initialSelection: languageProvider.currentLocale,
            onSelected: (value) {
              languageProvider.changeLocale(value!);
            },
          ),
          IconButton(
            // Disable the button if provider is missing to avoid null errors.
            onPressed: themeProvider == null
                ? null
                : () => themeProvider.toggle(),
            // Show light icon when currently dark, and dark icon when currently light.
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            //tooltip: isDark ? 'Switch to light' : 'Switch to dark',
          ),
        ],
      ),
    );
  }
}
