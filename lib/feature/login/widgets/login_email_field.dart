import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final emailValidator = context.select<LoginCubit, EmailValidator>(
      (loginCubit) => loginCubit.state.emailValidator,
    );
    final errorMessage = _mapEmailInputErrorToString(
      context,
      emailValidator.error,
    );

    return AppTextField(
      hintText: 'example@gmail.com',
      onChanged: context.read<LoginCubit>().setLoginEmail,
      errorMessage: emailValidator.isPure ? null : errorMessage,
    );
  }

  String? _mapEmailInputErrorToString(
    BuildContext context,
    EmailInputError? emailInputError,
  ) {
    final l10n = S.of(context);

    if (emailInputError == null) return null;

    switch (emailInputError) {
      case EmailInputError.empty:
        return l10n.emailEmpty;
      case EmailInputError.invalidFormat:
        return l10n.emailIncorrectFormat;
    }
  }
}
