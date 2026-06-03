import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/full_name_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class RegisterState {
  final EmailValidator emailValidator;
  final PasswordValidator passwordValidator;
  final FullNameValidator fullNameValidator;

  RegisterState({
    required this.emailValidator,
    required this.passwordValidator,
    required this.fullNameValidator,
  });

  factory RegisterState.initial() {
    return RegisterState(
      emailValidator: const EmailValidator.pure(),
      passwordValidator: const PasswordValidator.pure(),
      fullNameValidator: const FullNameValidator.pure(),
    );
  }

  RegisterState copyWith({
    EmailValidator? emailValidator,
    PasswordValidator? passwordValidator,
    FullNameValidator? fullNameValidator,
  }) {
    return RegisterState(
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
      fullNameValidator: fullNameValidator ?? this.fullNameValidator,
    );
  }
}
