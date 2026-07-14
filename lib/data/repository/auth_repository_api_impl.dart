import 'package:smart_courier_assistant_app/data/datasource/remote/api/user_auth_client.dart';
import 'package:smart_courier_assistant_app/domain/repository/auth_repository.dart';

class AuthRepositoryApiImpl implements AuthRepository {
  final UserAuthClient _userAuthClient;

  AuthRepositoryApiImpl(this._userAuthClient);

  @override
  Future<void> logOut() async {
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) async {
    throw UnimplementedError();
  }

  @override
  Future<void> signInUser(String email, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() async {
    throw UnimplementedError();
  }

  @override
  Future<void> signUpUser(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    await _userAuthClient.registerUser(email, password, fullName, phoneNumber);
  }
}
