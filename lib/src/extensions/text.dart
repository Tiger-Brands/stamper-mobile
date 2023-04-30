import 'package:flutter/material.dart';

extension OmnisenseTextExtension on Text {
  /// Extension methods for [Text] to apply [TextStyle]s.
  /// ```dart
  /// Text('Hello World').titleLg
  /// Text('Hello World').displayLg
  /// Text('Hello World').bodySm
  /// Text('Hello World').bodyMd
  /// Text('Hello World').bodyLg
  /// ```

  /// Make a Text widget bold by applying a [FontWeight.bold] to the [TextStyle].
  /// ```dart
  /// Text('Hello World').boldify
  /// ```
}
