import 'package:smart_courier_assistant_app/data/datasource/local/settings_shared_preferences.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/recommendation_ai_client.dart';
import 'package:smart_courier_assistant_app/data/mapper/order_info_mapper.dart';
import 'package:smart_courier_assistant_app/data/models/api/risky_order_model.dart';
import 'package:smart_courier_assistant_app/data/models/api/route_analysis_model.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_point_entity.dart';
import 'package:smart_courier_assistant_app/domain/repository/route_repository.dart';

class RouteRepositoryApiImpl implements RouteRepository {
  final SettingsSharedPreference _settingsSharedPreference;
  final RecommendationAiClient _recommendationAiClient;

  RouteRepositoryApiImpl(
    this._settingsSharedPreference,
    this._recommendationAiClient,
  );

  @override
  Future<List<RoutePointEntity>> buildRoutePolyline(
    List<OrderEntity> orders,
    double startLat,
    double startLng,
  ) {
    // TODO: implement buildRoutePolyline
    throw UnimplementedError();
  }

  @override
  Future<String> createRoute() {
    // TODO: implement createRoute
    throw UnimplementedError();
  }

  @override
  Future<List<RouteEntity>> getAllCourierRoutes() {
    // TODO: implement getAllCourierRoutes
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentRouteRecommendation() async {
    return await _recommendationAiClient.getTodayRouteRecommendation();
  }

  @override
  Future<String> getRouteRecommendationByAI(
    List<OrderEntity> ordersEntity,
  ) async {
    final languageCode = await _settingsSharedPreference.loadLanguageCode();
    final riskyOrders = ordersEntity
        .map(OrderInfoMapper.fromEntity)
        .where(
          (orderModel) =>
              orderModel.deliveryRisk == 'Delayed' ||
              orderModel.deliveryRisk == 'At risk',
        )
        .map(RiskyOrderModel.fromOrderInfo)
        .toList();
    final analysis = RouteAnalysisModel(
      languageCode: languageCode,
      totalOrders: ordersEntity.length,
      riskyOrders: riskyOrders,
    );
    final recommendation = await _recommendationAiClient
        .generateRouteRecommendation(analysis);
    return recommendation;
  }
}
