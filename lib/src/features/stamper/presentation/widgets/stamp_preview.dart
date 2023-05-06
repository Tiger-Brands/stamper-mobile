// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoreboot/src/extensions/build_context.dart';
import 'package:photoreboot/src/extensions/num.dart';
import 'package:photoreboot/src/extensions/payment_method.dart';
import 'package:photoreboot/src/features/stamper/data/enums/payment_methods.dart';
import 'package:photoreboot/src/features/stamper/data/requests/notch_pay_confirm_request.dart';
import 'package:photoreboot/src/features/stamper/data/requests/notch_pay_init_request.dart';
import 'package:photoreboot/src/features/stamper/domain/cubits/payment_cubit/notchpay_cubit.dart';
import 'package:photoreboot/src/features/stamper/domain/cubits/stamp_document_cubit.dart';
import 'package:photoreboot/src/features/stamper/presentation/screens/stamp_document.dart';
import 'package:photoreboot/src/shared/widgets/button.dart';
import 'package:photoreboot/src/shared/widgets/input.dart';

final activePaymentMethod = ValueNotifier('Orange Money');

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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
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
              ),
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
            ValueListenableBuilder(
              valueListenable: activePaymentMethod,
              builder: (context, activeMethod, child) => DropdownButton<String>(
                underline: const SizedBox.shrink(),
                value: activeMethod,
                onChanged: (method) {
                  activePaymentMethod.value = method!;
                },
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
                    Navigator.pop(context);
                    showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              context.router.pop();
                            },
                          ),
                          BlocConsumer<NotchpayCubit, NotchpayState>(
                            listener:
                                (BuildContext context, NotchpayState state) {
                              state.maybeWhen(
                                orElse: () {},
                                confirmed: (data) {
                                  Navigator.pop(context);
                                  stamptDocumentPageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              );
                            },
                            builder:
                                (BuildContext context, NotchpayState state) {
                              return state.maybeWhen(
                                orElse: () => TextButton(
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    final confirmRequest =
                                        NotchpayConfirmRequest(
                                      channel: 'mobile',
                                      data: Data(
                                        phone: '+237654495515',
                                      ),
                                    );
                                    context.read<NotchpayCubit>().confirm(
                                          request: confirmRequest,
                                          reference: data.transaction.reference,
                                        );
                                  },
                                ),
                                confirming: () {
                                  return const CircularProgressIndicator();
                                },
                              );
                            },
                          )
                        ],
                        title: const Text(
                          'Confirmation',
                        ),
                        content: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Your payment has been initialized...',
                              ),
                              14.vGap,
                              _TransactionDetail(
                                'Number',
                                data.transaction.customer.phone,
                              ),
                              4.vGap,
                              _TransactionDetail(
                                'Total amount',
                                data.transaction.amount.toString(),
                              ),
                              14.vGap
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              builder: (BuildContext context, NotchpayState state) {
                final request = NotchpayInitRequest(
                  email: 'baimamboukar@gmail.com',
                  currency: 'XAF',
                  phone: '+237654495515',
                  amount: '1500',
                  description: 'Frais de timbrage',
                );
                return state.maybeWhen(
                  orElse: () => Button(
                    action: () {
                      context
                          .read<NotchpayCubit>()
                          .initialize(request: request);
                    },
                    text: 'Request and pay',
                  ),
                  initializing: () => GestureDetector(
                    onTap: () {
                      context
                          .read<NotchpayCubit>()
                          .emit(const NotchpayState.initial());
                    },
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
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
        4.vGap,
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
