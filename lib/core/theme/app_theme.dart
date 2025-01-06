import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color.fromRGBO(26, 26, 26, 1),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      ),
      // Add other light theme customizations
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      ),
      // Add other dark theme customizations
    );
  }
}
