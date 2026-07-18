import 'package:smart_courier_assistant_app/data/datasource/local/secure_storage.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/user_auth_client.dart';
import 'package:smart_courier_assistant_app/domain/repository/auth_repository.dart';

class AuthRepositoryApiImpl implements AuthRepository {
  final UserAuthClient _userAuthClient;
  final SecureStorage _secureStorage;

  AuthRepositoryApiImpl(this._userAuthClient, this._secureStorage);

  @override
  Future<void> logOut() async {
    await _secureStorage.deleteToken('access');
    await _secureStorage.deleteToken('refresh');
  }

  @override
  Future<void> resetPassword(String email) async {
    throw UnimplementedError();
  }

  @override
  Future<void> signInUser(String email, String password) async {
    final response = await _userAuthClient.loginUser(email, password);
    await _secureStorage.saveToken('access', response['access_token']);
    await _secureStorage.saveToken('refresh', response['refresh_token']);
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
