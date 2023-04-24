import 'package:flutter/material.dart';
import 'package:photoreboot/l10n/l10n.dart';
import 'package:photoreboot/src/router/router.dart';

final router = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      //  routeInformationParser: router.defaultRouteParser(),
      // routerDelegate: router.delegate(),

      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      //home: const CounterPage(),
    );
  }
}
