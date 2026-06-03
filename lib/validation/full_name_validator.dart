import 'package:formz/formz.dart';

enum FullNameInputError {
  empty,
  invalidFormat,
}

class FullNameValidator extends FormzInput<String, FullNameInputError> {
  const FullNameValidator.pure() : super.pure('');

  const FullNameValidator.dirty({String fullName = ''}) : super.dirty(fullName);

  @override
  FullNameInputError? validator(String fullName) {
    if (fullName.isEmpty) return FullNameInputError.empty;
    if (RegExp(r'[!@#\$&*~%^()]').hasMatch(fullName)) {
      return FullNameInputError.invalidFormat;
    }
    return null;
  }
}
