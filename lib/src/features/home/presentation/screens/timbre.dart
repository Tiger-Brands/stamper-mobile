import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/dataview.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/search_box.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/uploader.dart';

@RoutePage(
  name: 'timbreStamp',
)
class TimbreStamp extends StatelessWidget {
  const TimbreStamp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            34.vGap,
            const SearchBox(),
            24.vGap,
            const Uploader(),
            24.vGap,
            const Expanded(
              child: DataView(),
            ),
          ],
        ),
      ),
    );
  }
}
