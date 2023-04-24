// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:photoreboot/src/features/face_restoration/presentation/screens/face_restoration.dart'
    as _i4;
import 'package:photoreboot/src/features/home/presentation/screens/profile.dart'
    as _i1;
import 'package:photoreboot/src/features/home/presentation/screens/stamper_home.dart'
    as _i2;
import 'package:photoreboot/src/features/home/presentation/screens/timbre.dart'
    as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    Profile.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Profile(),
      );
    },
    HomeBase.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeBase(),
      );
    },
    TimbreStamp.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TimbreStamp(),
      );
    },
    FaceRestorationRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i4.FaceRestorationScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.Profile]
class Profile extends _i5.PageRouteInfo<void> {
  const Profile({List<_i5.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeBase]
class HomeBase extends _i5.PageRouteInfo<void> {
  const HomeBase({List<_i5.PageRouteInfo>? children})
      : super(
          HomeBase.name,
          initialChildren: children,
        );

  static const String name = 'HomeBase';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TimbreStamp]
class TimbreStamp extends _i5.PageRouteInfo<void> {
  const TimbreStamp({List<_i5.PageRouteInfo>? children})
      : super(
          TimbreStamp.name,
          initialChildren: children,
        );

  static const String name = 'TimbreStamp';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FaceRestorationScreen]
class FaceRestorationRoute extends _i5.PageRouteInfo<void> {
  const FaceRestorationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          FaceRestorationRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaceRestorationRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
