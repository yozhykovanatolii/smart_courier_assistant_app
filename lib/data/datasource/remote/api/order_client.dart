import 'package:dio/dio.dart';
import 'package:smart_courier_assistant_app/data/models/api/order_create_request.dart';
import 'package:smart_courier_assistant_app/exceptions/access_denied_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/data_not_found_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_credentials_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_validation_exception.dart';

class OrderClient {
  final Dio _dio;

  OrderClient(this._dio);

  Future<void> createOrder(
    String clientFullName,
    String clientPhoneNumber,
    String address,
    DateTime deliveryBy,
    double latitude,
    double longitude,
  ) async {
    final orderCreate = OrderCreateRequest(
      clientFullName: clientFullName,
      clientPhoneNumber: clientPhoneNumber,
      deliveryBy: deliveryBy,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
    try {
      await _dio.post(
        '/orders',
        data: orderCreate.toJson(),
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

  Future<void> deleteOrder(int orderId) async {
    try {
      await _dio.post('/orders/$orderId');
    } on DioException catch (exception) {
      final statusCode = exception.response?.statusCode;
      if (statusCode == 401) {
        throw InvalidCredentialsException();
      }
      if (statusCode == 404) {
        throw DataNotFoundException();
      }
      if (statusCode == 403) {
        throw AccessDeniedException();
      }
    }
  }
}
