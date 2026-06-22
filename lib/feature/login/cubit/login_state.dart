import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/exceptions/login_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/login_with_google_exception.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';
import 'package:smart_courier_assistant_app/validation/password_validator.dart';

class LoginState {
  final EmailValidator emailValidator;
  final PasswordValidator passwordValidator;
  final FormzSubmissionStatus loginStatus;
  final FormzSubmissionStatus googleStatus;
  final LoginErrorStatus? loginErrorStatus;
  final LoginGoogleErrorStatus? loginGoogleErrorStatus;

  LoginState({
    required this.emailValidator,
    required this.passwordValidator,
    required this.loginStatus,
    required this.googleStatus,
    this.loginErrorStatus,
    this.loginGoogleErrorStatus,
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
    LoginGoogleErrorStatus? loginGoogleErrorStatus,
    bool clearLoginErrorStatus = false,
    bool clearLoginGoogleErrorStatus = false,
  }) {
    return LoginState(
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
      loginStatus: loginStatus ?? this.loginStatus,
      googleStatus: googleStatus ?? this.googleStatus,
      loginErrorStatus: clearLoginErrorStatus
          ? null
          : loginErrorStatus ?? this.loginErrorStatus,
      loginGoogleErrorStatus: clearLoginGoogleErrorStatus
          ? null
          : loginGoogleErrorStatus ?? this.loginGoogleErrorStatus,
    );
  }

  bool get isValid => Formz.validate([emailValidator, passwordValidator]);
}
