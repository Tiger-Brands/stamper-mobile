import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/features/home/domain/upload_document_cubit.dart';

class PickDocumentsAction extends StatelessWidget {
  const PickDocumentsAction({
    super.key,
    this.error,
    this.withError = false,
    this.processing = false,
  })  : assert(
          withError == true ? error != null : error == null,
          'No message should be provided when the error flag is set to false',
        ),
        assert(
          processing ? error == null : processing == false,
          'Processing and error flags cannot be set at the same time',
        );
  factory PickDocumentsAction.processing() {
    return const PickDocumentsAction(
      processing: true,
    );
  }

  factory PickDocumentsAction.withError({required String message}) {
    return PickDocumentsAction(
      error: message,
      withError: true,
    );
  }

  final String? error;
  final bool withError;
  final bool processing;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DottedBorder(
        dashPattern: const [3, 3, 3],
        borderType: BorderType.RRect,
        radius: const Radius.circular(14),
        color:
            withError ? context.colorScheme.error : context.colorScheme.primary,
        strokeCap: StrokeCap.round,
        child: Container(
          height: 120,
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: withError
                ? context.colorScheme.errorContainer
                : context.colorScheme.primaryContainer,
          ),
          child: Visibility(
            visible: !processing,
            replacement: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator.adaptive(),
                8.vGap,
                Text(
                  'Processing...',
                  style: context.theme.textTheme.bodyMedium,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  withError ? Hicons.warning : Hicons.upload,
                  size: 42,
                ),
                8.vGap,
                if (withError)
                  Text(
                    error!,
                    style: context.theme.textTheme.bodyMedium!
                        .copyWith(color: context.colorScheme.onErrorContainer),
                  )
                else
                  const Text('click to upload file...')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
