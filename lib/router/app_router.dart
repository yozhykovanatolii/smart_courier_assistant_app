import 'package:auto_route/auto_route.dart';
import 'package:smart_courier_assistant_app/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: ProfileRoute.page, initial: true),
    AutoRoute(page: EditProfileRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: HistoryRoute.page),
    AutoRoute(page: RouteDetailRoute.page),
  ];
}
