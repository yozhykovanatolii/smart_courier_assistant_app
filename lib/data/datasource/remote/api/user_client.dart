import 'package:dio/dio.dart';
import 'package:smart_courier_assistant_app/data/models/api/user_info_model.dart';
import 'package:smart_courier_assistant_app/data/models/api/user_update_request.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_credentials_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_validation_exception.dart';

class UserClient {
  final Dio _dio;

  UserClient(this._dio);

  Future<UserInfoModel> getCurrentUserData() async {
    try {
      final response = await _dio.get('/users/me');
      return UserInfoModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException {
      throw InvalidCredentialsException();
    }
  }

  Future<void> updateUser(
    String avatarUrl,
    String fullName,
    String phoneNumber,
  ) async {
    final userUpdateRequest = UserUpdateRequest(
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatarUrl: avatarUrl,
    );
    try {
      await _dio.patch(
        '/users/me',
        data: userUpdateRequest.toJson(),
      );
    } on DioException catch (exception) {
      final statusCode = exception.response?.statusCode;
      if (statusCode == 401) {
        throw InvalidCredentialsException();
      }
      if (statusCode == 422) {
        throw InvalidValidationException();
      }
    }
  }
}
