import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/features/home/data/models/file_ui_data.dart';
import 'package:photoreboot/src/generated/assets.dart';

extension FileUIdataX on String {
  FileUIdata get toFileUIdata {
    final fileExtension = split('.').last;
    final fileExtensionIcon = split('.').last;
    final fileName = split('/').last;
    final filePath = this;
    final fileSize = (File(this).lengthSync() / 1024 / 1024).toStringAsFixed(2);
    return FileUIdata(
      fileExtension: fileExtension,
      fileExtensionIcon: fileExtensionIcon,
      fileName: fileName,
      filePath: filePath,
      fileSize: double.parse(fileSize),
    );
  }

  Color getColorData(BuildContext context) {
    switch (this) {
      case 'pdf':
        return context.colorScheme.error;
      case 'docx':
        return context.colorScheme.primary;

      case 'jpg':
        return context.colorScheme.secondary;
      case 'png':
        return context.colorScheme.surface;
      default:
        return Colors.grey;
    }
  }

  String get getIcon {
    switch (trim().toLowerCase()) {
      case 'pdf':
        return Assets.assetsIconsPngPdf;
      case 'docx':
        return Assets.assetsIconsPngWord;
      case 'jpg':
        return Assets.assetsIconsPngJpg;
      case 'png':
        return Assets.assetsIconsPngJpg;
      default:
        return Assets.assetsIconsPngPdf;
    }
  }
}
