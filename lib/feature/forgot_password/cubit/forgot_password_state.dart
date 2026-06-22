import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/exceptions/reset_password_exception.dart';
import 'package:smart_courier_assistant_app/validation/email_validator.dart';

class ForgotPasswordState {
  final EmailValidator emailValidator;
  final FormzSubmissionStatus formStatus;
  final ResetPasswordErrorStatus? errorStatus;

  ForgotPasswordState({
    required this.emailValidator,
    required this.formStatus,
    this.errorStatus,
  });

  factory ForgotPasswordState.initial() {
    return ForgotPasswordState(
      emailValidator: const EmailValidator.pure(),
      formStatus: FormzSubmissionStatus.initial,
    );
  }

  bool get isValid => Formz.validate([emailValidator]);

  ForgotPasswordState copyWith({
    EmailValidator? emailValidator,
    FormzSubmissionStatus? formStatus,
    ResetPasswordErrorStatus? errorStatus,
    bool clearResetPasswordErrorStatus = false,
  }) {
    return ForgotPasswordState(
      emailValidator: emailValidator ?? this.emailValidator,
      formStatus: formStatus ?? this.formStatus,
      errorStatus: clearResetPasswordErrorStatus
          ? null
          : errorStatus ?? this.errorStatus,
    );
  }
}
