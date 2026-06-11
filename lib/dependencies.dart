import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/settings/settings_cubit.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/order_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/user_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/local/settings_shared_preferences.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/supabase/supabase_storage.dart';
import 'package:smart_courier_assistant_app/data/repository/auth_repository.dart';
import 'package:smart_courier_assistant_app/data/repository/order_repository.dart';
import 'package:smart_courier_assistant_app/data/repository/route_repository.dart';
import 'package:smart_courier_assistant_app/data/repository/settings_repository.dart';
import 'package:smart_courier_assistant_app/data/repository/user_repository.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:smart_courier_assistant_app/feature/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:smart_courier_assistant_app/feature/home/cubit/home_cubit.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';

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
      ..registerSingleton<RouteFirestore>(RouteFirestore())
      ..registerSingleton<OrderFirestore>(OrderFirestore())
      ..registerSingleton<SettingsSharedPreference>(
        SettingsSharedPreference(),
      )
      ..registerSingleton<SupabaseStorage>(SupabaseStorage());
  }

  static void _setupRepositories() {
    final userAuth = _getIt<UserAuth>();
    final routeFirestore = _getIt<RouteFirestore>();
    final orderFirestore = _getIt<OrderFirestore>();
    final userFirestore = _getIt<UserFirestore>();
    final settingsSharedPreference = _getIt<SettingsSharedPreference>();
    final supabaseStorage = _getIt<SupabaseStorage>();
    _getIt
      ..registerFactory<AuthRepository>(
        () => AuthRepository(userAuth, userFirestore),
      )
      ..registerFactory<SettingsRepository>(
        () => SettingsRepository(settingsSharedPreference),
      )
      ..registerFactory<UserRepository>(
        () => UserRepository(userAuth, userFirestore, supabaseStorage),
      )
      ..registerFactory<RouteRepository>(
        () => RouteRepository(routeFirestore, userAuth),
      )
      ..registerFactory<OrderRepository>(
        () => OrderRepository(orderFirestore, userAuth, routeFirestore),
      );
  }

  static void _setupBloc() {
    final authRepository = _getIt<AuthRepository>();
    final userRepository = _getIt<UserRepository>();
    final settingsRepository = _getIt<SettingsRepository>();
    final orderRepository = _getIt<OrderRepository>();
    final routeRepository = _getIt<RouteRepository>();
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
      )
      ..registerFactory<AppBloc>(
        () => AppBloc(authRepository, userRepository),
      )
      ..registerFactory<EditProfileCubit>(
        () => EditProfileCubit(userRepository),
      )
      ..registerFactory<SaveOrderCubit>(
        () => SaveOrderCubit(orderRepository, routeRepository),
      )
      ..registerFactory<HomeCubit>(
        () => HomeCubit(orderRepository, userRepository),
      );
  }
}
