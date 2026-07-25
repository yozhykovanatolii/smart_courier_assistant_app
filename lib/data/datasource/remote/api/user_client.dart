import 'package:dio/dio.dart';
import 'package:smart_courier_assistant_app/data/models/api/user_info_model.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_credentials_exception.dart';

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
}
