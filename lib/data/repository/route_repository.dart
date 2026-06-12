import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/route_direction_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';

class RouteRepository {
  final RouteFirestore _routeFirestore;
  final UserAuth _userAuth;
  final RouteDirectionClient _directionClient;

  RouteRepository(
    this._routeFirestore,
    this._userAuth,
    this._directionClient,
  );

  Future<String> createRoute() async {
    final courierId = _userAuth.userId;
    final routeId = await _routeFirestore.getTodayRouteId(courierId);
    if (routeId == null) {
      final newRouteId = await _routeFirestore.saveRoute(courierId: courierId);
      return newRouteId;
    }
    return routeId;
  }

  Future<List<LatLng>> buildRoutePolyline(
    List<OrderModel> orders,
    double startLat,
    double startLng,
  ) async {
    return await _directionClient.getRoutePolyline(
      orders,
      startLat,
      startLng,
    );
  }
}
