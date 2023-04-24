import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photoreboot/src/router/router.gr.dart' as routes;

@RoutePage(
  name: 'HomeBase',
)
class HomeBase extends StatelessWidget {
  const HomeBase({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        routes.TimbreStamp(),
        routes.Profile(),
      ],
      transitionBuilder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
