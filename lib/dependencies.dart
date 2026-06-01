import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/data/datasource/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/repository/auth_repository.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';

class Dependencies {
  static final GetIt _getIt = GetIt.instance;

  static void setupDependencies() {
    _setupDataSources();
    _setupRepositories();
    _setupBloc();
  }

  static void _setupDataSources() {
    _getIt.registerSingleton<UserAuth>(UserAuth());
  }

  static void _setupRepositories() {
    final userAuth = _getIt<UserAuth>();
    _getIt.registerFactory<AuthRepository>(
      () => AuthRepository(userAuth),
    );
  }

  static void _setupBloc() {
    final authRepository = _getIt<AuthRepository>();
    _getIt.registerFactory<LoginCubit>(() => LoginCubit(authRepository));
  }
}
