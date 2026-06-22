enum RegisterErrorStatus {
  invalidEmail,
  emailAlreadyInUse,
  weakPassword,
  unknown,
}

class RegisterException implements Exception {
  final RegisterErrorStatus registerErrorStatus;

  RegisterException([
    this.registerErrorStatus = RegisterErrorStatus.unknown,
  ]);

  factory RegisterException.convertFromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return RegisterException(RegisterErrorStatus.invalidEmail);
      case 'email-already-in-use':
        return RegisterException(RegisterErrorStatus.emailAlreadyInUse);
      case 'weak-password':
        return RegisterException(RegisterErrorStatus.weakPassword);
      default:
        return RegisterException();
    }
  }
}
