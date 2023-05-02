import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pdf_render/pdf_render.dart' as render;
import 'package:photoreboot/src/features/stamper/data/models/stamped_document.dart';
import 'package:photoreboot/src/generated/assets.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

part 'stamp_document_cubit.freezed.dart';
part 'stamp_document_state.dart';

class StampDocumentCubit extends Cubit<StampDocumentState> {
  StampDocumentCubit() : super(const StampDocumentState.initial());

  Future<void> getDocumentReady({required String documentPath}) async {
    try {
      emit(const StampDocumentState.processing());
      await Future.delayed(const Duration(seconds: 2));
      emit(StampDocumentState.documentReady(documentPath: documentPath));
    } catch (e) {
      throw Exception('Failed to process and get document ready!');
    }
  }

  Future<void> choosePages({required List<int> pages}) async {
    try {
      emit(StampDocumentState.pagesChoosen(pages: pages));
    } catch (e) {
      throw Exception('Failed to choose pages!');
    }
  }

  Future<void> stampDocument({
    required List<int> pages,
    required String documentPath,
    String? stampPath,
  }) async {
    try {
      emit(const StampDocumentState.stamping());
      final stampBytes = await _loadAssetBytes(Assets.assetsUtilsTimbre);
      final qrBytes = await _loadAssetBytes(Assets.assetsUtilsQrData);

      // add png image in top of each [pages] of [documentPath]
      final document =
          PdfDocument(inputBytes: File(documentPath).readAsBytesSync());
      for (final pageIndex in pages) {
        document.pages[pageIndex].graphics.drawImage(
          PdfBitmap(qrBytes),
          Rect.fromLTWH(
            document.pages[pageIndex].size.width - 240,
            20,
            84,
            84,
          ),
        );
        document.pages[pageIndex].graphics.drawImage(
          PdfBitmap(stampBytes),
          Rect.fromLTWH(
            document.pages[pageIndex].size.width - 164,
            20,
            154,
            84,
          ),
        );
      }
      final stampedData = await document.save();
      document.dispose();
      final docFromData =
          await render.PdfDocument.openData(Uint8List.fromList(stampedData));
      final selectedPageImages = <render.PdfPageImage>[];
      for (final pageIndex in pages) {
        final page = await docFromData.getPage(pageIndex);
        final pageImage = await page.render();
        await pageImage.createImageIfNotAvailable();
        selectedPageImages.add(pageImage);
      }
      final stampedDocument = StampedDocumentInfos(
        document: Uint8List.fromList(stampedData),
        selectedPageImages: selectedPageImages,
        pagesStamped: pages,
        originalDocumentPath: documentPath,
        stampedAt: DateTime.now(),
      );
      emit(
        StampDocumentState.stamped(
          stampedDocument: stampedDocument,
        ),
      );
    } catch (e) {
      throw Exception('Failed to stamp document!');
    }
  }

  Future<Uint8List> _loadAssetBytes(String assetName) async {
    final data = await rootBundle.load(assetName);
    return data.buffer.asUint8List();
  }
}
