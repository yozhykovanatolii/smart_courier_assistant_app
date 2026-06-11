// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class HomeState {
  final List<OrderModel> orders;
  final HomeStatus orderStatus;
  final OrderErrorType? errorType;
  final UserActionError? userActionError;
  final double latitude;
  final double longitude;

  HomeState({
    required this.orders,
    required this.orderStatus,
    this.errorType,
    this.userActionError,
    required this.latitude,
    required this.longitude,
  });

  factory HomeState.initial() {
    return HomeState(
      orders: [],
      orderStatus: HomeStatus.initial,
      latitude: 50.4501,
      longitude: 30.5234,
    );
  }

  HomeState copyWith({
    List<OrderModel>? orders,
    HomeStatus? orderStatus,
    OrderErrorType? errorType,
    UserActionError? userActionError,
    double? latitude,
    double? longitude,
  }) {
    return HomeState(
      orders: orders ?? this.orders,
      orderStatus: orderStatus ?? this.orderStatus,
      errorType: errorType ?? this.errorType,
      userActionError: userActionError ?? this.userActionError,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
