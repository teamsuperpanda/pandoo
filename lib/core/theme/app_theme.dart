import 'package:flutter/material.dart';

class AppTheme {
  // Update color constants to pure black/white
  static const _pandaBlack = Color(0xFF000000); // Pure black
  static const _pandaWhite = Color(0xFFFFFFFF); // Pure white
  static const _pandaDarkGrey = Color(0xFF1E1E1E); // Add this line
// Keep for borders/disabled states

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _pandaBlack,
        primary: _pandaBlack,
        surface: _pandaWhite,
      ),
      scaffoldBackgroundColor: _pandaWhite,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: _pandaBlack,
        foregroundColor: _pandaWhite,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: _pandaWhite,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Update other theme components to use pure black/white
      iconTheme: const IconThemeData(
        color: _pandaBlack,
        size: 24,
      ),

      // Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: _pandaWhite,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _pandaBlack,
        ),
      ),

      // Button themes
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: _pandaBlack,
          foregroundColor: _pandaWhite,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _pandaBlack,
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _pandaWhite,
        brightness: Brightness.dark,
        primary: _pandaWhite,
        surface: _pandaBlack,
      ),
      scaffoldBackgroundColor: _pandaBlack,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: _pandaBlack,
        foregroundColor: _pandaWhite,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: _pandaWhite,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Update other theme components to use pure black/white
      iconTheme: const IconThemeData(
        color: _pandaWhite,
        size: 24,
      ),

      // Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: _pandaDarkGrey,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _pandaWhite,
        ),
      ),

      // Button themes
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: _pandaWhite,
          foregroundColor: _pandaBlack,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _pandaWhite,
        ),
      ),
    );
  }
}
