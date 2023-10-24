import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:photoreboot/i18n/translations.g.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/num.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 55,
            width: context.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.colorScheme.primaryContainer,
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Hicons.search_2,
                    size: 18,
                  ),
                  hintText: Loc.search_files_folders,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
            ),
          ),
        ),
        14.hGap,
        FloatingActionButton(
          backgroundColor: context.colorScheme.primaryContainer,
          onPressed: () {},
          child: const Icon(Hicons.filter_5),
        ),
      ],
    );
  }
}
