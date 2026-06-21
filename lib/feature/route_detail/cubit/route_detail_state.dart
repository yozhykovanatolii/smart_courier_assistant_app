import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';

sealed class RouteDetailState {}

final class RouteDetailInitialState extends RouteDetailState {}

final class RouteDetailLoadingState extends RouteDetailState {}

final class RouteDetailSuccessState extends RouteDetailState {
  final List<OrderEntity> routeOrders;

  RouteDetailSuccessState(this.routeOrders);
}

enum RouteDetailErrorType {
  ordersNotFound,
  unknown,
}

final class RouteDetailFailureState extends RouteDetailState {
  final RouteDetailErrorType routeDetailErrorType;

  RouteDetailFailureState(this.routeDetailErrorType);
}
