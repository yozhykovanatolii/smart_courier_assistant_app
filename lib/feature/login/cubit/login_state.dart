import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/exceptions/login_exception.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class LoginState {
  final EmailValidator emailValidator;
  final PasswordValidator passwordValidator;
  final FormzSubmissionStatus loginStatus;
  final FormzSubmissionStatus googleStatus;
  final LoginErrorStatus? loginErrorStatus;

  LoginState({
    required this.emailValidator,
    required this.passwordValidator,
    required this.loginStatus,
    required this.googleStatus,
    this.loginErrorStatus,
  });

  factory LoginState.initial() {
    return LoginState(
      emailValidator: const EmailValidator.pure(),
      passwordValidator: const PasswordValidator.pure(),
      loginStatus: FormzSubmissionStatus.initial,
      googleStatus: FormzSubmissionStatus.initial,
    );
  }

  LoginState copyWith({
    EmailValidator? emailValidator,
    PasswordValidator? passwordValidator,
    FormzSubmissionStatus? loginStatus,
    FormzSubmissionStatus? googleStatus,
    LoginErrorStatus? loginErrorStatus,
    bool clearLoginErrorStatus = false,
  }) {
    return LoginState(
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
      loginStatus: loginStatus ?? this.loginStatus,
      googleStatus: googleStatus ?? this.googleStatus,
      loginErrorStatus: clearLoginErrorStatus
          ? null
          : loginErrorStatus ?? this.loginErrorStatus,
    );
  }

  bool get isValid => Formz.validate([emailValidator, passwordValidator]);
}
