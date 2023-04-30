// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:photoreboot/src/features/home/presentation/screens/files_overview.dart'
    as _i3;
import 'package:photoreboot/src/features/home/presentation/screens/profile.dart'
    as _i1;
import 'package:photoreboot/src/features/home/presentation/screens/stamper_home.dart'
    as _i2;
import 'package:photoreboot/src/features/home/presentation/screens/timbre.dart'
    as _i4;
import 'package:photoreboot/src/features/stamper/presentation/screens/stamp_document.dart'
    as _i5;

abstract class $StamperRouter extends _i6.RootStackRouter {
  $StamperRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Profile.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Profile(),
      );
    },
    HomeBase.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeBase(),
      );
    },
    FilesOverview.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FilesOverview(),
      );
    },
    TimbreStamp.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TimbreStamp(),
      );
    },
    StampDocuments.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.StampDocuments(),
      );
    },
  };
}

/// generated route for
/// [_i1.Profile]
class Profile extends _i6.PageRouteInfo<void> {
  const Profile({List<_i6.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeBase]
class HomeBase extends _i6.PageRouteInfo<void> {
  const HomeBase({List<_i6.PageRouteInfo>? children})
      : super(
          HomeBase.name,
          initialChildren: children,
        );

  static const String name = 'HomeBase';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FilesOverview]
class FilesOverview extends _i6.PageRouteInfo<void> {
  const FilesOverview({List<_i6.PageRouteInfo>? children})
      : super(
          FilesOverview.name,
          initialChildren: children,
        );

  static const String name = 'FilesOverview';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TimbreStamp]
class TimbreStamp extends _i6.PageRouteInfo<void> {
  const TimbreStamp({List<_i6.PageRouteInfo>? children})
      : super(
          TimbreStamp.name,
          initialChildren: children,
        );

  static const String name = 'TimbreStamp';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.StampDocuments]
class StampDocuments extends _i6.PageRouteInfo<void> {
  const StampDocuments({List<_i6.PageRouteInfo>? children})
      : super(
          StampDocuments.name,
          initialChildren: children,
        );

  static const String name = 'StampDocuments';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
