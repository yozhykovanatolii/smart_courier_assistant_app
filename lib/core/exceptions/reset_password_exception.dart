enum ResetPasswordErrorStatus {
  invalidEmail,
  tooManyRequests,
  networkRequestFailed,
  unknown,
}

class ResetPasswordException {
  final ResetPasswordErrorStatus resetPasswordErrorStatus;

  ResetPasswordException([
    this.resetPasswordErrorStatus = ResetPasswordErrorStatus.unknown,
  ]);

  factory ResetPasswordException.convertFromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return ResetPasswordException(
          ResetPasswordErrorStatus.invalidEmail,
        );
      case 'too-many-requests':
        return ResetPasswordException(
          ResetPasswordErrorStatus.tooManyRequests,
        );
      case 'network-request-failed':
        return ResetPasswordException(
          ResetPasswordErrorStatus.networkRequestFailed,
        );
      default:
        return ResetPasswordException();
    }
  }
}
