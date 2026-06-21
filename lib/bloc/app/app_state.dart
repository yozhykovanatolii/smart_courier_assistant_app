import 'package:smart_courier_assistant_app/domain/entity/user_entity.dart';

sealed class AppState {}

final class AppInitialState extends AppState {}

final class AppAuthenticatedState extends AppState {
  AppAuthenticatedState(this.user);

  final UserEntity user;
}

final class AppUnauthenticatedState extends AppState {}
