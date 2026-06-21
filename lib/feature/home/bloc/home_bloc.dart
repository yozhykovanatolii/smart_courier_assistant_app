import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smart_courier_assistant_app/core/exceptions/geolocation_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/optimization_route_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/orders_not_found_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/route_not_found_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/user_not_found_exception.dart';
import 'package:smart_courier_assistant_app/domain/repository/geolocation_repository.dart';
import 'package:smart_courier_assistant_app/domain/repository/order_repository.dart';
import 'package:smart_courier_assistant_app/domain/repository/route_repository.dart';
import 'package:smart_courier_assistant_app/domain/repository/user_repository.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_event.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final OrderRepository _orderRepository;
  final UserRepository _userRepository;
  final GeolocationRepository _geolocationRepository;
  final RouteRepository _routeRepository;

  HomeBloc(
    this._orderRepository,
    this._userRepository,
    this._geolocationRepository,
    this._routeRepository,
  ) : super(HomeState.initial()) {
    on<HomeOrdersFetched>(_fetchOrders);
    on<HomeCallDialerOpened>(_openCallDialer);
    on<HomeMessengerOpened>(_openUserMessanger);
    on<HomeLocationFetched>(_getUserLocation);
    on<HomeRouteOptimized>(_optimizeOrdersRoute);
  }

  Future<void> _fetchOrders(
    HomeOrdersFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(orderStatus: HomeStatus.loading));
    unawaited(_loadRouteRecommendation(emit));
    await emit.onEach(
      _orderRepository.getAllCourierActiveOrders(),
      onData: (activeOrders) {
        emit(
          state.copyWith(
            orderStatus: HomeStatus.success,
            orders: activeOrders,
          ),
        );
      },
      onError: (error, stackTrace) {
        if (error is OrdersNotFoundException) {
          emit(
            state.copyWith(
              orderStatus: HomeStatus.failure,
              errorType: OrderErrorType.ordersNotFound,
            ),
          );
          return;
        }
        emit(
          state.copyWith(
            orderStatus: HomeStatus.failure,
            errorType: OrderErrorType.unknown,
          ),
        );
      },
    );
  }

  Future<void> _loadRouteRecommendation(Emitter<HomeState> emit) async {
    try {
      final routeRecommendation = await _routeRepository
          .getCurrentRouteRecommendation();
      emit(state.copyWith(routeRecommendation: routeRecommendation));
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
    }
  }

  Future<void> _openCallDialer(
    HomeCallDialerOpened event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _userRepository.callUserDialer(event.clientPhoneNumber);
    } catch (_) {
      emit(
        state.copyWith(
          userActionError: UserActionError.callUnavailable,
        ),
      );
    }
  }

  Future<void> _openUserMessanger(
    HomeMessengerOpened event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _userRepository.messageUser(event.clientPhoneNumber);
    } catch (_) {
      emit(
        state.copyWith(
          userActionError: UserActionError.messageUnavailable,
        ),
      );
    }
  }

  Future<void> _getUserLocation(
    HomeLocationFetched event,
    Emitter<HomeState> emit,
  ) async {
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

  Future<void> _optimizeOrdersRoute(
    HomeRouteOptimized event,
    Emitter<HomeState> emit,
  ) async {
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
