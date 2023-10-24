import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:photoreboot/i18n/translations.g.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/features/home/presentation/screens/files_overview.dart';
import 'package:photoreboot/src/features/home/presentation/screens/profile.dart';
import 'package:photoreboot/src/features/home/presentation/screens/timbre.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/responsive.dart';
import 'package:photoreboot/src/router/router.gr.dart' as routes;

@RoutePage(
  name: 'HomeBase',
)
class HomeBase extends StatelessWidget {
  const HomeBase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: _Mobile(),
      desktop: _Desktop(),
      tablet: _Tablet(),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile();

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
        return _NavigationBar(router);
      },
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          (context.width * .15).hGap,
          const _NavRail(),
          Expanded(
            // nested routes will be rendered here
            child: ValueListenableBuilder(
              valueListenable: _indexNotifier,
              builder: (context, index, _) {
                return pages[index];
              },
            ),
            //AutoRouter(),
          ),
          (context.width * .15).hGap,
        ],
      ),
    );
  }
}

final pages = [
  const TimbreStamp(),
  const FilesOverview(),
  const Profile(),
];

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const _NavRail(),
          Expanded(
            // nested routes will be rendered here
            child: ValueListenableBuilder(
              valueListenable: _indexNotifier,
              builder: (context, index, _) {
                return pages[index];
              },
            ),
            //AutoRouter(),
          ),
        ],
      ),
    );
  }
}

class NavLink extends StatelessWidget {
  const NavLink({
    super.key,
    required this.label,
    required this.destination,
    required this.icon,
  });
  final String label;
  final String destination;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.pushNamed('/$destination'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          width: 200,
          height: 42,
          decoration: BoxDecoration(
            color: context.colorScheme.secondary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  icon,
                  4.hGap,
                  Text(label),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar(this.router);
  final TabsRouter router;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: router.activeIndex,
      onDestinationSelected: router.setActiveIndex,
      destinations: [
        NavigationDestination(
          icon: const Icon(Hicons.award_1),
          label: Loc.stamp,
        ),
        NavigationDestination(
          icon: const Icon(Hicons.chart),
          label: Loc.files,
        ),
        NavigationDestination(
          icon: const Icon(Hicons.profile_1),
          label: Loc.profile,
        ),
      ],
    );
  }
}

class _NavRail extends StatelessWidget {
  const _NavRail();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _indexNotifier,
      builder: (context, index, _) {
        return NavigationRail(
          leading: const Text('StamperX'),
          useIndicator: true,
          selectedIndex: _indexNotifier.value,
          groupAlignment: -.95,
          onDestinationSelected: (index) => _indexNotifier.value = index,
          // labelType: NavigationRailLabelType.selected,
          extended: true,
          destinations: [
            NavigationRailDestination(
              icon: const Icon(Hicons.award_1),
              label: Text(Loc.stamp),
            ),
            NavigationRailDestination(
              icon: const Icon(Hicons.chart),
              label: Text(Loc.files),
            ),
            NavigationRailDestination(
              icon: const Icon(Hicons.profile_1),
              label: Text(Loc.profile),
            ),
          ],
        );
      },
    );
  }
}

final _indexNotifier = ValueNotifier<int>(0);
