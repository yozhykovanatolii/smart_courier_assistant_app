import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveToken(String tokenType, String token) async {
    await _storage.write(key: tokenType, value: token);
  }

  Future<String> getToken(String tokenType) async {
    return await _storage.read(key: tokenType) ?? '';
  }
}
