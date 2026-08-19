enum RegisterErrorStatus {
  validationFailed,
  emailAlreadyInUse,
  unknown,
}

class RegisterException implements Exception {
  final RegisterErrorStatus registerErrorStatus;

  RegisterException([
    this.registerErrorStatus = RegisterErrorStatus.unknown,
  ]);

  factory RegisterException.convertFromCode(String errorCode) {
    switch (errorCode) {
      case 'validation_error':
        return RegisterException(RegisterErrorStatus.validationFailed);
      case 'email_already_use':
        return RegisterException(RegisterErrorStatus.emailAlreadyInUse);
      default:
        return RegisterException();
    }
  }
}
