enum VerificationErrorStatus {
  validationFailed,
  invalidOtpCode,
  unknown,
}

class VerificationCodeException implements Exception {
  VerificationCodeException([
    this.errorStatus = VerificationErrorStatus.unknown,
  ]);

  factory VerificationCodeException.convertFromCode(String code) {
    switch (code) {
      case 'validation_error':
        return VerificationCodeException(
          VerificationErrorStatus.validationFailed,
        );
      case 'invalid_otp_code':
        return VerificationCodeException(
          VerificationErrorStatus.invalidOtpCode,
        );
      default:
        return VerificationCodeException();
    }
  }

  final VerificationErrorStatus errorStatus;
}
