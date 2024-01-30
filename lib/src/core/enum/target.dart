import 'package:flutter/foundation.dart';

import '../exception/platform_exceptions.dart';

enum MobileTargetPlatform {
  /// iOS: <https://www.apple.com/iOS>
  iOS,

  /// android: <https://www.android.com>
  android,
}

extension TargetPlatformEx on MobileTargetPlatform {
  TargetPlatform get targetPlatform {
    switch (this) {
      case MobileTargetPlatform.iOS:
        return TargetPlatform.iOS;
      case MobileTargetPlatform.android:
        return TargetPlatform.android;
    }
  }
}

extension DesktopTargetPlatformEx on TargetPlatform {
  MobileTargetPlatform get mobileTargetPlatform {
    switch (this) {
      case TargetPlatform.iOS:
        return MobileTargetPlatform.iOS;
      case TargetPlatform.android:
        return MobileTargetPlatform.android;

      default: throw UnsupportedPlatformException(name);
    }
  }
}

