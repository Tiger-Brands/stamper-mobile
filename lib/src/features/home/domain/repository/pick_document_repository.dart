import 'package:file_picker/file_picker.dart' show PlatformFile;

abstract class PickDocumentRepo {
  Future<List<PlatformFile>> pickDocuments();
}
