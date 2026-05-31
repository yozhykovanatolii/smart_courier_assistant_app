import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: 'enter your password',
      obscureText: true,
      onChanged: context.read<LoginCubit>().setLoginPassword,
    );
  }
}
