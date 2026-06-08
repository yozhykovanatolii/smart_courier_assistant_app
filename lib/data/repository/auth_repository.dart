import 'package:smart_courier_assistant_app/data/datasource/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/firebase/firestore/user_firestore.dart';

class AuthRepository {
  final UserAuth _userAuth;
  final UserFirestore _userFirestore;

  AuthRepository(this._userAuth, this._userFirestore);

  Future<void> signInUser(String email, String password) async {
    await _userAuth.signInWithEmailAndPassword(email, password);
  }

  Future<void> signInWithGoogle() async {
    final user = await _userAuth.signInWithGoogle();
    final isUserExist = await _userFirestore.isUserExist(user!.uid);
    if (!isUserExist) {
      await _userFirestore.createUser(
        user.uid,
        fullName: user.displayName,
        phoneNumber: user.phoneNumber,
        avatarUrl: user.photoURL,
      );
    }
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
    await _userFirestore.createUser(
      userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
    );
  }

  Future<void> logOut() async => _userAuth.signOut();
}
