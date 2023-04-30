part of 'upload_document_cubit.dart';

@freezed
class UploadDocumentState with _$UploadDocumentState {
  const factory UploadDocumentState.initial() = _Initial;
  const factory UploadDocumentState.picking() = _Picking;
  const factory UploadDocumentState.picked({required List<PlatformFile> files}) =
      _Picked;
  const factory UploadDocumentState.uploading({required double progress}) =
      _Uploading;
  const factory UploadDocumentState.uploaded({
    required List<String> documentURLs,
  }) = _Uploaded;
  const factory UploadDocumentState.failure({required String message}) =
      _Failure;
}
