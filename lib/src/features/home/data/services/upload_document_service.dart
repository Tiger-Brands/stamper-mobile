// ignore_for_file: inference_failure_on_instance_creation

import 'dart:io';

import 'package:photoreboot/src/features/home/domain/repository/upload_document_repository.dart';

class UploadDocumentService implements UploadDocumentRepo {
  @override
  Future<String> uploadDocument({
    required File file,
    required void Function(int, int) onBytesSent,
  }) async {
    try {
      // simulate uploading
      final fileSize = file.lengthSync();
      var uploadedBytes = 0;
      while (uploadedBytes < fileSize) {
        await Future.delayed(const Duration(milliseconds: 500));
        uploadedBytes += 100000;
        onBytesSent(uploadedBytes, fileSize);
      }
      return file.path;
    } catch (e) {
      throw Exception('Uploading failed...');
    }
  }
}
