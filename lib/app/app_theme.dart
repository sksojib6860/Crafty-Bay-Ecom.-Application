import 'package:flutter/material.dart';

class AppTheme {
  static const Color _seedColor = Color(0xFF404040);

  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: _seedColor,
    brightness: Brightness.light,
  );
  static final ColorScheme _darkScheme = ColorScheme.fromSeed(
    seedColor: _seedColor,
    brightness: Brightness.dark,
  );

  static final ThemeData _lightTheme =
      ThemeData.from(colorScheme: _lightScheme, useMaterial3: true).copyWith(
        scaffoldBackgroundColor: _lightScheme.background,
        appBarTheme: AppBarTheme(
          backgroundColor: _lightScheme.primary,
          foregroundColor: _lightScheme.onPrimary,
          elevation: 1,
          centerTitle: true,
          iconTheme: IconThemeData(color: _lightScheme.onPrimary),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _lightScheme.primary,
            foregroundColor: _lightScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _lightScheme.surfaceVariant,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _lightScheme.primary, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: _lightScheme.surface,
          selectedItemColor: _lightScheme.primary,
          unselectedItemColor: _lightScheme.onSurface.withOpacity(0.6),
        ),
        cardTheme: CardThemeData(
          color: _lightScheme.surface,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  static final ThemeData _darkTheme =
      ThemeData.from(colorScheme: _darkScheme, useMaterial3: true).copyWith(
        scaffoldBackgroundColor: _darkScheme.background,
        appBarTheme: AppBarTheme(
          backgroundColor: _darkScheme.surface,
          foregroundColor: _darkScheme.onSurface,
          elevation: 1,
          centerTitle: true,
          iconTheme: IconThemeData(color: _darkScheme.onSurface),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _darkScheme.primary,
            foregroundColor: _darkScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _darkScheme.surfaceVariant,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _darkScheme.primary, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          hintStyle: TextStyle(color: _darkScheme.onSurface.withOpacity(0.7)),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: _darkScheme.surface,
          selectedItemColor: _darkScheme.primary,
          unselectedItemColor: _darkScheme.onSurface.withOpacity(0.6),
        ),
        cardTheme: CardThemeData(
          color: _darkScheme.surface,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;
}
