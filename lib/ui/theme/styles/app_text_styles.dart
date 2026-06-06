import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class AppTextStyles {
  static final TextStyle splashTextStyle = const TextStyle(
    fontFamily: FontFamily.pacifico,
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle labelLarge = const TextStyle(
    color: AppColors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.plusJakartaSans,
  );
  static final TextStyle displaySmall = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.inter,
  );
  static final TextStyle bodySmall = const TextStyle(
    color: AppColors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
  );
  static final TextStyle hintStyle = const TextStyle(
    color: AppColors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
  );
  static final TextStyle bodyLarge = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle titleMedium = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
}
