import 'package:auto_route/auto_route.dart';
import 'package:photoreboot/src/router/router.gr.dart';

@AutoRouterConfig()
class StamperRouter extends $StamperRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeBase.page,
          path: '/',
          children: [
            AutoRoute(
              page: TimbreStamp.page,
              path: 'stamper',
            ),
            AutoRoute(
              page: FilesOverview.page,
              path: 'files',
            ),
            AutoRoute(
              page: Profile.page,
              path: 'profile',
            ),
          ],
        ),
        AutoRoute(
          page: StampDocuments.page,
          path: '/stamp-documents',
        ),
      ];
}
