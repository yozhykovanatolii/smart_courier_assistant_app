import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';
import 'package:smart_courier_assistant_app/ui/extensions/password_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class RegisterPasswordTextField extends StatelessWidget {
  const RegisterPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordInputError = context
        .select<RegisterCubit, PasswordInputError?>(
          (registerCubit) => registerCubit.state.passwordValidator.displayError,
        );
    final errorMessage = passwordInputError.mapPasswordInputErrorToString(
      context,
    );

    return AppTextField(
      hintText: 'exampleA#',
      obscureText: true,
      onChanged: context.read<RegisterCubit>().setRegisterPassword,
      errorMessage: errorMessage,
    );
  }
}
