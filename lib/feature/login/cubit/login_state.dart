import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/core/exceptions/login_exception.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class LoginState {
  final EmailValidator emailValidator;
  final PasswordValidator passwordValidator;
  final FormzSubmissionStatus loginStatus;
  final LoginErrorStatus? loginErrorStatus;

  LoginState({
    required this.emailValidator,
    required this.passwordValidator,
    required this.loginStatus,
    this.loginErrorStatus,
  });

  factory LoginState.initial() {
    return LoginState(
      emailValidator: const EmailValidator.pure(),
      passwordValidator: const PasswordValidator.pure(),
      loginStatus: FormzSubmissionStatus.initial,
    );
  }

  LoginState copyWith({
    EmailValidator? emailValidator,
    PasswordValidator? passwordValidator,
    FormzSubmissionStatus? loginStatus,
    LoginErrorStatus? loginErrorStatus,
    bool clearLoginException = false,
  }) {
    return LoginState(
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
      loginStatus: loginStatus ?? this.loginStatus,
      loginErrorStatus: clearLoginException
          ? null
          : loginErrorStatus ?? this.loginErrorStatus,
    );
  }
}
