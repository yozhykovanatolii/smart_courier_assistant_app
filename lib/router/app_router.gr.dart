// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:smart_courier_assistant_app/data/models/route_model.dart'
    as _i13;
import 'package:smart_courier_assistant_app/feature/edit_profile/edit_profile.dart'
    as _i1;
import 'package:smart_courier_assistant_app/feature/forgot_password/forgot_password.dart'
    as _i2;
import 'package:smart_courier_assistant_app/feature/history/history.dart'
    as _i3;
import 'package:smart_courier_assistant_app/feature/home/home.dart' as _i4;
import 'package:smart_courier_assistant_app/feature/login/login.dart' as _i5;
import 'package:smart_courier_assistant_app/feature/profile/profile.dart'
    as _i6;
import 'package:smart_courier_assistant_app/feature/register/register.dart'
    as _i7;
import 'package:smart_courier_assistant_app/feature/route_detail/route_detail.dart'
    as _i8;
import 'package:smart_courier_assistant_app/feature/settings/settings.dart'
    as _i9;
import 'package:smart_courier_assistant_app/feature/splash/splash.dart' as _i10;

/// generated route for
/// [_i1.EditProfilePage]
class EditProfileRoute extends _i11.PageRouteInfo<void> {
  const EditProfileRoute({List<_i11.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.EditProfilePage();
    },
  );
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i11.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i11.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i3.HistoryPage]
class HistoryRoute extends _i11.PageRouteInfo<void> {
  const HistoryRoute({List<_i11.PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.HistoryPage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfilePage();
    },
  );
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.RegisterPage();
    },
  );
}

/// generated route for
/// [_i8.RouteDetailPage]
class RouteDetailRoute extends _i11.PageRouteInfo<RouteDetailRouteArgs> {
  RouteDetailRoute({
    _i12.Key? key,
    required _i13.RouteModel route,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         RouteDetailRoute.name,
         args: RouteDetailRouteArgs(key: key, route: route),
         initialChildren: children,
       );

  static const String name = 'RouteDetailRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RouteDetailRouteArgs>();
      return _i8.RouteDetailPage(key: args.key, route: args.route);
    },
  );
}

class RouteDetailRouteArgs {
  const RouteDetailRouteArgs({this.key, required this.route});

  final _i12.Key? key;

  final _i13.RouteModel route;

  @override
  String toString() {
    return 'RouteDetailRouteArgs{key: $key, route: $route}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RouteDetailRouteArgs) return false;
    return key == other.key && route == other.route;
  }

  @override
  int get hashCode => key.hashCode ^ route.hashCode;
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute({List<_i11.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.SettingsPage();
    },
  );
}

/// generated route for
/// [_i10.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.SplashPage();
    },
  );
}
