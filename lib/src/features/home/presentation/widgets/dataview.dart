import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/features/home/data/models/document_group.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/action_label.dart';

final isGridListener = ValueNotifier(true);

class DataView extends StatelessWidget {
  const DataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Recent files',
                style: context.theme.textTheme.titleLarge,
              ),
              const Spacer(),
              const Icon(
                Hicons.add_category,
              ),
              8.hGap,
              GestureDetector(
                onTap: () => isGridListener.value = !isGridListener.value,
                child: ValueListenableBuilder(
                  valueListenable: isGridListener,
                  builder: (context, isGrid, child) => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 5000),
                    child: !isGrid
                        ? const Icon(Hicons.category)
                        : const Icon(Hicons.filter_1),
                  ),
                ),
              )
            ],
          ),
          4.vGap,
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: isGridListener,
              builder: (context, isGrid, child) => isGrid
                  ? AnimatedGrid(
                      // ignore: lines_longer_than_80_chars
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // mainAxisExtent: 8,
                        crossAxisSpacing: 8,
                        //mainAxisSpacing: 8,
                      ),
                      initialItemCount: documentsGroups.length,
                      itemBuilder:
                          (BuildContext context, int index, animation) {
                        final docGroup = documentsGroups[index];
                        return ActionLabel.grid(
                          infos: docGroup.infos,
                          icon: Icon(
                            Hicons.folder_2,
                            size: 64,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                          action: () {},
                        );
                      },
                    )
                  : AnimatedList(
                      initialItemCount: documentsGroups.length,
                      itemBuilder:
                          (BuildContext context, int index, animation) {
                        final docGroup = documentsGroups[index];
                        return ScaleTransition(
                          scale: animation,
                          child: ActionLabel(
                            infos: docGroup.infos,
                            icon: Icon(
                              Hicons.folder_2,
                              size: 44,
                              color: context.colorScheme.onPrimaryContainer,
                            ),
                            action: () {},
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
