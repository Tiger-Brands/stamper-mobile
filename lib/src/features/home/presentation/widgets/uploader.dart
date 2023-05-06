import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/file_ui_datax.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/features/home/data/models/file_ui_data.dart';
import 'package:photoreboot/src/features/home/domain/upload_document_cubit.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/file_ui_infos.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/pick_documents_action.dart';

class Uploader extends StatelessWidget {
  const Uploader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadDocumentCubit, UploadDocumentState>(
      listener: (context, state) {
        state.whenOrNull(
          picked: (files) async {
            final filesUIdata = files
                .map(
                  (file) => file.path.toFileUIdata,
                )
                .toList();

            await showModalBottomSheet<void>(
              context: context,
              // barrierDismissible: false,
              builder: (context) {
                return _UploaderInfosSheet(
                  filesUIdata: filesUIdata,
                  files: files,
                );
              },
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          //  orElse: () => const PickDocumentsAction(),
          orElse: () => GestureDetector(
            onTap: () async {
              await context.read<UploadDocumentCubit>().pickDocuments();
            },
            child: const PickDocumentsAction(),
          ),
          picking: PickDocumentsAction.processing,
          failure: (message) => GestureDetector(
            onTap: () async {
              await context.read<UploadDocumentCubit>().pickDocuments();
            },
            child: PickDocumentsAction.withError(
              message: message,
            ),
          ),
        );
      },
    );
  }
}

class _UploaderInfosSheet extends StatelessWidget {
  const _UploaderInfosSheet({
    required this.filesUIdata,
    required this.files,
  });
  final List<File> files;

  final List<FileUIdata> filesUIdata;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected files',
                      style: context.theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    Text('You picked ${filesUIdata.length} files'),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: context.colorScheme.primary,
                    size: 18,
                  ),
                ),
              ],
            ),
            14.vGap,
            // files list
            ...filesUIdata.map(
              (file) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: FileUIinfos(
                  infos: file,
                ),
              ),
            ),
            14.vGap,
            BlocBuilder<UploadDocumentCubit, UploadDocumentState>(
              builder: (context, state) {
                return state.maybeWhen(
                  uploading: (progress) {
                    return _PercentIndicator(progress);
                  },
                  uploaded: (documentGroup) {
                    return TextButton.icon(
                      onPressed: () {
                        context.router.pushNamed('/stamp-documents');
                      },
                      icon: const Icon(
                        Hicons.award_1,
                        size: 18,
                      ),
                      label: const Text('Stamp documents'),
                    );
                  },
                  orElse: () {
                    return TextButton.icon(
                      onPressed: () {
                        context.read<UploadDocumentCubit>().uploadFiles(
                              files: files,
                            );
                      },
                      icon: const Icon(
                        Hicons.upload,
                        size: 18,
                      ),
                      label: const Text('Upload documents'),
                    );
                  },
                );
              },
            ),
            24.vGap
          ],
        ),
      ),
    );
  }
}

class _PercentIndicator extends StatelessWidget {
  const _PercentIndicator(this.progress);
  final double progress;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 42,
      animation: true,
      animationDuration: 1200,
      lineWidth: 8,
      percent: progress > 1 ? 1 : progress,
      center: Text(
        progress > 1 ? '100%' : '${(progress * 100).toInt()}%',
        style: context.theme.textTheme.labelSmall!.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      backgroundColor: context.colorScheme.primaryContainer,
      progressColor: context.colorScheme.primary,
    );
  }
}
