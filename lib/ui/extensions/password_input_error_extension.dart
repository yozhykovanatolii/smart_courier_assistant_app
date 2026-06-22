import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

extension PasswordInputErrorExtension on PasswordInputError? {
  String? mapPasswordInputErrorToString(BuildContext context) {
    final l10n = S.of(context);
    final passwordInputError = this;

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
