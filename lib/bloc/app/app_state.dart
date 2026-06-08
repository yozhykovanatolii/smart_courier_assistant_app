import 'package:smart_courier_assistant_app/data/models/user_model.dart';

sealed class AppState {}

final class AppInitialState extends AppState {}

final class AppAuthenticatedState extends AppState {
  AppAuthenticatedState(this.user);

  final UserModel user;
}

final class AppUnauthenticatedState extends AppState {}
