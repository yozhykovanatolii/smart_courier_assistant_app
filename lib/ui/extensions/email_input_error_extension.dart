import 'package:flutter/widgets.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';

extension EmailInputErrorExtension on EmailInputError? {
  String? mapEmailInputErrorToMessage(BuildContext context) {
    final l10n = S.of(context);
    final emailInputError = this;

    if (emailInputError == null) return null;

    switch (emailInputError) {
      case EmailInputError.empty:
        return l10n.emailEmpty;
      case EmailInputError.invalidFormat:
        return l10n.emailIncorrectFormat;
    }
  }
}
