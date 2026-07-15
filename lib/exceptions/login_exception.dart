enum LoginErrorStatus {
  validationFailed,
  invalidCredential,
  unknown,
}

class LoginException implements Exception {
  final LoginErrorStatus errorStatus;

  LoginException([this.errorStatus = LoginErrorStatus.unknown]);

  factory LoginException.convertFromCode(int code) {
    switch (code) {
      case 422:
        return LoginException(LoginErrorStatus.validationFailed);
      case 401:
        return LoginException(LoginErrorStatus.invalidCredential);
      default:
        return LoginException();
    }
  }
}
