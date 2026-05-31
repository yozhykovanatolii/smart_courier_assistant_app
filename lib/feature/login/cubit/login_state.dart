import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class LoginState {
  final EmailValidator emailValidator;
  final PasswordValidator passwordValidator;

  LoginState({
    required this.emailValidator,
    required this.passwordValidator,
  });

  factory LoginState.initial() {
    return LoginState(
      emailValidator: const EmailValidator.pure(),
      passwordValidator: const PasswordValidator.pure(),
    );
  }

  LoginState copyWith({
    EmailValidator? emailValidator,
    PasswordValidator? passwordValidator,
  }) {
    return LoginState(
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
    );
  }
}
