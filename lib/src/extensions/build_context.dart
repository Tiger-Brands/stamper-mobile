import 'package:flutter/material.dart';
import 'package:photoreboot/src/features/home/data/enums/document_group_category.dart';
import 'package:photoreboot/src/features/home/data/models/document_infos.dart';

extension BuildContextX on BuildContext {
  /// Extension methods for [BuildContext] to access the [ThemeData] of the
  /// current [Theme], including [Brightness].
  /// ```dart
  /// context.theme
  /// context.typography
  /// context.scheme
  /// context.brightness
  /// context.isLight
  /// context.isDark
  /// ```

  ThemeData get theme => Theme.of(this);

  /// Get the [TextTheme] of the current [Theme].
  ///
  /// ```dart
  /// context.typography
  /// ```
  TextTheme get typography => theme.textTheme;
  TextStyle get titleLg => typography.titleLarge!.copyWith(
        //fontWeight: FontWeight.w600,
        color: colorScheme.onBackground,
      );
  TextStyle get displayLg => typography.displayLarge!.copyWith(
        //fontWeight: FontWeight.w600,
        color: colorScheme.onBackground,
      );
  TextStyle get bodySm => typography.bodySmall!.copyWith(
        //fontWeight: FontWeight.w600,
        color: colorScheme.onBackground,
      );
  TextStyle get bodyMd => typography.bodyMedium!.copyWith(
        //fontWeight: FontWeight.w600,
        color: colorScheme.onBackground,
      );
  TextStyle get bodyLg => typography.bodyLarge!.copyWith(
        //fontWeight: FontWeight.w600,
        color: colorScheme.onBackground,
      );

  /// Get the [ColorScheme] of the current [Theme].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Get the [Brightness] of the current [Theme].
  Brightness get brightness => theme.brightness;

  /// Get the [Brightness] of the current [Theme].
  bool get isLight => brightness == Brightness.light;
  bool get isDark => brightness == Brightness.dark;

  /// Get [MediaQueryData] of the current [BuildContext].
  /// ```dart
  /// context.mediaQuery
  /// context.size
  /// context.width
  /// context.height
  /// context.orientation
  /// context.isPortrait
  /// context.isLandscape
  /// ```

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;
  Orientation get orientation => mediaQuery.orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;
}

extension ColorDataX on DocgroupCategory {
  // GET COLOR DATA BASED ON DOCUMENT GROUP TYPE
  ColorData getColorData(BuildContext context) {
    switch (this) {
      case DocgroupCategory.concours:
        return ColorData(
          main: context.colorScheme.primary,
          onMain: context.colorScheme.onPrimary,
          secondary: context.colorScheme.secondary,
        );
      case DocgroupCategory.medical:
        return ColorData(
          main: context.colorScheme.errorContainer,
          onMain: context.colorScheme.onErrorContainer,
          secondary: context.colorScheme.error,
        );
      case DocgroupCategory.exams:
        return ColorData(
          main: context.colorScheme.secondaryContainer,
          onMain: context.colorScheme.onSecondaryContainer,
          secondary: context.colorScheme.secondary,
        );
      case DocgroupCategory.work:
        return ColorData(
          main: context.colorScheme.tertiaryContainer,
          onMain: context.colorScheme.onTertiaryContainer,
          secondary: context.colorScheme.tertiary,
        );
      case DocgroupCategory.travel:
        return ColorData(
          main: context.colorScheme.primaryContainer,
          onMain: context.colorScheme.onPrimaryContainer,
          secondary: context.colorScheme.primary,
        );

      case DocgroupCategory.school:
        return ColorData(
          main: context.colorScheme.tertiary,
          onMain: context.colorScheme.onTertiary,
          secondary: context.colorScheme.tertiaryContainer,
        );
      case DocgroupCategory.civil:
        return ColorData(
          main: context.colorScheme.tertiary,
          onMain: context.colorScheme.onTertiary,
          secondary: context.colorScheme.tertiaryContainer,
        );
      case DocgroupCategory.other:
        return ColorData(
          main: context.colorScheme.tertiary,
          onMain: context.colorScheme.onTertiary,
          secondary: context.colorScheme.tertiaryContainer,
        );
    }
  }
}
