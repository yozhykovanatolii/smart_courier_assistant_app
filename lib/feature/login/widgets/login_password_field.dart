import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
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

    return AppTextField(
      hintText: 'exampleA#',
      obscureText: true,
      onChanged: context.read<LoginCubit>().setLoginPassword,
      errorMessage: passwordValidator.isPure ? null : errorMessage,
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
