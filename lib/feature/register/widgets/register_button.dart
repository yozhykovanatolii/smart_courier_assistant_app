import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {},
      padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
      backgroundColor: const Color(0xFF1D61E7),
      boxShadows: [
        const BoxShadow(
          spreadRadius: 1,
          color: Color(0xFF375DFB),
        ),
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 2,
          color: const Color(0xFF253EA7).withValues(alpha: 0.48),
        ),
      ],
      child: const Text(
        'Register',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.inter,
        ),
      ),
    );
  }
}
