import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoreboot/l10n/l10n.dart';
import 'package:photoreboot/src/configs/stamper_theme.dart';
import 'package:photoreboot/src/configs/theme_cubit.dart';
import 'package:photoreboot/src/router/router.dart';

final router = StamperRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = OmnisenseTheme();
    return BlocBuilder<ThemeCubit, bool>(
      builder: (BuildContext context, bool state) {
        return MaterialApp.router(
          routerConfig: router.config(),
          theme: theme.toThemeData(Brightness.light),
          darkTheme: theme.toThemeData(
            Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          themeMode: !state ? ThemeMode.light : ThemeMode.dark,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
