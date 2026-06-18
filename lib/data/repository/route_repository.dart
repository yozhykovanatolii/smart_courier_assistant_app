import 'package:smart_courier_assistant_app/data/datasource/local/settings_shared_preferences.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/recommendation_gpt_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/route_direction_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';
import 'package:smart_courier_assistant_app/data/models/api/risky_order_model.dart';
import 'package:smart_courier_assistant_app/data/models/api/route_analysis_model.dart';
import 'package:smart_courier_assistant_app/data/models/api/route_point.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';
import 'package:smart_courier_assistant_app/data/models/route_model.dart';

class RouteRepository {
  final RouteFirestore _routeFirestore;
  final UserAuth _userAuth;
  final RouteDirectionClient _directionClient;
  final RecommendationGptClient _gptClient;
  final SettingsSharedPreference _settingsSharedPreference;

  RouteRepository(
    this._routeFirestore,
    this._userAuth,
    this._directionClient,
    this._gptClient,
    this._settingsSharedPreference,
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

  Future<List<RoutePoint>> buildRoutePolyline(
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
    final languageCode = await _settingsSharedPreference.loadLanguageCode();
    final riskyOrders = ordersModel
        .where(
          (orderModel) =>
              orderModel.deliveryRisk == DeliveryRisk.delayed ||
              orderModel.deliveryRisk == DeliveryRisk.atRisk,
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
    final recommendation = await _gptClient.getRouteRecommendation(
      analysis,
      languageCode,
    );
    if (routeId != null && recommendation != null) {
      await _routeFirestore.saveRouteRecommendation(recommendation, routeId);
    }
    return recommendation ?? '';
  }

  Future<List<RouteModel>> getAllCourierRoutes() async {
    final courierId = _userAuth.userId;
    final routes = await _routeFirestore.getAllCourierRoutes(courierId);
    return routes;
  }
}
