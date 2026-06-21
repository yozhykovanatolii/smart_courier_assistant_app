import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_point_entity.dart';

abstract interface class RouteRepository {
  Future<String> createRoute();
  Future<List<RoutePointEntity>> buildRoutePolyline(
    List<OrderEntity> orders,
    double startLat,
    double startLng,
  );
  Future<List<RouteEntity>> getAllCourierRoutes();
  Future<String> getCurrentRouteRecommendation();
  Future<String> getRouteRecommendationByAI(
    List<OrderEntity> ordersEntity,
  );
}
