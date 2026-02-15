import 'package:crafty_bay_app/app/providers/theme_provider.dart';
import 'package:crafty_bay_app/features/shared/presentation/providers/top_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import 'app_routes.dart';
import 'app_theme.dart';
import 'providers/language_providers.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProviders()),
        ChangeNotifierProvider(create: (_) => TopNavBarProvider()),
      ],
      child: Consumer<LanguageProviders>(
        builder: (context, languageProviders, child) {
          final themeMode = context.watch<ThemeProvider>().themeMode;
          return MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            ///uses current translator
            locale: languageProviders.currentLocale,

            /// uses default translator
            supportedLocales: languageProviders.supportedLocale,

            /// uses translator
            onGenerateRoute: AppRoutes.onGenerateRoute,

            /// uses page navigation
            themeMode: themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
          );
        },
      ),
    );
  }
}
