import 'package:formz/formz.dart';
import 'package:smart_courier_assistant_app/exceptions/resending_code_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/verification_code_exception.dart';
import 'package:smart_courier_assistant_app/validation/otp_code_validator.dart';

class VerificationState {
  VerificationState({
    required this.otpCodeValidator,
    required this.verificationStatus,
    required this.resendingCodeStatus,
    this.verificationErrorStatus,
    this.resendingCodeErrorStatus,
    this.email,
  });

  factory VerificationState.initial() {
    return VerificationState(
      otpCodeValidator: const OtpCodeValidator.pure(),
      verificationStatus: FormzSubmissionStatus.initial,
      resendingCodeStatus: FormzSubmissionStatus.initial,
    );
  }

  final OtpCodeValidator otpCodeValidator;
  final FormzSubmissionStatus verificationStatus;
  final FormzSubmissionStatus resendingCodeStatus;
  final VerificationErrorStatus? verificationErrorStatus;
  final ResendingCodeErrorStatus? resendingCodeErrorStatus;
  final String? email;

  VerificationState copyWith({
    OtpCodeValidator? otpCodeValidator,
    FormzSubmissionStatus? verificationStatus,
    FormzSubmissionStatus? resendingCodeStatus,
    VerificationErrorStatus? verificationErrorStatus,
    ResendingCodeErrorStatus? resendingCodeErrorStatus,
    String? email,
    bool clearEmail = false,
    bool clearVerificationErrorStatus = false,
    bool clearResendingCodeErrorStatus = false,
  }) {
    return VerificationState(
      otpCodeValidator: otpCodeValidator ?? this.otpCodeValidator,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      resendingCodeStatus: resendingCodeStatus ?? this.resendingCodeStatus,
      email: clearEmail ? null : email ?? this.email,
      verificationErrorStatus: clearVerificationErrorStatus
          ? null
          : verificationErrorStatus ?? this.verificationErrorStatus,
      resendingCodeErrorStatus: clearResendingCodeErrorStatus
          ? null
          : resendingCodeErrorStatus ?? this.resendingCodeErrorStatus,
    );
  }

  bool get isValid => Formz.validate([otpCodeValidator]);
}
