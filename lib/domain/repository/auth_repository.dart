abstract interface class AuthRepository {
  Future<void> signInUser(String email, String password);
  Future<void> signUpUser(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  );
  Future<void> verifyEmail(String email, String otpCode);
  Future<void> resendCode(String email);
  Future<void> logOut();
}
