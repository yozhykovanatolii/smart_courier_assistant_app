import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/ui/app_colors.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: AppColors.blue500,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.inter,
        ),
      ),
    );
  }
}
