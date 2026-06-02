import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final emailInputError = context.select<LoginCubit, EmailInputError?>(
      (loginCubit) => loginCubit.state.emailValidator.displayError,
    );
    final errorMessage = _mapEmailInputErrorToString(
      context,
      emailInputError,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        AppTextField(
          hintText: 'example@gmail.com',
          onChanged: context.read<LoginCubit>().setLoginEmail,
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
