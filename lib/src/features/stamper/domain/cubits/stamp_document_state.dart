part of 'stamp_document_cubit.dart';

@freezed
class StampDocumentState with _$StampDocumentState {
  const factory StampDocumentState.initial() = _Initial;
  const factory StampDocumentState.processing() = _Processing;
  const factory StampDocumentState.documentReady({
    required String documentPath,
  }) = _DocumentReady;
  const factory StampDocumentState.pagesChoosen({
    required List<int> pages,
  }) = _PagesChoosen;
  const factory StampDocumentState.stamping() = _Stamping;
  const factory StampDocumentState.stamped({
    required StampedDocumentInfos stampedDocument,
  }) = _Stamped;
}
