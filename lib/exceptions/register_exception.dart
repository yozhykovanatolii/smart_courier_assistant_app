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

  factory RegisterException.convertFromCode(int code) {
    switch (code) {
      case 422:
        return RegisterException(RegisterErrorStatus.validationFailed);
      case 409:
        return RegisterException(RegisterErrorStatus.emailAlreadyInUse);
      default:
        return RegisterException();
    }
  }
}
