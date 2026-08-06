import 'package:smart_courier_assistant_app/data/models/api/order_optimization_model.dart';

class RouteOptimizationModel {
  final double courierLatitude;
  final double courierLongitude;
  final List<OrderOptimizationModel> ordersOptimization;

  RouteOptimizationModel({
    required this.courierLatitude,
    required this.courierLongitude,
    required this.ordersOptimization,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courier_latitude': courierLatitude,
      'courier_longitude': courierLongitude,
      'orders': ordersOptimization,
    };
  }
}
