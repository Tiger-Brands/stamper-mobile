// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

class StampedDocumentInfos {
  final Uint8List document;
  final List<int> pagesStamped;
  final String originalDocumentPath;
  final DateTime stampedAt;
  StampedDocumentInfos({
    required this.document,
    required this.pagesStamped,
    required this.originalDocumentPath,
    required this.stampedAt,
  });
}
