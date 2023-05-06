import 'package:photoreboot/src/generated/assets.dart';

extension PaymentMethodLogoX on String {
  String get getPaymentProviderLogo {
    switch (this) {
      case 'Orange Money':
        return Assets.assetsIconsPngOm;
      case 'MTN Mobile Money':
        return Assets.assetsIconsPngMomo;
      case 'Visa':
        return Assets.assetsIconsPngVisa;
      case 'MasterCard':
        return Assets.assetsIconsPngMastercard;
      case 'Paypal':
        return Assets.assetsIconsPngPaypal;
      case 'Bank':
        return Assets.assetsIconsPngUba;
      case 'NotchPay':
        return Assets.assetsIconsPngNotchpay;

      default:
        return Assets.assetsIconsPngOm;
    }
  }
}
