import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';

enum HomeStatus { initial, loading, success, failure }

enum OrderErrorType {
  userNotFound,
  unknown,
  routeNotFound,
  ordersNotFound,
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
  final List<OrderModel> orders;
  final List<LatLng> routePoints;
  final HomeStatus orderStatus;
  final HomeStatus routeOptimizationStatus;
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
      orderStatus: HomeStatus.initial,
      routeOptimizationStatus: HomeStatus.initial,
      latitude: 50.4501,
      longitude: 30.5234,
    );
  }

  HomeState copyWith({
    List<OrderModel>? orders,
    List<LatLng>? routePoints,
    HomeStatus? orderStatus,
    HomeStatus? routeOptimizationStatus,
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
      errorType: errorType ?? this.errorType,
      userActionError: userActionError ?? this.userActionError,
      optimizationErrorType:
          optimizationErrorType ?? this.optimizationErrorType,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
