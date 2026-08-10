import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/domain/repository/order_repository.dart';
import 'package:smart_courier_assistant_app/exceptions/data_not_found_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_credentials_exception.dart';
import 'package:smart_courier_assistant_app/feature/route_detail/cubit/route_detail_state.dart';

class RouteDetailCubit extends Cubit<RouteDetailState> {
  final OrderRepository _orderRepository;

  RouteDetailCubit(this._orderRepository) : super(RouteDetailInitialState());

  Future<void> fetchAllRouteOrders(String routeId) async {
    emit(RouteDetailLoadingState());
    try {
      final routeOrders = await _orderRepository.getAllRouteOrders(routeId);
      emit(RouteDetailSuccessState(routeOrders));
    } on InvalidCredentialsException {
      emit(RouteDetailFailureState(RouteDetailErrorType.invalidCredentials));
    } on DataNotFoundException {
      emit(RouteDetailFailureState(RouteDetailErrorType.dataNotFound));
    } on Exception {
      emit(RouteDetailFailureState(RouteDetailErrorType.unknown));
    }
  }
}
