import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // Private constructor
  AppTheme._();

  // Font Family Name - ensure this matches the family name in pubspec.yaml
  static const String fontFamily = 'Poppins';

  static TextStyle textStyle({required double size, required FontWeight weight, required Color color}) {
    return TextStyle(
      fontSize: size,
      fontFamily: fontFamily,
      fontWeight: weight,
      color: color,
    );
  }

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightModeSurface,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onSurface: AppColors.onSurface,
    ),
    scaffoldBackgroundColor: AppColors.lightModeBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.onSurface),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.darkModeSurface,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onSurface: AppColors.onSurface,
      error: AppColors.darkModeError,
      onError: AppColors.onError,
    ),
    scaffoldBackgroundColor: AppColors.darkModeBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkModeSurface,
      foregroundColor: AppColors.onSurface,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.onSurface),
    ),
  );
}
