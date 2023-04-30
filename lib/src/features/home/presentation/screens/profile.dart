import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoreboot/i18n/translations.g.dart';
import 'package:photoreboot/src/configs/theme_cubit.dart';
import 'package:photoreboot/src/extensions/loc.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/features/home/domain/language/language_cubit.dart';

@RoutePage(
  name: 'Profile',
)
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.vGap,
        BlocBuilder<ThemeCubit, bool>(
          builder: (context, state) {
            return ListTile(
              leading: const Icon(Icons.light_mode),
              title: const Text('Dark mode'),
              trailing: Switch(
                value: state,
                onChanged: (data) {
                  state
                      ? context.read<ThemeCubit>().reset()
                      : context.read<ThemeCubit>().toggle();
                },
              ),
            );
          },
        ),

        // drop down to change active language
        BlocBuilder<LanguageCubit, String>(
          builder: (BuildContext context, String state) {
            return ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              trailing: DropdownButton<String>(
                underline: const SizedBox.shrink(),
                value: state,
                onChanged: (locale) {
                  context.read<LanguageCubit>().setLocale(locale ?? 'en');
                  LocaleSettings.setLocaleRaw(
                    locale ?? 'en',
                    listenToDeviceLocale: true,
                  );
                },
                items: <String>[
                  'en',
                  'fr',
                  'es',
                  'de',
                  'ar',
                  'zh',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Image.asset(
                          value.icon,
                          width: 24,
                        ),
                        8.hGap,
                        Text(value.language),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          },
        )
      ],
    );
  }
}
