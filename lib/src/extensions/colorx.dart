import 'package:flutter/material.dart';

extension ColorsX on Color {
  Color get inverse {
    return Color.fromARGB(255, 255 - red, 255 - green, 255 - blue);
  }
}
