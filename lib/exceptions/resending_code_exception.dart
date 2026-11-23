enum ResendingCodeErrorStatus {
  validationFailed,
  userNotFound,
  emailAlreadyVerified,
  unknown,
}

class ResendingCodeException implements Exception {
  ResendingCodeException([
    this.errorStatus = ResendingCodeErrorStatus.unknown,
  ]);

  factory ResendingCodeException.convertFromCode(String code) {
    switch (code) {
      case 'validation_error':
        return ResendingCodeException(
          ResendingCodeErrorStatus.validationFailed,
        );
      case 'user_not_found':
        return ResendingCodeException(
          ResendingCodeErrorStatus.userNotFound,
        );
      case 'email_already_verified':
        return ResendingCodeException(
          ResendingCodeErrorStatus.emailAlreadyVerified,
        );
      default:
        return ResendingCodeException();
    }
  }

  final ResendingCodeErrorStatus errorStatus;
}
