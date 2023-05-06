import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/extensions/object.dart';
import 'package:photoreboot/src/features/stamper/domain/cubits/stamp_document_cubit.dart';
import 'package:photoreboot/src/shared/widgets/button.dart';

class DownloadDocumentView extends StatelessWidget {
  const DownloadDocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: BlocBuilder<StampDocumentCubit, StampDocumentState>(
        builder: (BuildContext context, StampDocumentState state) {
          return state.maybeWhen(
            orElse: () => const Text('Something went wrong'),
            stamped: (data) => _Mainview(data.document),
          );
        },
      ),
    );
  }
}

class _Mainview extends StatelessWidget {
  const _Mainview(this.data);
  final Uint8List data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        34.vGap,
        Row(
          children: [
            Text(
              'Document Stamped',
              style: context.theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
        14.vGap,
        Text(
          'Your document has been stamped and is ready for download.',
          style: context.theme.textTheme.labelMedium!.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        14.vGap,
        SizedBox(
          height: 350,
          child: PDFView(
            pdfData: data,
            swipeHorizontal: true,
            onRender: (pages) {},
          ),
        ),
        24.vGap,
        Button(
          action: () async {
            final filename =
                'stamped_document_${DateTime.now().toIso8601String()}';
            final phoneDir = await getApplicationDocumentsDirectory();

            final filePath = '${phoneDir.path}/$filename.pdf';
            final fileImgPath = '${phoneDir.path}/$filename.jpg';
            final file = File(filePath);
            final fileImg = File(fileImgPath);

            await file.writeAsBytes(data).then((value) {
              'file written'.log();
            });
            await fileImg.writeAsBytes(data).then((value) {
              'file written'.log();
            });
          },
          icon: Hicons.download,
          text: 'Download document',
        ),
      ],
    );
  }
}

Future<Directory> createCustomFolder(String folderName) async {
  final rootDir = Directory('/');
  final customFolder = Directory('${rootDir.path}/$folderName');
  if (!(await customFolder.exists())) {
    await customFolder.create();
  }
  return customFolder;
}
