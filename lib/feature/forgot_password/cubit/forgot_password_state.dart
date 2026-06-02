import 'package:smart_courier_assistant_app/validation/email_validator.dart';

class ForgotPasswordState {
  final EmailValidator emailValidator;
  ForgotPasswordState({
    required this.emailValidator,
  });

  factory ForgotPasswordState.initial() {
    return ForgotPasswordState(
      emailValidator: const EmailValidator.pure(),
    );
  }

  ForgotPasswordState copyWith({
    EmailValidator? emailValidator,
  }) {
    return ForgotPasswordState(
      emailValidator: emailValidator ?? this.emailValidator,
    );
  }
}
