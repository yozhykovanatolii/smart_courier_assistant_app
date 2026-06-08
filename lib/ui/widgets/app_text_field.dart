import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.isValid,
    this.controller,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final bool isValid;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isValid ? const Color(0xFFEDF1F3) : Colors.red,
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
        controller: controller,
        obscureText: obscureText,
        cursorColor: AppColors.blue,
        onChanged: onChanged,
        obscuringCharacter: '*',
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
