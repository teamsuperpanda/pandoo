import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF1A1A1A);
  static const Color secondary = Color(0xFFF5F5F5);

  // Accent Colors
  static const Color bamboo = Color(0xFF4CAF50);
  static const Color bambooLight = Color(0xFFE8F5E9);

  // Neutral Colors
  static const Color pandaBlack = Color(0xFF1A1A1A);
  static const Color pandaGrey = Color(0xFFE0E0E0);
  static const Color pandaWhite = Color(0xFFFAFAFA);

  // UI Colors
  static const Color background = pandaWhite;
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFE53935);

  // Text Colors
  static const Color textPrimary = pandaBlack;
  static const Color textSecondary = Color(0xFF757575);

  // Gradients
  static const LinearGradient pandaGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1A1A1A),
      Color(0xFF2D2D2D),
    ],
  );
}
