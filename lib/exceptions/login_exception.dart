enum LoginErrorStatus {
  validationFailed,
  userNotFound,
  passwordNotVerified,
  unknown,
}

class LoginException implements Exception {
  final LoginErrorStatus errorStatus;

  LoginException([this.errorStatus = LoginErrorStatus.unknown]);

  factory LoginException.convertFromCode(String errorCode) {
    switch (errorCode) {
      case 'validation_error':
        return LoginException(LoginErrorStatus.validationFailed);
      case 'password_not_verified':
        return LoginException(LoginErrorStatus.passwordNotVerified);
      case 'user_not_found':
        return LoginException(LoginErrorStatus.userNotFound);
      default:
        return LoginException();
    }
  }
}
