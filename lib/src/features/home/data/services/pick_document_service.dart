import 'package:file_picker/file_picker.dart';
import 'package:photoreboot/src/extensions/object.dart';
import 'package:photoreboot/src/features/home/domain/repository/pick_document_repository.dart';

class PickDocumentService implements PickDocumentRepo {
  @override
  Future<List<PlatformFile>> pickDocuments() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'docx', 'doc'],
        onFileLoading: (status) {
          status.log();
        },
      );

      if (result != null) {
        final files = result.files.map((file) => file).toList();
        return files;
      } else {
        throw Exception('File selection failed or cancelled');
      }
    } catch (err) {
      throw Exception('action cancelled');
    }
  }
}
