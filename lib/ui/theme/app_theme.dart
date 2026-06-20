import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/theme/styles/app_text_field_styles.dart';
import 'package:smart_courier_assistant_app/ui/theme/styles/app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: AppTextFieldStyles.inputDecorationTheme,
      colorScheme: const ColorScheme.light(
        surface: Colors.white,
        outline: AppColors.grey300,
        error: Colors.red,
        shadow: AppColors.grey500,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      textTheme: TextTheme(
        titleMedium: AppTextStyles.titleMedium,
        displaySmall: AppTextStyles.displaySmall,
        labelLarge: AppTextStyles.labelLarge,
        bodyLarge: AppTextStyles.bodyLarge,
        bodySmall: AppTextStyles.bodySmall,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: AppTextFieldStyles.inputDecorationTheme,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.darkSurface,
        outline: AppColors.darkOutline,
        error: AppColors.darkError,
        shadow: Colors.black,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.blue,
      ),
      textTheme: TextTheme(
        titleMedium: AppTextStyles.titleMedium,
        displaySmall: AppTextStyles.displaySmall,
        labelLarge: AppTextStyles.labelLarge,
        bodyLarge: AppTextStyles.bodyLarge,
        bodySmall: AppTextStyles.bodySmall,
      ),
    );
  }
}
