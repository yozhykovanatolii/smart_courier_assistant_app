import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/exceptions/data_not_found_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_credentials_exception.dart';
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
    } on InvalidCredentialsException {
      emit(HistoryFailureState(HistoryErrorType.invalidCredentials));
    } on DataNotFoundException {
      emit(HistoryFailureState(HistoryErrorType.dataNotFound));
    } on Exception {
      emit(HistoryFailureState(HistoryErrorType.unknown));
    }
  }
}
