enum PaymentMethod {
  orange,
  mtn,
  visa,
  mastercard,
  notchpay,
  bank,
  paypal,
}

extension PaymentMethodX on PaymentMethod {
  String get toName {
    switch (this) {
      case PaymentMethod.orange:
        return 'Orange Money';
      case PaymentMethod.mtn:
        return 'MTN Mobile Money';
      case PaymentMethod.visa:
        return 'Visa';
      case PaymentMethod.mastercard:
        return 'MasterCard';
      case PaymentMethod.notchpay:
        return 'NotchPay';
      case PaymentMethod.bank:
        return 'Bank';
      case PaymentMethod.paypal:
        return 'PayPal';
    }
  }

  List<String> get toNameList {
    return PaymentMethod.values.map((e) => e.toName).toList();
  }

  String getNotchPayChannel() {
    switch (this) {
      case PaymentMethod.orange:
        return 'om';
      case PaymentMethod.mtn:
        return 'mtn-momo';
      case PaymentMethod.visa:
        return 'card';
      case PaymentMethod.mastercard:
        return 'card';
      case PaymentMethod.notchpay:
        return 'notchpay';
      case PaymentMethod.bank:
        return 'banktransfer';
      case PaymentMethod.paypal:
        return 'paypal';
    }
  }
}
