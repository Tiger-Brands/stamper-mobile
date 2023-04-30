import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:photoreboot/i18n/translations.g.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/colorx.dart';
import 'package:photoreboot/src/extensions/file_ui_datax.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/features/home/domain/upload_document_cubit.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/file_ui_infos.dart';
import 'package:photoreboot/src/features/stamper/domain/cubits/stamp_document_cubit.dart';

@RoutePage(name: 'filesOverview')
class FilesOverview extends StatelessWidget {
  const FilesOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 54),
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 54,
              animation: true,
              animationDuration: 1200,
              lineWidth: 8,
              percent: .55,
              center: Text(
                '55%',
                style: context.theme.textTheme.bodyLarge!.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: context.colorScheme.errorContainer,
              progressColor: context.colorScheme.error,
            ),
            14.vGap,
            Center(
              child: Text(Loc.user_files_overview),
            ),
            14.vGap,
            BlocBuilder<UploadDocumentCubit, UploadDocumentState>(
              builder: (BuildContext context, UploadDocumentState state) {
                return state.maybeWhen(
                  orElse: () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          Loc.upload_a_document_to_start,
                        ),
                      ),
                    ],
                  ),
                  uploaded: (documentURLS) => _ReadDocs(files: documentURLS),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ReadDocs extends StatelessWidget {
  const _ReadDocs({
    required this.files,
  });

  final List<String>? files;

  @override
  Widget build(BuildContext context) {
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
            ...files!.map(
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
                          documentReady: (state) {},
                        );
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            context.read<StampDocumentCubit>().getDocumentReady(
                                  documentPath: file,
                                );
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
                                  color: context.colorScheme.tertiary.inverse,
                                ),
                                processing: () =>
                                    const CircularProgressIndicator.adaptive(),
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
  }
}
