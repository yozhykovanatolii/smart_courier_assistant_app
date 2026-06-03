import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/validation/phone_number_validator.dart';

extension PhoneNumberInputErrorExtension on PhoneNumberInputError? {
  String? mapPhoneNumberInputErrorToString(BuildContext context) {
    final l10n = S.of(context);
    final phoneNumberInputError = this;

    if (phoneNumberInputError == null) return null;

    switch (phoneNumberInputError) {
      case PhoneNumberInputError.empty:
        return l10n.phoneNumberEmpty;
      case PhoneNumberInputError.invalidFormat:
        return l10n.phoneNumberInvalidFormat;
    }
  }
}
