import 'dart:io';

abstract class PickDocumentRepo {
  Future<List<File>> pickDocuments();
}
