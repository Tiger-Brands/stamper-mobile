import 'package:flutter/material.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/colorx.dart';
import 'package:photoreboot/src/extensions/num.dart';

class Button extends StatelessWidget {
  const Button({
    required this.text,
    this.action,
    this.color,
    super.key,
    this.width = .9,
    this.icon,
    this.textColor,
  });
  final IconData? icon;
  final String text;
  final VoidCallback? action;
  final Color? color;
  final double width;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: context.width,
        height: 54,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: context.bodyLg.copyWith(
                fontWeight: FontWeight.bold,
                color: (color ?? context.colorScheme.primary).inverse,
              ),
            ),
            if (icon != null) ...[
              8.hGap,
              Icon(icon),
            ]
          ],
        ),
      ),
    );
  }
}
