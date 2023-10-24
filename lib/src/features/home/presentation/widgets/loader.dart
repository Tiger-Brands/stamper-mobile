import 'package:flutter/material.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/num.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.progress = 0.1,
  });
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: (progress * 100) / context.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        8.hGap,
        Text('${(progress * 10).toStringAsFixed(1)}%'),
      ],
    );
  }
}
