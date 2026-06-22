import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/exceptions/orders_not_found_exception.dart';
import 'package:smart_courier_assistant_app/data/repository/order_repository_impl.dart';
import 'package:smart_courier_assistant_app/feature/route_detail/cubit/route_detail_state.dart';

class RouteDetailCubit extends Cubit<RouteDetailState> {
  final OrderRepositoryImpl _orderRepository;

  RouteDetailCubit(this._orderRepository) : super(RouteDetailInitialState());

  Future<void> fetchAllRouteOrders(String routeId) async {
    emit(RouteDetailLoadingState());
    try {
      final routeOrders = await _orderRepository.getAllRouteOrders(routeId);
      emit(RouteDetailSuccessState(routeOrders));
    } on OrdersNotFoundException {
      emit(RouteDetailFailureState(RouteDetailErrorType.ordersNotFound));
    } on Exception {
      emit(RouteDetailFailureState(RouteDetailErrorType.unknown));
    }
  }
}
