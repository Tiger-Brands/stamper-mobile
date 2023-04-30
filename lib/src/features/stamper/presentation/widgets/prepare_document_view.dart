import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/colorx.dart';
import 'package:photoreboot/src/extensions/file_ui_datax.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/features/home/domain/upload_document_cubit.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/file_ui_infos.dart';
import 'package:photoreboot/src/features/stamper/domain/cubits/stamp_document_cubit.dart';
import 'package:photoreboot/src/features/stamper/presentation/screens/stamp_document.dart';

class PrepareDocumentView extends StatelessWidget {
  const PrepareDocumentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadDocumentCubit, UploadDocumentState>(
      builder: (BuildContext context, UploadDocumentState state) {
        final files = state.maybeMap(
          orElse: () => null,
          uploaded: (state) => state.documentURLs,
        );
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 54),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Stamp Documents',
                    style: context.theme.textTheme.titleLarge!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Click on stamp document to start the process',
                    style: context.theme.textTheme.labelMedium!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              14.vGap,
              if (files != null)
                ...files.map(
                  (file) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: FileUIinfos(
                            infos: file.toFileUIdata,
                          ),
                        ),
                        8.hGap,
                        BlocConsumer<StampDocumentCubit, StampDocumentState>(
                          listener: (context, state) {
                            state.maybeMap(
                              orElse: () {},
                              documentReady: (state) {
                                stamptDocumentPageController.nextPage(
                                  duration: const Duration(
                                    milliseconds: 400,
                                  ),
                                  curve: Curves.easeInOut,
                                );
                              },
                            );
                          },
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<StampDocumentCubit>()
                                    .getDocumentReady(documentPath: file);
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: context.colorScheme.tertiary,
                                ),
                                child: Center(
                                  child: state.maybeWhen(
                                    orElse: () => Icon(
                                      Hicons.award_1,
                                      color:
                                          context.colorScheme.tertiary.inverse,
                                    ),
                                    processing: () =>
                                        const CircularProgressIndicator
                                            .adaptive(),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
