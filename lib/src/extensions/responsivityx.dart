import 'package:photoreboot/src/constants/breakpoints.dart';

extension ResponsivityX on double {
  bool get isMobile => this <= Constants.MOBILE_BREAKPOINT;
  bool get isTablet =>
      this > Constants.MOBILE_BREAKPOINT && this <= Constants.TABLET_BREAKPOINT;
  bool get isDesktop =>
      this > Constants.TABLET_BREAKPOINT &&
      this <= Constants.DESKTOP_BREAKPOINT;
}
