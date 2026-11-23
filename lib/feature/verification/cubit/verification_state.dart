import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/validation/otp_code_validator.dart';

enum VerificationStatus { initial, loading, success, failure }

class VerificationState {
  VerificationState({
    required this.otpCodeValidator,
    required this.verificationStatus,
    this.email,
  });

  factory VerificationState.initial() {
    return VerificationState(
      otpCodeValidator: const OtpCodeValidator.pure(),
      verificationStatus: FormzSubmissionStatus.initial,
    );
  }

  final OtpCodeValidator otpCodeValidator;
  final FormzSubmissionStatus verificationStatus;
  final String? email;

  VerificationState copyWith({
    OtpCodeValidator? otpCodeValidator,
    FormzSubmissionStatus? verificationStatus,
    VerificationStatus? resendingCodeStatus,
    String? email,
    bool clearEmail = false,
  }) {
    return VerificationState(
      otpCodeValidator: otpCodeValidator ?? this.otpCodeValidator,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      email: clearEmail ? null : email ?? this.email,
    );
  }

  bool get isValid => Formz.validate([otpCodeValidator]);
}
