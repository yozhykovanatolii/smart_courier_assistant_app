sealed class HomeEvent {}

final class HomeOrdersFetched extends HomeEvent {}

final class HomeLocationFetched extends HomeEvent {}

final class HomeCallDialerOpened extends HomeEvent {
  final String clientPhoneNumber;

  HomeCallDialerOpened(this.clientPhoneNumber);
}

final class HomeMessengerOpened extends HomeEvent {
  final String clientPhoneNumber;

  HomeMessengerOpened(this.clientPhoneNumber);
}

final class HomeRouteOptimized extends HomeEvent {}
