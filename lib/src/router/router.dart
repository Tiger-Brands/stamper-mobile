import 'package:auto_route/auto_route.dart';
import 'package:photoreboot/src/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: FaceRestorationRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: TimbreStamp.page,
          path: '/timbre-stamper',
        ),
        AutoRoute(
          page: Profile.page,
          path: '/profile',
        ),
        AutoRoute(
          page: HomeBase.page,
          path: '/home-base',
        ),
      ];
}
