import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_event.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_state.dart';
import 'package:smart_courier_assistant_app/domain/repository/auth_repository.dart';
import 'package:smart_courier_assistant_app/domain/repository/user_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._authRepository, this._userRepository)
    : super(AppInitialState()) {
    on<AppUserSubscriptionRequested>(_onUserSubscriptionRequested);
    on<AppStarted>(_onAppStarted);
    on<AppLogoutPressed>(_onLogoutPressed);
  }

  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  Future<void> _onUserSubscriptionRequested(
    AppUserSubscriptionRequested event,
    Emitter<AppState> emit,
  ) async {
    await emit.forEach(
      _userRepository.getUserCurrentData(),
      onData: (user) {
        return user == null
            ? AppUnauthenticatedState()
            : AppAuthenticatedState(user);
      },
    );
  }

  Future<void> _onAppStarted(
    AppStarted event,
    Emitter<AppState> emit,
  ) async {
    await _userRepository.loadUserData();
  }

  Future<void> _onLogoutPressed(
    AppLogoutPressed event,
    Emitter<AppState> emit,
  ) async {
    await _authRepository.logOut();
  }
}
