import 'package:flutter/material.dart';

class AppTheme {
  static const _pandaBlack = Color(0xFF000000); // Pure black
  static const _pandaWhite = Color(0xFFFFFFFF); // Pure white
  static const _pandaDarkGrey = Color(0xFF1E1E1E);

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

      iconTheme: const IconThemeData(
        color: _pandaBlack,
        size: 24,
      ),

      // Dialog Theme
      dialogTheme: const DialogThemeData(
        backgroundColor: _pandaWhite,
        titleTextStyle: TextStyle(
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
      // Popup menus should use the same white surface as other material cards
      // to avoid the default Material 3 surface tint (pinkish) on our menus.
      popupMenuTheme: const PopupMenuThemeData(
        color: _pandaWhite,
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

      iconTheme: const IconThemeData(
        color: _pandaWhite,
        size: 24,
      ),

      // Dialog Theme
      dialogTheme: const DialogThemeData(
        backgroundColor: _pandaDarkGrey,
        titleTextStyle: TextStyle(
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
      // Popup menus should use dark-themed surface in dark mode so that they
      // don't get a pink tint from the color scheme. Use the dark grey
      // background already used for dialogs in dark mode.
      popupMenuTheme: const PopupMenuThemeData(
        color: _pandaDarkGrey,
      ),
    );
  }
}
