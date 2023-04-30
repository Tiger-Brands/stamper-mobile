// ignore_for_file: lines_longer_than_80_chars, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/colorx.dart';
import 'package:photoreboot/src/extensions/file_ui_datax.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/extensions/object.dart';
import 'package:photoreboot/src/features/home/domain/upload_document_cubit.dart';
import 'package:photoreboot/src/features/home/presentation/widgets/file_ui_infos.dart';
import 'package:photoreboot/src/features/stamper/domain/cubits/stamp_document_cubit.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

final selectedPages = ValueNotifier<List<int>>([]);
final stamptDocumentPageController = PageController();

@RoutePage(name: 'stampDocuments')
class StampDocuments extends StatelessWidget {
  const StampDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: stamptDocumentPageController,
        children: [
          BlocBuilder<UploadDocumentCubit, UploadDocumentState>(
            builder: (BuildContext context, UploadDocumentState state) {
              final files = state.maybeMap(
                orElse: () => null,
                uploaded: (state) => state.documentURLs,
              );
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 54),
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
                              BlocConsumer<StampDocumentCubit,
                                  StampDocumentState>(
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
                                            color: context
                                                .colorScheme.tertiary.inverse,
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
          ),
          Container(
            child: context.read<StampDocumentCubit>().state.maybeWhen(
                  orElse: () => const SizedBox(),
                  documentReady: (documentPath) {
                    final document = PdfDocument(
                      inputBytes: File(documentPath).readAsBytesSync(),
                    );
                    // get number of pages

                    return Column(
                      children: [
                        34.vGap,
                        SizedBox(
                          height: 200,
                          child: PDFView(
                            filePath: documentPath,
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
                        14.vGap,
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Text(
                                'Select the pages you want to stamp',
                                style: context.theme.textTheme.titleLarge!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colorScheme.primary,
                                ),
                              ),
                              Text(
                                'You can select multiple pages, tap on the pages number to select it',
                                style: context.theme.textTheme.labelMedium!
                                    .copyWith(
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: document.pages.count,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  if (selectedPages.value.contains(index)) {
                                    selectedPages.value = selectedPages.value
                                      ..remove(index);
                                    // ignore: cascade_invocations
                                    selectedPages.notifyListeners();
                                  } else {
                                    selectedPages.value = selectedPages.value
                                      ..add(index);
                                    // ignore: cascade_invocations
                                    selectedPages.notifyListeners();
                                  }
                                },
                                child: ValueListenableBuilder(
                                  valueListenable: selectedPages,
                                  builder: (context, widget, child) => Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color:
                                            selectedPages.value.contains(index)
                                                ? context.colorScheme.primary
                                                : context.colorScheme.primary
                                                    .inverse,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: context
                                              .theme.textTheme.bodyLarge!
                                              .copyWith(
                                            color: selectedPages.value
                                                    .contains(index)
                                                ? context.colorScheme.onPrimary
                                                : context.colorScheme.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        24.vGap,
                        BlocConsumer<StampDocumentCubit, StampDocumentState>(
                          listener: (context, state) {
                            state.maybeMap(
                              orElse: () {},
                              stamped: (state) {
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
                            return state.maybeWhen(
                              stamping: () => Column(
                                children: const [
                                  Text('Stamping document...'),
                                  CircularProgressIndicator.adaptive(),
                                ],
                              ),
                              orElse: () => TextButton.icon(
                                onPressed: () {
                                  context
                                      .read<StampDocumentCubit>()
                                      .stampDocument(
                                        pages: selectedPages.value,
                                        documentPath: documentPath,
                                      );
                                },
                                icon: Icon(
                                  Hicons.award_1,
                                  color: context.colorScheme.primary,
                                ),
                                label: Text(
                                  'Stamp Document',
                                  style: context.theme.textTheme.bodyMedium!
                                      .copyWith(
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
          ),
          BlocBuilder<StampDocumentCubit, StampDocumentState>(
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
          ),
        ],
      ),
    );
  }
}
