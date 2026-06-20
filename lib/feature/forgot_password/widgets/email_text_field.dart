import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:smart_courier_assistant_app/ui/extensions/email_input_error_extension.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final emailInputError = context
        .select<ForgotPasswordCubit, EmailInputError?>(
          (forgotPasswordCubit) =>
              forgotPasswordCubit.state.emailValidator.displayError,
        );
    final errorMessage = emailInputError.mapEmailInputErrorToMessage(context);

    return AppTextField(
      hintText: 'example@gmail.com',
      onChanged: context.read<ForgotPasswordCubit>().setUserEmail,
      errorMessage: errorMessage,
    );
  }
}
