import 'package:dio/dio.dart';
import 'package:smart_courier_assistant_app/data/models/api/login_request.dart';
import 'package:smart_courier_assistant_app/data/models/api/register_request.dart';
import 'package:smart_courier_assistant_app/exceptions/login_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/register_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/resending_code_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/verification_code_exception.dart';

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
      final data = exception.response?.data;
      if (data != null) {
        final String errorCode = data['error_code'];
        throw RegisterException.convertFromCode(errorCode);
      }
    }
  }

  Future<void> verifyEmail(String email, String otpCode) async {
    try {
      await _dio.post(
        '/auth/verify-email',
        data: {
          'email': email,
          'code': otpCode,
        },
      );
    } on DioException catch (exception) {
      final data = exception.response?.data;
      if (data != null) {
        final String errorCode = data['error_code'];
        throw VerificationCodeException.convertFromCode(errorCode);
      }
    }
  }

  Future<void> resendCode(String email) async {
    try {
      await _dio.post(
        '/auth/resend-code',
        data: {'email': email},
      );
    } on DioException catch (exception) {
      final data = exception.response?.data;
      if (data != null) {
        final String errorCode = data['error_code'];
        throw ResendingCodeException.convertFromCode(errorCode);
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
      final data = exception.response?.data;
      if (data != null) {
        final String errorCode = data['error_code'];
        throw LoginException.convertFromCode(errorCode);
      }
      rethrow;
    }
  }
}
