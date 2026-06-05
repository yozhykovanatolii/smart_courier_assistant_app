import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/theme/styles/app_text_styles.dart';

class AppTextFieldStyles {
  static InputDecorationThemeData get inputDecorationTheme {
    return InputDecorationThemeData(
      hintStyle: AppTextStyles.hintStyle,
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14),
    );
  }
}
