import 'package:flutter/material.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/colorx.dart';
import 'package:photoreboot/src/extensions/file_ui_datax.dart';
import 'package:photoreboot/src/features/home/data/models/file_ui_data.dart';

class FileUIinfos extends StatelessWidget {
  const FileUIinfos({super.key, required this.infos});
  final FileUIdata infos;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: infos.fileExtension.getColorData(context),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              infos.fileExtension.getIcon,
              height: 50,
              width: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    // compute length of the filename and truncate if long
                    final length = infos.fileName.length;
                    if (length > 20) {
                      return Text(
                        '${infos.fileName.substring(0, 20)}...',
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: context.theme.textTheme.labelSmall!.copyWith(
                          color:
                              infos.fileExtension.getColorData(context).inverse,
                        ),
                      );
                    }
                    return Text(
                      infos.fileName,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: context.theme.textTheme.bodySmall!.copyWith(
                        color:
                            infos.fileExtension.getColorData(context).inverse,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    '${infos.fileSize} MB',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.theme.textTheme.labelSmall!.copyWith(
                      color: infos.fileExtension.getColorData(context).inverse,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.more_vert,
              color: infos.fileExtension.getColorData(context).inverse,
            )
          ],
        ),
      ),
    );
  }
}
