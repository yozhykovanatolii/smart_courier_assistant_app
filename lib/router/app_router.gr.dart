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
import 'package:smart_courier_assistant_app/domain/entity/route_entity.dart'
    as _i13;
import 'package:smart_courier_assistant_app/feature/edit_profile/edit_profile.dart'
    as _i1;
import 'package:smart_courier_assistant_app/feature/history/history.dart'
    as _i2;
import 'package:smart_courier_assistant_app/feature/home/home.dart' as _i3;
import 'package:smart_courier_assistant_app/feature/login/login.dart' as _i4;
import 'package:smart_courier_assistant_app/feature/profile/profile.dart'
    as _i5;
import 'package:smart_courier_assistant_app/feature/register/register.dart'
    as _i6;
import 'package:smart_courier_assistant_app/feature/route_detail/route_detail.dart'
    as _i7;
import 'package:smart_courier_assistant_app/feature/settings/settings.dart'
    as _i8;
import 'package:smart_courier_assistant_app/feature/splash/splash.dart' as _i9;
import 'package:smart_courier_assistant_app/feature/verification/verification.dart'
    as _i10;

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
/// [_i2.HistoryPage]
class HistoryRoute extends _i11.PageRouteInfo<void> {
  const HistoryRoute({List<_i11.PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.HistoryPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginPage();
    },
  );
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfilePage();
    },
  );
}

/// generated route for
/// [_i6.RegisterPage]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.RegisterPage();
    },
  );
}

/// generated route for
/// [_i7.RouteDetailPage]
class RouteDetailRoute extends _i11.PageRouteInfo<RouteDetailRouteArgs> {
  RouteDetailRoute({
    _i12.Key? key,
    required _i13.RouteEntity route,
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
      return _i7.RouteDetailPage(key: args.key, route: args.route);
    },
  );
}

class RouteDetailRouteArgs {
  const RouteDetailRouteArgs({this.key, required this.route});

  final _i12.Key? key;

  final _i13.RouteEntity route;

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
/// [_i8.SettingsPage]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute({List<_i11.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsPage();
    },
  );
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashPage();
    },
  );
}

/// generated route for
/// [_i10.VerificationPage]
class VerificationRoute extends _i11.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    required String email,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         VerificationRoute.name,
         args: VerificationRouteArgs(email: email, key: key),
         initialChildren: children,
       );

  static const String name = 'VerificationRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i10.VerificationPage(email: args.email, key: args.key);
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({required this.email, this.key});

  final String email;

  final _i12.Key? key;

  @override
  String toString() {
    return 'VerificationRouteArgs{email: $email, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerificationRouteArgs) return false;
    return email == other.email && key == other.key;
  }

  @override
  int get hashCode => email.hashCode ^ key.hashCode;
}
