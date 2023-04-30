import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:photoreboot/src/features/home/data/services/pick_document_service.dart';
import 'package:photoreboot/src/features/home/data/services/upload_document_service.dart';

part 'upload_document_state.dart';
part 'upload_document_cubit.freezed.dart';

class UploadDocumentCubit extends HydratedCubit<UploadDocumentState> {
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

  Future<void> uploadFiles({required List<File> files}) async {
    try {
      final service = UploadDocumentService();
      final totalSize =
          files.fold<int>(0, (sum, file) => sum + file.lengthSync());
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
            uploadedBytes += file.lengthSync();
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

  @override
  Map<String, dynamic> toJson(UploadDocumentState state) {
    return state.maybeMap(
      initial: (state) => {},
      picked: (state) => {
        'files': state.files.map((file) => file.path).toList(),
      },
      uploaded: (state) => {
        'filesUploaded': state.documentURLs,
      },
      uploading: (state) => {
        'loadingProgress': state.progress,
      },
      failure: (state) => {
        'message': state.message,
      },
      orElse: () => {},
    );
  }

  @override
  UploadDocumentState fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      if (json['filesUploaded'] != null) {
        return UploadDocumentState.uploaded(
          documentURLs: (json['filesUploaded'] as List<String>).toList(),
        );
      }
      if (json['loadingProgress'] != null) {
        return UploadDocumentState.uploading(
          progress: json['loadingProgress'] as double,
        );
      }
      if (json['message'] != null) {
        return UploadDocumentState.failure(
          message: json['message'] as String,
        );
      }
      return UploadDocumentState.picked(
        files: (json['files'] as List<String>).map(File.new).toList(),
      );
    } else {
      return const UploadDocumentState.initial();
    }
  }
}
