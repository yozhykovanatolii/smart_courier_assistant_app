import 'package:formz/formz.dart';

enum PasswordInputError {
  empty,
  lengthLessEight,
  notExistUpperCaseLetter,
  notExistSpecialLetter,
}

class PasswordValidator extends FormzInput<String, PasswordInputError> {
  const PasswordValidator.pure() : super.pure('');

  const PasswordValidator.dirty({String password = ''}) : super.dirty(password);

  @override
  PasswordInputError? validator(String password) {
    if (password.isEmpty) return PasswordInputError.empty;
    if (password.length < 8) return PasswordInputError.lengthLessEight;
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return PasswordInputError.notExistUpperCaseLetter;
    }
    if (!RegExp(r'[!@#\$&*~%^()]').hasMatch(password)) {
      return PasswordInputError.notExistSpecialLetter;
    }
    return null;
  }
}
