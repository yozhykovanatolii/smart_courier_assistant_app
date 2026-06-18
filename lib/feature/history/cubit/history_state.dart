import 'package:smart_courier_assistant_app/data/models/route_model.dart';

sealed class HistoryState {}

final class HistoryInitialState extends HistoryState {}

final class HistoryLoadingState extends HistoryState {}

final class HistorySuccessState extends HistoryState {
  final List<RouteModel> routes;

  HistorySuccessState(this.routes);
}

enum HistoryErrorType {
  userNotFound,
  routesNotFound,
  unknown,
}

final class HistoryFailureState extends HistoryState {
  final HistoryErrorType historyErrorType;

  HistoryFailureState(this.historyErrorType);
}
