import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';

extension FullNameInputErrorExtension on FullNameInputError? {
  String? mapFullNameInputErrorToString(BuildContext context) {
    final l10n = S.of(context);
    final fullNameInputError = this;

    if (fullNameInputError == null) return null;

    switch (fullNameInputError) {
      case FullNameInputError.empty:
        return l10n.fullNameEmpty;
      case FullNameInputError.invalidFormat:
        return l10n.fullNameInvalidFormat;
    }
  }
}
