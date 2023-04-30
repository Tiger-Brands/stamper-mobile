import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photoreboot/src/features/home/data/services/pick_document_service.dart';
import 'package:photoreboot/src/features/home/data/services/upload_document_service.dart';

part 'upload_document_state.dart';
part 'upload_document_cubit.freezed.dart';

class UploadDocumentCubit extends Cubit<UploadDocumentState> {
  UploadDocumentCubit() : super(const UploadDocumentState.initial());

  Future<void> pickDocuments() async {
    try {
      final service = PickDocumentService();
      emit(const UploadDocumentState.picking());
      final files = await service.pickDocuments();

      emit(UploadDocumentState.picked(files: files));
    } catch (e) {
      throw Exception('Action failed or cancelled');
    }
  }

  Future<void> uploadFiles({required List<PlatformFile> files}) async {
    try {
      final service = UploadDocumentService();
      final totalSize = files.fold<int>(0, (sum, file) => sum + file.size);
      var uploadedBytes = 0;

      emit(const UploadDocumentState.uploading(progress: 0));
      final urls = await Future.wait(
        files.map(
          (file) async {
            final url = await service.uploadDocument(
              file: file,
              onBytesSent: (int bytesSent, int totalBytes) {
                uploadedBytes += bytesSent;
                final progress = uploadedBytes / totalSize;
                emit(UploadDocumentState.uploading(progress: progress));
              },
            );
            uploadedBytes += file.size;
            final progress = uploadedBytes / totalSize;
            emit(UploadDocumentState.uploading(progress: progress));
            return url;
          },
        ),
      );

      emit(UploadDocumentState.uploaded(documentURLs: urls));
    } catch (e) {
      throw Exception('Action failed or cancelled');
    }
  }
}
