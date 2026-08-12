import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/settings/settings_cubit.dart';
import 'package:smart_courier_assistant_app/data/datasource/local/secure_storage.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/direction_route_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/order_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/recommendation_ai_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/route_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/storage_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/user_auth_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/user_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/local/settings_shared_preferences.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/interceptors/auth_interceptor.dart';
import 'package:smart_courier_assistant_app/data/manager/session_manager.dart';
import 'package:smart_courier_assistant_app/data/repository/auth_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/geolocation_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/order_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/route_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/settings_repository_impl.dart';
import 'package:smart_courier_assistant_app/data/repository/user_repository_impl.dart';
import 'package:smart_courier_assistant_app/feature/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:smart_courier_assistant_app/feature/history/cubit/history_cubit.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_bloc.dart';
import 'package:smart_courier_assistant_app/feature/login/cubit/login_cubit.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/cubit/proof_delivery_cubit.dart';
import 'package:smart_courier_assistant_app/feature/register/cubit/register_cubit.dart';
import 'package:smart_courier_assistant_app/feature/route_detail/cubit/route_detail_cubit.dart';
import 'package:smart_courier_assistant_app/feature/save_order/cubit/save_order_cubit.dart';

class Dependencies {
  static final GetIt _getIt = GetIt.instance;

  static void setupDependencies(String baseUrl) {
    _setupDataSources(baseUrl);
    _setupRepositories();
    _setupBloc();
  }

  static void _setupDataSources(String baseUrl) {
    _getIt
      ..registerSingleton<SettingsSharedPreference>(
        SettingsSharedPreference(),
      )
      ..registerSingleton<SecureStorage>(SecureStorage())
      ..registerSingleton<SessionManager>(SessionManager());
    _setupDio(baseUrl);
    _setupApiClients();
  }

  static void _setupApiClients() {
    final dio = _getIt<Dio>();
    _getIt
      ..registerSingleton<UserClient>(UserClient(dio))
      ..registerSingleton<OrderClient>(OrderClient(dio))
      ..registerSingleton<RouteClient>(RouteClient(dio))
      ..registerSingleton<RecommendationAiClient>(RecommendationAiClient(dio))
      ..registerSingleton<DirectionRouteClient>(DirectionRouteClient(dio))
      ..registerSingleton<UserAuthClient>(UserAuthClient(dio))
      ..registerSingleton<StorageClient>(StorageClient(dio));
  }

  static void _setupDio(String baseUrl) {
    final secureStorage = _getIt<SecureStorage>();
    final sessionManager = _getIt<SessionManager>();
    _getIt.registerLazySingleton<Dio>(() {
      final dio = Dio(
        BaseOptions(baseUrl: baseUrl),
      );
      dio.interceptors.add(
        AuthInterceptor(dio, secureStorage, sessionManager),
      );
      return dio;
    });
  }

  static void _setupRepositories() {
    final routeClient = _getIt<RouteClient>();
    final orderClient = _getIt<OrderClient>();
    final userClient = _getIt<UserClient>();
    final settingsSharedPreference = _getIt<SettingsSharedPreference>();
    final storageClient = _getIt<StorageClient>();
    final directionRouteClient = _getIt<DirectionRouteClient>();
    final recommendationAiClient = _getIt<RecommendationAiClient>();
    final userAuthClient = _getIt<UserAuthClient>();
    final secureStorage = _getIt<SecureStorage>();
    final sessionManager = _getIt<SessionManager>();
    _getIt
      ..registerFactory<AuthRepositoryImpl>(
        () => AuthRepositoryImpl(
          userAuthClient,
          secureStorage,
          sessionManager,
        ),
      )
      ..registerFactory<SettingsRepositoryImpl>(
        () => SettingsRepositoryImpl(settingsSharedPreference),
      )
      ..registerFactory<UserRepositoryImpl>(
        () => UserRepositoryImpl(userClient, storageClient, sessionManager),
      )
      ..registerFactory<RouteRepositoryImpl>(
        () => RouteRepositoryImpl(
          settingsSharedPreference,
          recommendationAiClient,
          directionRouteClient,
          routeClient,
          orderClient,
        ),
      )
      ..registerFactory<OrderRepositoryImpl>(
        () => OrderRepositoryImpl(
          orderClient,
          routeClient,
          storageClient,
        ),
      )
      ..registerFactory<GeolocationRepositoryImpl>(
        () => GeolocationRepositoryImpl(),
      );
  }

  static void _setupBloc() {
    final authRepositoryImpl = _getIt<AuthRepositoryImpl>();
    final userRepositoryImpl = _getIt<UserRepositoryImpl>();
    final settingsRepositoryImpl = _getIt<SettingsRepositoryImpl>();
    final orderRepositoryImpl = _getIt<OrderRepositoryImpl>();
    final routeRepositoryImpl = _getIt<RouteRepositoryImpl>();
    final geolocationRepositoryImpl = _getIt<GeolocationRepositoryImpl>();
    _getIt
      ..registerFactory<LoginCubit>(
        () => LoginCubit(authRepositoryImpl),
      )
      ..registerFactory<RegisterCubit>(
        () => RegisterCubit(authRepositoryImpl),
      )
      ..registerFactory<SettingsCubit>(
        () => SettingsCubit(settingsRepositoryImpl),
      )
      ..registerFactory<AppBloc>(
        () => AppBloc(authRepositoryImpl, userRepositoryImpl),
      )
      ..registerFactory<EditProfileCubit>(
        () => EditProfileCubit(userRepositoryImpl),
      )
      ..registerFactory<SaveOrderCubit>(
        () => SaveOrderCubit(orderRepositoryImpl),
      )
      ..registerFactory<HomeBloc>(
        () => HomeBloc(
          orderRepositoryImpl,
          userRepositoryImpl,
          geolocationRepositoryImpl,
          routeRepositoryImpl,
        ),
      )
      ..registerFactory<ProofDeliveryCubit>(
        () => ProofDeliveryCubit(orderRepositoryImpl),
      )
      ..registerFactory<HistoryCubit>(
        () => HistoryCubit(routeRepositoryImpl),
      )
      ..registerFactory<RouteDetailCubit>(
        () => RouteDetailCubit(orderRepositoryImpl),
      );
  }
}
