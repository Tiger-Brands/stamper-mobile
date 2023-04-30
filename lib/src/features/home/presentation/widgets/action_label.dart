import 'package:flutter/material.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/features/home/data/models/document_infos.dart';

class ActionLabel extends StatelessWidget {
  const ActionLabel({
    super.key,
    required this.infos,
    required this.icon,
    required this.action,
    this.grid = false,
  });
  factory ActionLabel.grid({
    required DocumentsGroupInfos infos,
    required Widget icon,
    required VoidCallback action,
  }) {
    return ActionLabel(
      infos: infos,
      action: action,
      icon: icon,
      grid: true,
    );
  }

  final DocumentsGroupInfos infos;
  final Widget icon;
  final VoidCallback action;
  final bool grid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: action,
        child: grid
            ? DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: infos.category.getColorData(context).main,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    8.vGap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.more_vert,
                          size: 18,
                        ),
                        12.hGap
                      ],
                    ),
                    icon,
                    4.vGap,
                    Text(infos.name),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        '${infos.filesCount} fichiers',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.theme.textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 74,
                width: context.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: infos.category.getColorData(context).main,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  child: Row(
                    children: [
                      icon,
                      14.hGap,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(infos.name),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              '${infos.filesCount} fichiers',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.theme.textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.more_vert)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
