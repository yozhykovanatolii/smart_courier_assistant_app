import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/core/exceptions/orders_not_found_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/route_not_found_exception.dart';
import 'package:smart_courier_assistant_app/data/repository/order_repository.dart';
import 'package:smart_courier_assistant_app/feature/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final OrderRepository _orderRepository;

  HomeCubit(this._orderRepository) : super(HomeState.initial());

  Future<void> fetchOrders() async {
    emit(state.copyWith(orderStatus: HomeStatus.loading));
    try {
      final activeOrders = await _orderRepository.getAllCourierActiveOrders();
      emit(
        state.copyWith(
          orderStatus: HomeStatus.success,
          orders: activeOrders,
        ),
      );
    } on RouteNotFoundException {
      emit(
        state.copyWith(
          orderStatus: HomeStatus.failure,
          errorType: HomeErrorType.routeNotFound,
        ),
      );
    } on OrdersNotFoundException {
      emit(
        state.copyWith(
          orderStatus: HomeStatus.failure,
          errorType: HomeErrorType.ordersNotFound,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          orderStatus: HomeStatus.failure,
          errorType: HomeErrorType.unknown,
        ),
      );
    }
  }
}
