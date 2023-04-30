// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart' show Color;
import 'package:photoreboot/src/features/home/data/enums/document_group_category.dart';

class DocumentsGroupInfos {
  final String name;
  final String summary;
  final int filesCount;
  final DocgroupCategory category;
  DocumentsGroupInfos({
    required this.name,
    required this.summary,
    required this.filesCount,
    required this.category,
  });
}

class ColorData {
  final Color main;
  final Color onMain;
  final Color secondary;
  ColorData({
    required this.main,
    required this.onMain,
    required this.secondary,
  });
}
