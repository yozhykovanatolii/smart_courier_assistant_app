import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_courier_assistant_app/core/exceptions/login_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/login_with_google_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/register_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/reset_password_exception.dart';

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

  Future<User?> signInWithGoogle() async {
    User? user;
    try {
      await GoogleSignIn.instance.initialize(
        serverClientId:
            '362802745760-vhl7hlfgcie0tv4v9jamn4nv3a5f5dsj.apps.googleusercontent.com',
      );
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final firebaseUser = await _firebaseAuth.signInWithCredential(credential);
      user = firebaseUser.user!;
    } on FirebaseAuthException catch (exception) {
      throw LoginWithGoogleException.convertFromCode(exception.code);
    } catch (_) {
      throw LoginWithGoogleException();
    }
    return user;
  }

  Future<String> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    String userID = '';
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userID = credential.user!.uid;
    } on FirebaseAuthException catch (exception) {
      throw RegisterException.convertFromCode(exception.code);
    } catch (_) {
      throw RegisterException();
    }
    return userID;
  }

  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (exception) {
      throw ResetPasswordException.convertFromCode(exception.code);
    } catch (_) {
      throw ResetPasswordException();
    }
  }

  Future<void> signOut() async => _firebaseAuth.signOut();

  Stream<User?> get user => _firebaseAuth.authStateChanges();
}
