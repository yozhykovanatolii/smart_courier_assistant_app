import 'package:formz/formz.dart';

enum OptCodeInputError {
  empty,
  tooShort,
}

class OtpCodeValidator extends FormzInput<String, OptCodeInputError> {
  const OtpCodeValidator.pure() : super.pure('');

  const OtpCodeValidator.dirty({String otpCode = ''}) : super.dirty(otpCode);

  @override
  OptCodeInputError? validator(String otpCode) {
    if (otpCode.isEmpty) return OptCodeInputError.empty;
    if (otpCode.length < 6) return OptCodeInputError.tooShort;
    return null;
  }
}
