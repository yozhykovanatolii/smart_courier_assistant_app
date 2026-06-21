import 'package:smart_courier_assistant_app/data/models/api/route_point.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_point_entity.dart';

extension RoutePointMapper on RoutePoint {
  RoutePointEntity toEntity() {
    return RoutePointEntity(latitude: latitude, longitude: longitude);
  }
}
