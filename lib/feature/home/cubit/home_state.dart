import 'package:smart_courier_assistant_app/data/models/order_model.dart';

enum HomeStatus { initial, loading, success, failure }

enum HomeErrorType {
  unknown,
  routeNotFound,
  ordersNotFound,
}

class HomeState {
  final List<OrderModel> orders;
  final HomeStatus orderStatus;
  final HomeErrorType? errorType;

  HomeState({
    required this.orders,
    required this.orderStatus,
    this.errorType,
  });

  factory HomeState.initial() {
    return HomeState(
      orders: [],
      orderStatus: HomeStatus.initial,
    );
  }

  HomeState copyWith({
    List<OrderModel>? orders,
    HomeStatus? orderStatus,
    HomeErrorType? errorType,
  }) {
    return HomeState(
      orders: orders ?? this.orders,
      orderStatus: orderStatus ?? this.orderStatus,
      errorType: errorType ?? this.errorType,
    );
  }
}
