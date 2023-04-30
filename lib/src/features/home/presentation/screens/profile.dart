import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoreboot/src/configs/theme_cubit.dart';
import 'package:photoreboot/src/extensions/num.dart';

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
      ],
    );
  }
}
