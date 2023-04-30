import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/router/router.gr.dart' as routes;

@RoutePage(
  name: 'HomeBase',
)
class HomeBase extends StatelessWidget {
  const HomeBase({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        routes.TimbreStamp(),
        routes.FilesOverview(),
        routes.Profile(),
      ],
      transitionBuilder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      bottomNavigationBuilder: (context, router) {
        return BottomNavigationBar(
          currentIndex: router.activeIndex,
          onTap: router.setActiveIndex,
          selectedItemColor: context.colorScheme.primary,
          unselectedItemColor: context.colorScheme.primary.withOpacity(.35),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Hicons.award_1),
              label: 'Timbre',
            ),
            BottomNavigationBarItem(
              icon: Icon(Hicons.chart),
              label: 'Files',
            ),
            BottomNavigationBarItem(
              icon: Icon(Hicons.profile_1),
              label: 'Profil',
            )
          ],
        );
      },
    );
  }
}
