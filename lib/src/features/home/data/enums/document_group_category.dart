enum DocgroupCategory {
  concours,
  exams,
  work,
  medical,
  travel,
  civil,
  school,
  other
}

// extension to get string value of enum
extension DocgroupCategoryExtension on DocgroupCategory {
  String get value {
    switch (this) {
      case DocgroupCategory.concours:
        return 'concours';
      case DocgroupCategory.exams:
        return 'exams';
      case DocgroupCategory.work:
        return 'work';
      case DocgroupCategory.medical:
        return 'medical';
      case DocgroupCategory.travel:
        return 'travel';
      case DocgroupCategory.civil:
        return 'civil';
      case DocgroupCategory.school:
      case DocgroupCategory.other:
        return 'other';
    }
  }
}
