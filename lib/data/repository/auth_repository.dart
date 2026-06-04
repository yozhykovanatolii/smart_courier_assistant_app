import 'package:smart_courier_assistant_app/data/datasource/firebase/firebase_auth/user_auth.dart';

class AuthRepository {
  final UserAuth _userAuth;

  AuthRepository(this._userAuth);

  Future<void> signInUser(String email, String password) async {
    await _userAuth.signInWithEmailAndPassword(email, password);
  }

  Future<void> signInWithGoogle() async {
    await _userAuth.signInWithGoogle();
  }

  Future<void> resetPassword(String email) async {
    return await _userAuth.resetPassword(email);
  }

  Future<void> signUpUser(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    final userId = await _userAuth.signUpWithEmailAndPassword(
      email,
      password,
    );
  }
}
