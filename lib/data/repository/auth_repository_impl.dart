import 'package:smart_courier_assistant_app/data/datasource/local/secure_storage.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/user_auth_client.dart';
import 'package:smart_courier_assistant_app/data/manager/session_manager.dart';
import 'package:smart_courier_assistant_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserAuthClient _userAuthClient;
  final SecureStorage _secureStorage;
  final SessionManager _sessionManager;

  AuthRepositoryImpl(
    this._userAuthClient,
    this._secureStorage,
    this._sessionManager,
  );

  @override
  Future<void> logOut() async {
    await Future.wait([
      _secureStorage.deleteToken('access'),
      _secureStorage.deleteToken('refresh'),
    ]);
    _sessionManager.update(null);
  }

  @override
  Future<void> signInUser(String email, String password) async {
    final response = await _userAuthClient.loginUser(email, password);
    await Future.wait([
      _secureStorage.saveToken('access', response['access_token']),
      _secureStorage.saveToken('refresh', response['refresh_token']),
    ]);
  }

  @override
  Future<void> signUpUser(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    await _userAuthClient.registerUser(
      email,
      password,
      fullName,
      phoneNumber,
    );
  }

  @override
  Future<void> resendCode(String email) async {
    await _userAuthClient.resendCode(email);
  }

  @override
  Future<void> verifyEmail(String email, String otpCode) async {
    await _userAuthClient.verifyEmail(email, otpCode);
  }
}
