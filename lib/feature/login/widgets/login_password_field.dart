import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/ui/widgets/app_text_field.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordValidator = context.select<LoginCubit, PasswordValidator>(
      (loginCubit) => loginCubit.state.passwordValidator,
    );
    final errorMessage = _mapPasswordInputErrorToString(
      context,
      passwordValidator.error,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        AppTextField(
          hintText: 'exampleA#',
          obscureText: true,
          onChanged: context.read<LoginCubit>().setLoginPassword,
          isValid: passwordValidator.isPure || errorMessage == null,
        ),
        if (!passwordValidator.isPure && errorMessage != null)
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

  String? _mapPasswordInputErrorToString(
    BuildContext context,
    PasswordInputError? passwordInputError,
  ) {
    final l10n = S.of(context);

    if (passwordInputError == null) return null;

    switch (passwordInputError) {
      case PasswordInputError.empty:
        return l10n.passwordEmpty;
      case PasswordInputError.lengthLessEight:
        return l10n.passwordLengthLessEight;
      case PasswordInputError.notExistUpperCaseLetter:
        return l10n.passwordContainsUpperLetter;
      case PasswordInputError.notExistSpecialLetter:
        return l10n.passwordContainsSpecialCharacter;
    }
  }
}
