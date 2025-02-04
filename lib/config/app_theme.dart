import 'package:flutter/material.dart';

import '../core/resources/colors.dart';

class AppTheme {
  static const Color primaryColor = AppColors.primary;
  static const BorderRadius appPrimaryRadius =
      BorderRadius.all(Radius.circular(8));
  static const Color errorColor = AppColors.error;

  // Light Color Scheme
  static const ColorScheme _lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.lightPrimaryTextColor,
      primaryContainer: AppColors.primaryVariant,
      secondary: AppColors.complementary,
      onSecondary: AppColors.lightSecondaryTextColor,
      secondaryContainer: Color.fromRGBO(219, 234, 255, 1.0),
      surface: AppColors.backgroundColor,
      onSurface: AppColors.gray14,
      tertiaryContainer: AppColors.lightGraySurfaceColor,
      error: errorColor,
      onError: AppColors.white,
      onSecondaryContainer: AppColors.warningBg,
      onSurfaceVariant: AppColors.onCard);

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    colorScheme: _lightColorScheme,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    cardColor: AppColors.lightCardColor,
    cardTheme: const CardTheme(
      color: AppColors.lightCardColor,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: appPrimaryRadius,
        side: BorderSide(
          color: AppColors.lightCardBorderColor,
        ),
      ),
      elevation: 0,
    ),
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.surface,
      iconTheme: IconThemeData(color: _lightColorScheme.onPrimary),
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightColorScheme.primary,
        disabledBackgroundColor: AppColors.lightNotActiveButtonColor,
        foregroundColor: AppColors.white,
        disabledForegroundColor: AppColors.lightNotActiveButtonTextColor,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryVariant,
        side: const BorderSide(color: AppColors.primaryVariant, width: 1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    ),
  );
}
