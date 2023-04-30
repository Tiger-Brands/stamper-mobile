// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_unused_constructor_parameters, unused_element
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/file_ui_datax.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/features/home/data/models/document_group.dart';
import 'package:photoreboot/src/features/home/data/models/document_infos.dart';
import 'package:photoreboot/src/features/home/domain/upload_document_cubit.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/file_ui_infos.dart';

final isGridListener = ValueNotifier(true);

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
            const _SearchBox(),
            24.vGap,
            const _Uploader(),
            24.vGap,
            const Expanded(
              child: _DataView(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Uploader extends StatelessWidget {
  const _Uploader();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadDocumentCubit, UploadDocumentState>(
      listener: (context, state) {
        state.whenOrNull(
          picked: (files) async {
            final filesUIdata = files
                .map(
                  (file) => file.path!.toFileUIdata,
                )
                .toList();

            await showModalBottomSheet<void>(
              context: context,
              // barrierDismissible: false,
              builder: (context) {
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
                                  style: context.theme.textTheme.titleLarge!
                                      .copyWith(
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
                                return CircularPercentIndicator(
                                  radius: 42,
                                  animation: true,
                                  animationDuration: 1200,
                                  lineWidth: 8,
                                  percent: progress > 1 ? 1 : progress,
                                  center: Text(
                                    progress > 1
                                        ? '100%'
                                        : '${(progress * 100).toInt()}%',
                                    style: context.theme.textTheme.labelSmall!
                                        .copyWith(
                                      color: context.colorScheme.primary,
                                    ),
                                  ),
                                  backgroundColor:
                                      context.colorScheme.primaryContainer,
                                  progressColor: context.colorScheme.primary,
                                );
                              },
                              uploaded: (documentGroup) {
                                return TextButton.icon(
                                  onPressed: () {
                                    context.router
                                        .pushNamed('/stamp-documents');
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
                                    context
                                        .read<UploadDocumentCubit>()
                                        .uploadFiles(
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
              },
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const _PickDocumentsAction(),
          initial: () => const _PickDocumentsAction(),
          picking: _PickDocumentsAction.processing,
          failure: (message) => _PickDocumentsAction.withError(
            message: message,
          ),
        );
      },
    );
  }
}

class _Loader extends StatelessWidget {
  final double progress;
  const _Loader({
    super.key,
    this.progress = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: (progress * 100) / context.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        8.hGap,
        Text('${(progress * 10).toStringAsFixed(1)}%')
      ],
    );
  }
}

class _PickDocumentsAction extends StatelessWidget {
  const _PickDocumentsAction({
    super.key,
    this.error,
    this.withError = false,
    this.processing = false,
  })  : assert(
          withError == true ? error != null : error == null,
          'No message should be provided when the error flag is set to false',
        ),
        assert(
          processing ? error == null : processing == false,
          'Processing and error flags cannot be set at the same time',
        );

  final String? error;
  final bool withError;
  final bool processing;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read<UploadDocumentCubit>().pickDocuments();
      },
      child: DottedBorder(
        dashPattern: const [3, 3, 3],
        borderType: BorderType.RRect,
        radius: const Radius.circular(14),
        color:
            withError ? context.colorScheme.error : context.colorScheme.primary,
        strokeCap: StrokeCap.round,
        child: Container(
          height: 120,
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: withError
                ? context.colorScheme.errorContainer
                : context.colorScheme.primaryContainer,
          ),
          child: Visibility(
            visible: !processing,
            replacement: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator.adaptive(),
                8.vGap,
                Text(
                  'Processing...',
                  style: context.theme.textTheme.bodyMedium,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  withError ? Hicons.warning : Hicons.upload,
                  size: 42,
                ),
                8.vGap,
                if (withError)
                  Text(
                    error!,
                    style: context.theme.textTheme.bodyMedium!
                        .copyWith(color: context.colorScheme.onErrorContainer),
                  )
                else
                  const Text('click to upload file...')
              ],
            ),
          ),
        ),
      ),
    );
  }

  factory _PickDocumentsAction.withError({required String message}) {
    return _PickDocumentsAction(
      error: message,
      withError: true,
    );
  }
  factory _PickDocumentsAction.processing() {
    return const _PickDocumentsAction(
      processing: true,
    );
  }
}

class _DataView extends StatelessWidget {
  const _DataView();

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
                        return _ActionLabel.grid(
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
                          child: _ActionLabel(
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

class _ActionLabel extends StatelessWidget {
  const _ActionLabel({
    required this.infos,
    required this.icon,
    required this.action,
    this.grid = false,
  });

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

  factory _ActionLabel.grid({
    required DocumentsGroupInfos infos,
    required Widget icon,
    required VoidCallback action,
  }) {
    return _ActionLabel(
      infos: infos,
      action: action,
      icon: icon,
      grid: true,
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

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
            child: const Center(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Hicons.search_2,
                    size: 18,
                  ),
                  hintText: 'Search files and folders',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
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
        )
      ],
    );
  }
}
