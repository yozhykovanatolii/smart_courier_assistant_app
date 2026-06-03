// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class RegisterState {
  final EmailValidator emailValidator;
  final PasswordValidator passwordValidator;

  RegisterState({
    required this.emailValidator,
    required this.passwordValidator,
  });

  factory RegisterState.initial() {
    return RegisterState(
      emailValidator: const EmailValidator.pure(),
      passwordValidator: const PasswordValidator.pure(),
    );
  }

  RegisterState copyWith({
    EmailValidator? emailValidator,
    PasswordValidator? passwordValidator,
  }) {
    return RegisterState(
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
    );
  }
}
