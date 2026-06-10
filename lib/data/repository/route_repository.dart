import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';

class RouteRepository {
  final RouteFirestore _routeFirestore;
  final UserAuth _userAuth;

  RouteRepository(
    this._routeFirestore,
    this._userAuth,
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
}
