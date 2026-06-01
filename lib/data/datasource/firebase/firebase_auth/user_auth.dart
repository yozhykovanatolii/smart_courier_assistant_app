import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_courier_assistant_app/core/exceptions/login_exception.dart';

class UserAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (exception) {
      throw LoginException.convertFromCode(exception.code);
    } catch (_) {
      throw LoginException();
    }
  }
}
