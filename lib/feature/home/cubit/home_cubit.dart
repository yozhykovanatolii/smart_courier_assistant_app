import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smart_courier_assistant_app/core/exceptions/geolocation_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/optimization_route_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/orders_not_found_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/route_not_found_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/user_not_found_exception.dart';
import 'package:smart_courier_assistant_app/data/repository/geolocation_repository.dart';
import 'package:smart_courier_assistant_app/data/repository/order_repository.dart';
import 'package:smart_courier_assistant_app/data/repository/route_repository.dart';
import 'package:smart_courier_assistant_app/data/repository/user_repository.dart';
import 'package:smart_courier_assistant_app/feature/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final OrderRepository _orderRepository;
  final UserRepository _userRepository;
  final GeolocationRepository _geolocationRepository;
  final RouteRepository _routeRepository;

  HomeCubit(
    this._orderRepository,
    this._userRepository,
    this._geolocationRepository,
    this._routeRepository,
  ) : super(HomeState.initial());

  Future<void> fetchOrders() async {
    emit(state.copyWith(orderStatus: HomeStatus.loading));
    try {
      final activeOrders = await _orderRepository.getAllCourierActiveOrders();
      final routeRecommendation = await _routeRepository
          .getCurrentRouteRecommendation();
      emit(
        state.copyWith(
          orderStatus: HomeStatus.success,
          orders: activeOrders,
          routeRecommendation: routeRecommendation,
        ),
      );
    } on UserNotFoundException {
      emit(
        state.copyWith(
          orderStatus: HomeStatus.failure,
          errorType: OrderErrorType.userNotFound,
        ),
      );
    } on RouteNotFoundException {
      emit(
        state.copyWith(
          orderStatus: HomeStatus.failure,
          errorType: OrderErrorType.routeNotFound,
        ),
      );
    } on OrdersNotFoundException {
      emit(
        state.copyWith(
          orderStatus: HomeStatus.failure,
          errorType: OrderErrorType.ordersNotFound,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          orderStatus: HomeStatus.failure,
          errorType: OrderErrorType.unknown,
        ),
      );
    }
  }

  Future<void> openCallDialer(String clientPhoneNumber) async {
    try {
      await _userRepository.callUserDialer(clientPhoneNumber);
    } catch (_) {
      emit(
        state.copyWith(
          userActionError: UserActionError.callUnavailable,
        ),
      );
    }
  }

  Future<void> openUserMessanger(String clientPhoneNumber) async {
    try {
      await _userRepository.messageUser(clientPhoneNumber);
    } catch (_) {
      emit(
        state.copyWith(
          userActionError: UserActionError.messageUnavailable,
        ),
      );
    }
  }

  Future<void> getUserLocation() async {
    try {
      final location = await _geolocationRepository.getCurrentLocation();
      emit(
        state.copyWith(
          latitude: location.latitude,
          longitude: location.longitude,
        ),
      );
    } on PermissionDeniedException {
      emit(
        state.copyWith(
          userActionError: UserActionError.locationPermissionDenied,
        ),
      );
    } on GeolocationException {
      emit(
        state.copyWith(
          userActionError: UserActionError.locationServiceDisabled,
        ),
      );
    }
  }

  Future<void> optimizeOrdersRoute() async {
    emit(
      state.copyWith(routeOptimizationStatus: HomeStatus.loading),
    );
    try {
      final updatedOrders = await _orderRepository.optimizeOrdersRoute(
        state.orders,
        state.latitude,
        state.longitude,
      );
      final recommendation = await _routeRepository.getRouteRecommendationByAI(
        updatedOrders,
      );
      final routePoints = await _routeRepository.buildRoutePolyline(
        updatedOrders,
        state.latitude,
        state.longitude,
      );
      emit(
        state.copyWith(
          orders: updatedOrders,
          routePoints: routePoints,
          routeRecommendation: recommendation,
          routeOptimizationStatus: HomeStatus.success,
        ),
      );
    } on OptimizationRouteException {
      emit(
        state.copyWith(
          optimizationErrorType:
              OptimizationErrorType.failedCalculateOptimalRoute,
          routeOptimizationStatus: HomeStatus.failure,
        ),
      );
    } on UserNotFoundException {
      emit(
        state.copyWith(
          optimizationErrorType: OptimizationErrorType.userNotFound,
          routeOptimizationStatus: HomeStatus.failure,
        ),
      );
    }
  }
}
