enum LoginErrorStatus {
  invalidEmail,
  userDisabled,
  wrongPassword,
  invalidCredential,
  unknown,
}

class LoginException implements Exception {
  final LoginErrorStatus errorStatus;

  LoginException([this.errorStatus = LoginErrorStatus.unknown]);

  factory LoginException.convertFromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return LoginException(LoginErrorStatus.invalidEmail);
      case 'user-disabled':
        return LoginException(LoginErrorStatus.userDisabled);
      case 'wrong-password':
        return LoginException(LoginErrorStatus.wrongPassword);
      case 'invalid-credential':
        return LoginException(LoginErrorStatus.invalidCredential);
      default:
        return LoginException();
    }
  }
}
