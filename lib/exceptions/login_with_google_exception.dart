enum LoginGoogleErrorStatus {
  accountWithDifferentCredential,
  invalidCredential,
  userDisabled,
  wrongPassword,
  unknown,
}

class LoginWithGoogleException implements Exception {
  final LoginGoogleErrorStatus googleErrorStatus;

  LoginWithGoogleException([
    this.googleErrorStatus = LoginGoogleErrorStatus.unknown,
  ]);

  factory LoginWithGoogleException.convertFromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return LoginWithGoogleException(
          LoginGoogleErrorStatus.accountWithDifferentCredential,
        );
      case 'invalid-credential':
        return LoginWithGoogleException(
          LoginGoogleErrorStatus.invalidCredential,
        );
      case 'user-disabled':
        return LoginWithGoogleException(
          LoginGoogleErrorStatus.userDisabled,
        );
      case 'wrong-password':
        return LoginWithGoogleException(
          LoginGoogleErrorStatus.wrongPassword,
        );
      default:
        return LoginWithGoogleException();
    }
  }
}
