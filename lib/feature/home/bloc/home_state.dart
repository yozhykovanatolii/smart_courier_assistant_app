import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_point_entity.dart';

enum HomeStatus { initial, loading, success, failure }

enum OrderErrorType {
  invalidCredentials,
  unknown,
  dataNotFound,
}

enum UserActionError {
  locationPermissionDenied,
  locationServiceDisabled,
  callUnavailable,
  messageUnavailable,
}

enum OptimizationErrorType {
  userNotFound,
  failedCalculateOptimalRoute,
}

class HomeState {
  final List<OrderEntity> orders;
  final List<RoutePointEntity> routePoints;
  final HomeStatus orderStatus;
  final HomeStatus routeOptimizationStatus;
  final String routeRecommendation;
  final OrderErrorType? errorType;
  final UserActionError? userActionError;
  final OptimizationErrorType? optimizationErrorType;
  final double latitude;
  final double longitude;

  HomeState({
    required this.orders,
    required this.routePoints,
    required this.orderStatus,
    required this.routeOptimizationStatus,
    required this.routeRecommendation,
    this.errorType,
    this.userActionError,
    this.optimizationErrorType,
    required this.latitude,
    required this.longitude,
  });

  factory HomeState.initial() {
    return HomeState(
      orders: [],
      routePoints: [],
      routeRecommendation: '',
      orderStatus: HomeStatus.initial,
      routeOptimizationStatus: HomeStatus.initial,
      latitude: 50.4501,
      longitude: 30.5234,
    );
  }

  HomeState copyWith({
    List<OrderEntity>? orders,
    List<RoutePointEntity>? routePoints,
    HomeStatus? orderStatus,
    HomeStatus? routeOptimizationStatus,
    String? routeRecommendation,
    OrderErrorType? errorType,
    UserActionError? userActionError,
    OptimizationErrorType? optimizationErrorType,
    double? latitude,
    double? longitude,
  }) {
    return HomeState(
      orders: orders ?? this.orders,
      routePoints: routePoints ?? this.routePoints,
      orderStatus: orderStatus ?? this.orderStatus,
      routeOptimizationStatus:
          routeOptimizationStatus ?? this.routeOptimizationStatus,
      routeRecommendation: routeRecommendation ?? this.routeRecommendation,
      errorType: errorType ?? this.errorType,
      userActionError: userActionError ?? this.userActionError,
      optimizationErrorType:
          optimizationErrorType ?? this.optimizationErrorType,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  String toString() {
    return 'HomeState(status: $orderStatus, orders: ${orders.length})';
  }
}
