import 'package:flutter/material.dart';

class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary Palette
  static const Color primary = Color(0xFF9381FF);
  static const Color primaryVariant = Color(0xFFB8B8FF);
  static const Color secondary = Color(0xFFF8F7FF);
  static const Color secondaryVariant = Color(0xFFFFEEDD);

  // Dark Mode Palette
  static const Color darkModeBackground = Color(0xFF121212);
  static const Color darkModeSurface = Color(0xFF1E1E1E);
  static const Color darkModeError = Color(0xFFCF6679);

  // Light Mode Palette
  static const Color lightModeBackground = Color(0xFFADD7F6);
  static const Color lightModeSurface = Color(0xFF87BFFF);
  static const Color lightModeError = Color(0xFFCF6679);

  // Text Colors
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.black;
  static const Color onBackground = Colors.white;
  static const Color onSurface = Colors.white;
  static const Color onError = Colors.black;

  // Custom semantic colors for notes (example)
  static const Color noteYellow = Color(0xFFFFF9C4);
  static const Color noteBlue = Color(0xFFE3F2FD);
  static const Color noteRed = Color(0xFFFFEBEE);

  // Gradient Colors
  static const Color gradientStart = Color(0xFF87BFFF);
  static const Color gradientEnd = Color(0xFFADD7F6);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientEnd],
  );
}
