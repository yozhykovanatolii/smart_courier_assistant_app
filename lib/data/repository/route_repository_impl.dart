import 'package:smart_courier_assistant_app/data/datasource/local/settings_shared_preferences.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/recommendation_gpt_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/route_direction_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/order_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';
import 'package:smart_courier_assistant_app/data/mapper/order_mapper.dart';
import 'package:smart_courier_assistant_app/data/mapper/route_mapper.dart';
import 'package:smart_courier_assistant_app/data/mapper/route_point_mapper.dart';
import 'package:smart_courier_assistant_app/data/models/api/risky_order_model.dart';
import 'package:smart_courier_assistant_app/data/models/api/route_analysis_model.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_point_entity.dart';
import 'package:smart_courier_assistant_app/domain/repository/route_repository.dart';

class RouteRepositoryImpl implements RouteRepository {
  final RouteFirestore _routeFirestore;
  final OrderFirestore _orderFirestore;
  final UserAuth _userAuth;
  final RouteDirectionClient _directionClient;
  final RecommendationGptClient _gptClient;
  final SettingsSharedPreference _settingsSharedPreference;

  RouteRepositoryImpl(
    this._routeFirestore,
    this._userAuth,
    this._directionClient,
    this._gptClient,
    this._settingsSharedPreference,
    this._orderFirestore,
  );

  @override
  Future<String> createRoute() async {
    final courierId = _userAuth.userId;
    final routeId = await _routeFirestore.getTodayRouteId(courierId);
    if (routeId == null) {
      final newRouteId = await _routeFirestore.saveRoute(courierId: courierId);
      return newRouteId;
    }
    return routeId;
  }

  @override
  Future<List<RoutePointEntity>> buildRoutePolyline(
    List<OrderEntity> orders,
    double startLat,
    double startLng,
  ) async {
    final ordersModel = orders
        .map((order) => OrderMapper.fromEntity(order))
        .toList();
    final routePoints = await _directionClient.getRoutePolyline(
      ordersModel,
      startLat,
      startLng,
    );
    return routePoints.map((routePoint) => routePoint.toEntity()).toList();
  }

  @override
  Future<String> getCurrentRouteRecommendation() async {
    final courierId = _userAuth.userId;
    final routeModel = await _routeFirestore.getTodayRoute(courierId);
    return routeModel.recommendation;
  }

  @override
  Future<String> getRouteRecommendationByAI(
    List<OrderEntity> ordersEntity,
  ) async {
    final languageCode = await _settingsSharedPreference.loadLanguageCode();
    final riskyOrders = ordersEntity
        .map(OrderMapper.fromEntity)
        .where(
          (orderModel) =>
              orderModel.deliveryRisk == 'Delayed' ||
              orderModel.deliveryRisk == 'At risk',
        )
        .map(RiskyOrderModel.fromOrderModel)
        .toList();
    final analysis = RouteAnalysisModel(
      languageCode: languageCode,
      totalOrders: ordersEntity.length,
      riskyOrders: riskyOrders,
    );
    final courierId = _userAuth.userId;
    final routeId = await _routeFirestore.getTodayRouteId(courierId);
    final recommendation = await _gptClient.getRouteRecommendation(analysis);
    if (routeId != null && recommendation != null) {
      await _routeFirestore.saveRouteRecommendation(recommendation, routeId);
    }
    return recommendation ?? '';
  }

  @override
  Future<List<RouteEntity>> getAllCourierRoutes() async {
    final courierId = _userAuth.userId;
    final routes = await _routeFirestore.getAllCourierRoutes(courierId);
    final futures = routes.map((route) async {
      final ordersModel = await _orderFirestore.getAllRouteOrders(
        route.routeId,
      );
      return route.toEntity(ordersModel);
    }).toList();
    return await Future.wait(futures);
  }
}
