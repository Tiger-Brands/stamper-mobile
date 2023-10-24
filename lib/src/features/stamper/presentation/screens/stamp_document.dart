// ignore_for_file: lines_longer_than_80_chars, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photoreboot/src/features/stamper/presentation/widgets/download_document_view.dart';
import 'package:photoreboot/src/features/stamper/presentation/widgets/prepare_document_view.dart';
import 'package:photoreboot/src/features/stamper/presentation/widgets/select_pages_view.dart';
import 'package:photoreboot/src/features/stamper/presentation/widgets/stamp_preview.dart';

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
        children: const [
          PrepareDocumentView(),
          SelectPagesView(),
          StampPreview(),
          DownloadDocumentView(),
        ],
      ),
    );
  }
}
