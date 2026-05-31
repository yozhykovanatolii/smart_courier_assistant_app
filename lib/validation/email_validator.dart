import 'package:formz/formz.dart';

enum EmailInputError {
  empty,
  invalidFormat,
}

class EmailValidator extends FormzInput<String, EmailInputError> {
  const EmailValidator.pure() : super.pure('');

  const EmailValidator.dirty({String email = ''}) : super.dirty(email);

  @override
  EmailInputError? validator(String email) {
    if (email.isEmpty) return EmailInputError.empty;
    if (email.endsWith('@gmail.com')) return EmailInputError.invalidFormat;
    return null;
  }
}
