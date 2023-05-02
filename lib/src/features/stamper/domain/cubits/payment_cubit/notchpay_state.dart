part of 'notchpay_cubit.dart';

@freezed
abstract class NotchpayState with _$NotchpayState {
  const factory NotchpayState.initial() = _Initial;
  const factory NotchpayState.initializing() = _Initializing;
  const factory NotchpayState.initialized({
    required NotchPayInitResponse data,
  }) = _Initialized;
  const factory NotchpayState.confirming() = _Confirming;
  const factory NotchpayState.confirmed({
    required NotchPayConfirmResponse data,
  }) = _Confirmed;
}
