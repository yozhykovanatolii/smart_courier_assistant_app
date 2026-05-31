import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(
      hintText: 'example@gmail.com',
    );
  }
}
