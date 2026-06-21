import 'package:smart_courier_assistant_app/domain/entity/route_entity.dart';

sealed class HistoryState {}

final class HistoryInitialState extends HistoryState {}

final class HistoryLoadingState extends HistoryState {}

final class HistorySuccessState extends HistoryState {
  final List<RouteEntity> routes;

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
