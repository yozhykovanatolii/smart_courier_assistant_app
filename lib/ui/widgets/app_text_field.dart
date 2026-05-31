import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/ui/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.errorMessage,
    this.obscureText = false,
  });

  final String hintText;
  final ValueChanged<String>? onChanged;
  final String? errorMessage;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFEDF1F3),
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 2,
            color: const Color(0xFFE4E5E7).withValues(alpha: 0.24),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        cursorColor: AppColors.blue,
        style: const TextStyle(
          color: AppColors.black,
          fontFamily: FontFamily.inter,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        onChanged: onChanged,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorMessage,
          hintStyle: const TextStyle(
            color: AppColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.inter,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
        ),
      ),
    );
  }
}
