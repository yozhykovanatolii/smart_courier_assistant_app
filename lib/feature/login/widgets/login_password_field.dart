import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/ui/extensions/password_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordInputError = context.select<LoginCubit, PasswordInputError?>(
      (loginCubit) => loginCubit.state.passwordValidator.displayError,
    );
    final errorMessage = passwordInputError.mapPasswordInputErrorToString(
      context,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        AppTextField(
          hintText: 'exampleA#',
          obscureText: true,
          onChanged: context.read<LoginCubit>().setLoginPassword,
          isValid: errorMessage == null,
        ),
        if (errorMessage != null)
          Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.red,
              fontFamily: FontFamily.inter,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
