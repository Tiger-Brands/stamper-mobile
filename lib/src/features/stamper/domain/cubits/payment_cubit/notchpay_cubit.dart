import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photoreboot/src/configs/dio_config.dart';
import 'package:photoreboot/src/features/stamper/data/api/stamp_document_payment_service.dart';
import 'package:photoreboot/src/features/stamper/data/requests/notch_pay_confirm_request.dart';
import 'package:photoreboot/src/features/stamper/data/requests/notch_pay_init_request.dart';
import 'package:photoreboot/src/features/stamper/data/responses/notch_pay_confirm_response.dart';
import 'package:photoreboot/src/features/stamper/data/responses/notch_pay_initialize_response.dart';

part 'notchpay_state.dart';
part 'notchpay_cubit.freezed.dart';

class NotchpayCubit extends Cubit<NotchpayState> {
  NotchpayCubit() : super(const NotchpayState.initial());

  Future<void> initialize({
    required NotchpayInitRequest request,
  }) async {
    try {
      final service = StampDocumentPaymentService();
      emit(const NotchpayState.initializing());
      final response = await service.initializePayment(dio, request);
      emit(NotchpayState.initialized(data: response));
    } catch (err) {
      rethrow;
    }
  }

  Future<void> confirm({
    required NotchpayConfirmRequest request,
    required String reference,
  }) async {
    try {
      final service = StampDocumentPaymentService();
      emit(const NotchpayState.confirming());
      final response = await service.confirmPayment(dio, request, reference);
      emit(NotchpayState.confirmed(data: response));
    } catch (err) {
      rethrow;
    }
  }
}
