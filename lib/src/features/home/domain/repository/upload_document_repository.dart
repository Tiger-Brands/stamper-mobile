import 'package:file_picker/file_picker.dart';

abstract class UploadDocumentRepo {
  Future<String> uploadDocument({
    required PlatformFile file,
    required void Function(int, int) onBytesSent,
  });
}
