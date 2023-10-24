import 'package:flutter/material.dart';
import 'package:photoreboot/src/extensions/responsivityx.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
  });
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth.isDesktop) {
          return desktop;
        } else if (constraints.maxWidth.isTablet) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
