import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';
import 'package:smart_courier_assistant_app/ui/extensions/email_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';

class RegisterEmailTextField extends StatelessWidget {
  const RegisterEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final emailInputError = context.select<RegisterCubit, EmailInputError?>(
      (registerCubit) => registerCubit.state.emailValidator.displayError,
    );
    final errorMessage = emailInputError.mapEmailInputErrorToMessage(context);

    return AppTextField(
      hintText: 'example@gmail.com',
      onChanged: context.read<RegisterCubit>().setRegisterEmail,
      errorMessage: errorMessage,
    );
  }
}
