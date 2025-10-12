import 'package:adp_mobile/adp_mobile.dart';

import '../exception/platform_exceptions.dart';

/// Represents the mobile target platforms supported by the application.
///
/// This is a subset of Flutter's [TargetPlatform] and is used to abstract
/// platform-specific implementations for mobile devices.
enum MobileTargetPlatform {
  /// iOS: <https://www.apple.com/iOS>
  iOS,

  /// android: <https://www.android.com>
  android,
}

/// An extension on [MobileTargetPlatform] to provide utility methods.
extension TargetPlatformEx on MobileTargetPlatform {
  /// Converts the [MobileTargetPlatform] to the corresponding Flutter [TargetPlatform].
  TargetPlatform get targetPlatform {
    switch (this) {
      case MobileTargetPlatform.iOS:
        return TargetPlatform.iOS;
      case MobileTargetPlatform.android:
        return TargetPlatform.android;
    }
  }
}

/// An extension on [TargetPlatform] to provide utility methods for mobile platforms.
extension MobileTargetPlatformEx on TargetPlatform {
  /// Converts the current [TargetPlatform] to a [MobileTargetPlatform].
  ///
  /// This extension provides a convenient way to get a mobile-specific platform
  /// from the general Flutter `TargetPlatform`.
  ///
  /// For development purposes, it maps desktop platforms to their mobile
  /// counterparts:
  /// - [TargetPlatform.macOS] is treated as [MobileTargetPlatform.iOS].
  /// - [TargetPlatform.windows] is treated as [MobileTargetPlatform.android].
  ///
  /// Throws an [UnsupportedPlatformException] for other unsupported platforms.
  MobileTargetPlatform get mobileTargetPlatform {
    switch (this) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return MobileTargetPlatform.iOS;
      case TargetPlatform.android:
      case TargetPlatform.windows:
        return MobileTargetPlatform.android;
      default:
        throw UnsupportedPlatformException(name);
    }
  }
}
