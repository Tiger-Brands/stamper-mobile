// ignore_for_file: inference_failure_on_instance_creation

import 'package:file_picker/file_picker.dart';
import 'package:photoreboot/src/features/home/domain/repository/upload_document_repository.dart';

class UploadDocumentService implements UploadDocumentRepo {
  @override
  Future<String> uploadDocument({
    required PlatformFile file,
    required void Function(int, int) onBytesSent,
  }) async {
    try {
      // simulate uploading
      final fileSize = file.size;
      var uploadedBytes = 0;
      while (uploadedBytes < fileSize) {
        await Future.delayed(const Duration(milliseconds: 500));
        uploadedBytes += 100000;
        onBytesSent(uploadedBytes, fileSize);
      }
      return file.path!;
    } catch (e) {
      throw Exception('Uploading failed...');
    }
  }
}
