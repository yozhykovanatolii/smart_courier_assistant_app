import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/bloc/settings/settings_cubit.dart';
import 'package:smart_courier_assistant_app/data/datasource/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/firebase/firestore/user_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/local/settings_shared_preferences.dart';
import 'package:smart_courier_assistant_app/data/repository/auth_repository.dart';
import 'package:smart_courier_assistant_app/data/repository/settings_repository.dart';
import 'package:smart_courier_assistant_app/feature/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';

class Dependencies {
  static final GetIt _getIt = GetIt.instance;

  static void setupDependencies() {
    _setupDataSources();
    _setupRepositories();
    _setupBloc();
  }

  static void _setupDataSources() {
    _getIt
      ..registerSingleton<UserAuth>(UserAuth())
      ..registerSingleton<UserFirestore>(UserFirestore())
      ..registerSingleton<SettingsSharedPreference>(
        SettingsSharedPreference(),
      );
  }

  static void _setupRepositories() {
    final userAuth = _getIt<UserAuth>();
    final userFirestore = _getIt<UserFirestore>();
    final settingsSharedPreference = _getIt<SettingsSharedPreference>();
    _getIt
      ..registerFactory<AuthRepository>(
        () => AuthRepository(userAuth, userFirestore),
      )
      ..registerFactory<SettingsRepository>(
        () => SettingsRepository(settingsSharedPreference),
      );
  }

  static void _setupBloc() {
    final authRepository = _getIt<AuthRepository>();
    final settingsRepository = _getIt<SettingsRepository>();
    _getIt
      ..registerFactory<LoginCubit>(
        () => LoginCubit(authRepository),
      )
      ..registerFactory<ForgotPasswordCubit>(
        () => ForgotPasswordCubit(authRepository),
      )
      ..registerFactory<RegisterCubit>(
        () => RegisterCubit(authRepository),
      )
      ..registerFactory<SettingsCubit>(
        () => SettingsCubit(settingsRepository),
      );
  }
}
