import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(
      hintText: 'enter your password',
      obscureText: true,
    );
  }
}
