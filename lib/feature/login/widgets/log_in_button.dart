import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_elevated_button.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {},
      padding: const EdgeInsetsGeometry.symmetric(
        vertical: 18,
      ),
      child: const Text(
        'Log In',
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
