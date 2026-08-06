import 'package:dio/dio.dart';
import 'package:smart_courier_assistant_app/data/models/api/order_optimization_model.dart';
import 'package:smart_courier_assistant_app/data/models/api/route_optimization_model.dart';
import 'package:smart_courier_assistant_app/exceptions/access_denied_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_credentials_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/optimization_route_exception.dart';

class RouteClient {
  final Dio _dio;

  RouteClient(this._dio);

  Future<void> optimizeRoute(
    double courierLatitude,
    double courierLongitude,
    List<OrderOptimizationModel> ordersOptimization,
  ) async {
    final routeOptimization = RouteOptimizationModel(
      courierLatitude: courierLatitude,
      courierLongitude: courierLongitude,
      ordersOptimization: ordersOptimization,
    );

    try {
      await _dio.post(
        '/routes/optimize',
        data: routeOptimization.toMap(),
      );
    } on DioException catch (exception) {
      final statusCode = exception.response?.statusCode;
      if (statusCode == 401) {
        throw InvalidCredentialsException();
      }
      if (statusCode == 403) {
        throw AccessDeniedException();
      }
      if (statusCode == 502) {
        throw OptimizationRouteException();
      }
    }
  }
}
