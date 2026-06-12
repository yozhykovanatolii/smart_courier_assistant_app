import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/recommendation_gpt_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/route_direction_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';
import 'package:smart_courier_assistant_app/data/models/api/risky_order_model.dart';
import 'package:smart_courier_assistant_app/data/models/api/route_analysis_model.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';

class RouteRepository {
  final RouteFirestore _routeFirestore;
  final UserAuth _userAuth;
  final RouteDirectionClient _directionClient;
  final RecommendationGptClient _gptClient;

  RouteRepository(
    this._routeFirestore,
    this._userAuth,
    this._directionClient,
    this._gptClient,
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

  Future<String> getCurrentRouteRecommendation() async {
    final courierId = _userAuth.userId;
    final routeModel = await _routeFirestore.getTodayRoute(courierId);
    return routeModel.recommendation;
  }

  Future<String> getRouteRecommendationByAI(
    List<OrderModel> ordersModel,
  ) async {
    final riskyOrders = ordersModel
        .where(
          (orderModel) =>
              orderModel.deliveryRisk == 'Delayed' ||
              orderModel.deliveryRisk == 'At risk',
        )
        .map(RiskyOrderModel.fromOrderModel)
        .toList();
    final currentTimeDateTime = DateTime.now();
    final analysis = RouteAnalysisModel(
      totalOrders: ordersModel.length,
      riskyOrders: riskyOrders,
      currentTime:
          '${currentTimeDateTime.hour}:${currentTimeDateTime.minute.toString().padLeft(2, '0')}',
    );
    final courierId = _userAuth.userId;
    final routeId = await _routeFirestore.getTodayRouteId(courierId);
    final recommendation = await _gptClient.getRouteRecommendation(analysis);
    if (routeId != null && recommendation != null) {
      await _routeFirestore.saveRouteRecommendation(recommendation, routeId);
    }
    return recommendation ?? '';
  }
}
