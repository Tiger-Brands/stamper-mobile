import 'package:photoreboot/src/generated/assets.dart';

extension LocUtilsX on String {
  String get icon {
    switch (this) {
      case 'en':
        return Assets.assetsIconsPngEn;
      case 'fr':
        return Assets.assetsIconsPngFr;
      case 'es':
        return Assets.assetsIconsPngEs;
      case 'de':
        return Assets.assetsIconsPngDe;
      case 'ar':
        return Assets.assetsIconsPngAr;
      case 'zh':
        return Assets.assetsIconsPngZh;
      default:
        return Assets.assetsIconsPngEn;
    }
  }

  String get language {
    switch (this) {
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      case 'es':
        return 'Spanish';
      case 'de':
        return 'Deutsch';
      case 'ar':
        return 'Arabic';
      case 'zh':
        return 'Chinese';
      default:
        return 'English';
    }
  }
}
