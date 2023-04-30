import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/extensions/object.dart';
import 'package:photoreboot/src/features/stamper/domain/cubits/stamp_document_cubit.dart';

class StampPreview extends StatelessWidget {
  const StampPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StampDocumentCubit, StampDocumentState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(child: Text('No document stamped')),
          stamped: (stampedDocumentInfos) {
            return Column(
              children: [
                34.vGap,
                Text(
                  'Document Stamped',
                  style: context.theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colorScheme.primary,
                  ),
                ),
                14.vGap,
                Text(
                  'Your document has been stamped, you can now share it with your friends',
                  style: context.theme.textTheme.labelMedium!.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                24.vGap,
                SizedBox(
                  height: 200,
                  child: PDFView(
                    pdfData: stampedDocumentInfos.document,
                    swipeHorizontal: true,
                    onRender: (pages) {},
                    onPageError: (page, error) {
                      '$page: $error'.log();
                    },
                    onLinkHandler: (String? uri) {
                      'goto uri: $uri'.log();
                    },
                    onPageChanged: (page, total) {
                      'page change: $page/$total'.log();
                    },
                  ),
                ),
                24.vGap,
                TextButton.icon(
                  onPressed: () {
                    context.router.pushNamed('/files');
                  },
                  icon: Icon(
                    Hicons.award_1,
                    color: context.colorScheme.primary,
                  ),
                  label: Text(
                    'Stamp Another Document',
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
                24.vGap,
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Hicons.group_3,
                    color: context.colorScheme.primary,
                  ),
                  label: Text(
                    'Send to Administration',
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
