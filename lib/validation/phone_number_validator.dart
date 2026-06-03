import 'package:formz/formz.dart';

enum PhoneNumberInputError {
  empty,
  invalidFormat,
}

class PhoneNumberValidator extends FormzInput<String, PhoneNumberInputError> {
  const PhoneNumberValidator.pure() : super.pure('');

  const PhoneNumberValidator.dirty({String phoneNumber = ''})
    : super.dirty(phoneNumber);

  @override
  PhoneNumberInputError? validator(String phoneNumber) {
    if (phoneNumber.isEmpty) return PhoneNumberInputError.empty;
    final cleaned = phoneNumber.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    final reInternational = RegExp(r'^\+380\d{9}$');
    if (!reInternational.hasMatch(cleaned)) {
      return PhoneNumberInputError.invalidFormat;
    }
    return null;
  }
}
