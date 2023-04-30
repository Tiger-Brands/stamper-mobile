import 'dart:io';

abstract class UploadDocumentRepo {
  Future<String> uploadDocument({
    required File file,
    required void Function(int, int) onBytesSent,
  });
}
