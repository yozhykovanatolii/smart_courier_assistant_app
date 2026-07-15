import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/settings/settings_cubit.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/recommendation_gpt_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/route_direction_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/route_optimize_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/user_auth_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/order_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/user_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/local/settings_shared_preferences.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/supabase/supabase_storage.dart';
import 'package:smart_courier_assistant_app/data/repository/auth_repository_api_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/auth_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/delivery_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/geolocation_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/order_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/route_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/settings_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/user_repository_impl.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:smart_courier_assistant_app/feature/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:smart_courier_assistant_app/feature/history/cubit/history_cubit.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_bloc.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/cubit/proof_delivery_cubit.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';
import 'package:smart_courier_assistant_app/feature/route_detail/cubit/route_detail_cubit.dart';
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
      ..registerSingleton<SupabaseStorage>(SupabaseStorage())
      ..registerSingleton<RouteOptimizeClient>(RouteOptimizeClient())
      ..registerSingleton<RouteDirectionClient>(RouteDirectionClient())
      ..registerSingleton<RecommendationGptClient>(RecommendationGptClient())
      ..registerSingleton<UserAuthClient>(UserAuthClient());
  }

  static void _setupRepositories() {
    final userAuth = _getIt<UserAuth>();
    final routeFirestore = _getIt<RouteFirestore>();
    final orderFirestore = _getIt<OrderFirestore>();
    final userFirestore = _getIt<UserFirestore>();
    final settingsSharedPreference = _getIt<SettingsSharedPreference>();
    final supabaseStorage = _getIt<SupabaseStorage>();
    final routeOptimizeClient = _getIt<RouteOptimizeClient>();
    final routeDirectionClient = _getIt<RouteDirectionClient>();
    final recommendationGptClient = _getIt<RecommendationGptClient>();
    final userAuthClient = _getIt<UserAuthClient>();
    _getIt
      ..registerFactory<AuthRepositoryImpl>(
        () => AuthRepositoryImpl(userAuth, userFirestore),
      )
      ..registerFactory<AuthRepositoryApiImpl>(
        () => AuthRepositoryApiImpl(userAuthClient),
      )
      ..registerFactory<SettingsRepositoryImpl>(
        () => SettingsRepositoryImpl(settingsSharedPreference),
      )
      ..registerFactory<UserRepositoryImpl>(
        () => UserRepositoryImpl(userAuth, userFirestore, supabaseStorage),
      )
      ..registerFactory<RouteRepositoryImpl>(
        () => RouteRepositoryImpl(
          routeFirestore,
          userAuth,
          routeDirectionClient,
          recommendationGptClient,
          settingsSharedPreference,
          orderFirestore,
        ),
      )
      ..registerFactory<OrderRepositoryImpl>(
        () => OrderRepositoryImpl(
          orderFirestore,
          userAuth,
          routeFirestore,
          routeOptimizeClient,
          supabaseStorage,
        ),
      )
      ..registerFactory<GeolocationRepositoryImpl>(
        () => GeolocationRepositoryImpl(),
      )
      ..registerFactory<DeliveryRepositoryImpl>(
        () => DeliveryRepositoryImpl(userAuth, routeFirestore, orderFirestore),
      );
  }

  static void _setupBloc() {
    final authRepository = _getIt<AuthRepositoryImpl>();
    final authRepositoryApi = _getIt<AuthRepositoryApiImpl>();
    final userRepository = _getIt<UserRepositoryImpl>();
    final settingsRepository = _getIt<SettingsRepositoryImpl>();
    final orderRepository = _getIt<OrderRepositoryImpl>();
    final routeRepository = _getIt<RouteRepositoryImpl>();
    final geolocationRepository = _getIt<GeolocationRepositoryImpl>();
    final deliveryRepository = _getIt<DeliveryRepositoryImpl>();
    _getIt
      ..registerFactory<LoginCubit>(
        () => LoginCubit(authRepositoryApi),
      )
      ..registerFactory<ForgotPasswordCubit>(
        () => ForgotPasswordCubit(authRepository),
      )
      ..registerFactory<RegisterCubit>(
        () => RegisterCubit(authRepositoryApi),
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
      ..registerFactory<HomeBloc>(
        () => HomeBloc(
          orderRepository,
          userRepository,
          geolocationRepository,
          routeRepository,
        ),
      )
      ..registerFactory<ProofDeliveryCubit>(
        () => ProofDeliveryCubit(orderRepository, deliveryRepository),
      )
      ..registerFactory<HistoryCubit>(
        () => HistoryCubit(routeRepository),
      )
      ..registerFactory<RouteDetailCubit>(
        () => RouteDetailCubit(orderRepository),
      );
  }
}
