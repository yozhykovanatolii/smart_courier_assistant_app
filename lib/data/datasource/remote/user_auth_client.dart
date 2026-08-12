import 'package:dio/dio.dart';
import 'package:smart_courier_assistant_app/data/models/api/login_request.dart';
import 'package:smart_courier_assistant_app/data/models/api/register_request.dart';
import 'package:smart_courier_assistant_app/exceptions/login_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/register_exception.dart';

class UserAuthClient {
  final Dio _dio;

  UserAuthClient(this._dio);

  Future<void> registerUser(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    final registerRequest = RegisterRequest(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
    try {
      await _dio.post(
        '/auth/register',
        data: registerRequest.toJson(),
      );
    } on DioException catch (exception) {
      final statusCode = exception.response?.statusCode;
      if (statusCode != null) {
        throw RegisterException.convertFromCode(statusCode);
      }
    }
  }

  Future<Map<String, dynamic>> loginUser(
    String email,
    String password,
  ) async {
    final loginRequest = LoginRequest(email: email, password: password);
    try {
      final response = await _dio.post(
        '/auth/login',
        data: loginRequest.toJson(),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (exception) {
      final statusCode = exception.response?.statusCode;
      if (statusCode != null) {
        throw LoginException.convertFromCode(statusCode);
      }
      rethrow;
    }
  }
}
