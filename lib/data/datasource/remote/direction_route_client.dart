import 'package:dio/dio.dart';
import 'package:smart_courier_assistant_app/data/models/api/route_point.dart';

class DirectionRouteClient {
  final Dio _dio;

  DirectionRouteClient(this._dio);

  Future<List<RoutePoint>> getRoutePolyline(
    List<RoutePoint> routePoints,
  ) async {
    final response = await _dio.post(
      '/routes/today/polyline',
      data: {
        'route_points': routePoints.map((point) => point.toJson()).toList(),
      },
    );
    final jsonData = response.data as Map<String, dynamic>;
    final routePointsJson = jsonData['route_points'] as List<dynamic>;

    return routePointsJson
        .map(
          (routePointJson) =>
              RoutePoint.fromJson(routePointJson as Map<String, dynamic>),
        )
        .toList();
  }
}
