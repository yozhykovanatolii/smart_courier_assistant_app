import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/user_firestore.dart';
import 'package:smart_courier_assistant_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserAuth _userAuth;
  final UserFirestore _userFirestore;

  AuthRepositoryImpl(this._userAuth, this._userFirestore);

  @override
  Future<void> signInUser(String email, String password) async {
    await _userAuth.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signInWithGoogle() async {
    final user = await _userAuth.signInWithGoogle();
    final isUserExist = await _userFirestore.isUserExist(user!.uid);
    if (!isUserExist) {
      await _userFirestore.saveUser(
        user.uid,
        fullName: user.displayName,
        phoneNumber: user.phoneNumber,
        avatarUrl: user.photoURL,
      );
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    return await _userAuth.resetPassword(email);
  }

  @override
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
    await _userFirestore.saveUser(
      userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
    );
  }

  @override
  Future<void> logOut() async => _userAuth.signOut();
}
