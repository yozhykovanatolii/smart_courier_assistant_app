import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/core/exceptions/route_not_found_exception.dart';
import 'package:smart_courier_assistant_app/core/exceptions/user_not_found_exception.dart';
import 'package:smart_courier_assistant_app/domain/repository/route_repository.dart';
import 'package:smart_courier_assistant_app/feature/history/cubit/history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final RouteRepository routeRepository;

  HistoryCubit(this.routeRepository) : super(HistoryInitialState());

  Future<void> fetchAllCourierRoutes() async {
    emit(HistoryLoadingState());
    try {
      final routes = await routeRepository.getAllCourierRoutes();
      emit(HistorySuccessState(routes));
    } on UserNotFoundException {
      emit(HistoryFailureState(HistoryErrorType.userNotFound));
    } on RouteNotFoundException {
      emit(HistoryFailureState(HistoryErrorType.routesNotFound));
    } on Exception {
      emit(HistoryFailureState(HistoryErrorType.unknown));
    }
  }
}
