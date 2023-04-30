import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/colorx.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/extensions/object.dart';
import 'package:photoreboot/src/features/stamper/domain/cubits/stamp_document_cubit.dart';
import 'package:photoreboot/src/features/stamper/presentation/screens/stamp_document.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

final selectedPages = ValueNotifier<List<int>>([]);

class SelectPagesView extends StatelessWidget {
  const SelectPagesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          style: context.theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        // ignore: lines_longer_than_80_chars
                        Text(
                          'You can select multiple pages, tap on the pages number to select it',
                          style: context.theme.textTheme.labelMedium!.copyWith(
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
                                  color: selectedPages.value.contains(index)
                                      ? context.colorScheme.primary
                                      : context.colorScheme.primary.inverse,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: context.theme.textTheme.bodyLarge!
                                        .copyWith(
                                      color: selectedPages.value.contains(index)
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
                            context.read<StampDocumentCubit>().stampDocument(
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
                            style: context.theme.textTheme.bodyMedium!.copyWith(
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
    );
  }
}
