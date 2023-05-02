// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/extensions/payment_method.dart';
import 'package:photoreboot/src/features/stamper/data/enums/payment_methods.dart';
import 'package:photoreboot/src/features/stamper/domain/cubits/payment_cubit/notchpay_cubit.dart';
import 'package:photoreboot/src/features/stamper/domain/cubits/stamp_document_cubit.dart';
import 'package:photoreboot/src/shared/widgets/button.dart';
import 'package:photoreboot/src/shared/widgets/input.dart';

class StampPreview extends StatelessWidget {
  const StampPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StampDocumentCubit, StampDocumentState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(child: Text('No document stamped')),
          stamped: (stampedDocumentInfos) {
            return Column(
              children: [
                34.vGap,
                Row(
                  children: [
                    Text(
                      'Document Stamped',
                      style: context.theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                14.vGap,
                Text(
                  'Your document has been stamped, proceed with payment to be able to download your document.',
                  style: context.theme.textTheme.labelMedium!.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                24.vGap,
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stampedDocumentInfos.selectedPageImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final pageImage =
                          stampedDocumentInfos.selectedPageImages[index];
                      return DottedBorder(
                        dashPattern: const [3, 3, 3],
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(14),
                        color: context.colorScheme.primary,
                        strokeCap: StrokeCap.round,
                        child: Container(
                          height: 180,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: context.colorScheme.primaryContainer,
                          ),
                          child: RawImage(
                            image: pageImage.imageIfAvailable,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                24.vGap,
                Button(
                  action: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (context) {
                        return const _PaymentFormSheet();
                      },
                    );
                  },
                  text: 'Start Payment',
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _PaymentFormSheet extends StatelessWidget {
  const _PaymentFormSheet();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Form',
                      style: context.theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    const Text(
                      'Complete checkout infos',
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: context.colorScheme.primary,
                    size: 18,
                  ),
                ),
              ],
            ),
            14.vGap,
            const Divider(),
            14.vGap,
            const Text(
              'Payment Method',
            ),
            14.vGap,
            DropdownButton<String>(
              underline: const SizedBox.shrink(),
              value: 'Orange Money',
              onChanged: (method) {},
              items: PaymentMethod.orange.toNameList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Image.asset(
                        value.getPaymentProviderLogo,
                        width: 24,
                      ),
                      8.hGap,
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
            ),
            Input(
              label: 'Orange money number',
              hint: '+237699303940',
              controller: TextEditingController(),
            ),
            14.vGap,
            BlocConsumer<NotchpayCubit, NotchpayState>(
              listener: (BuildContext context, NotchpayState state) {
                state.whenOrNull(
                  initialized: (data) {
                    showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Payment confirmation'),
                        content: Column(
                          children: [
                            const Text('Your payment has been initialized...'),
                            _TransactionDetail(
                              'Number',
                              data.transaction.customer.phone,
                            ),
                            _TransactionDetail(
                              'Total amount',
                              data.transaction.amount.toString(),
                            ),
                            Button(
                              action: () {},
                              text: 'Confirm and pay',
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              builder: (BuildContext context, NotchpayState state) {
                return Button(
                  action: () {},
                  text: 'Request and pay',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionDetail extends StatelessWidget {
  const _TransactionDetail(this.title, this.data);
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Hicons.call),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Text(data),
      ],
    );
  }
}
