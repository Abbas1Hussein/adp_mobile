import 'package:flutter/foundation.dart';

import '../enum/target.dart';
import 'platform_ruining.dart';

/// Type definition for a function returning a generic value.
typedef Value<T> = T Function();

/// Returns the adaptive value based on the current platform.
///
/// The [ios] and [android] parameters are required, and they provide the
/// values to be returned for iOS and Android platforms, respectively.
///
/// The [web] parameter is optional, and it provides the value to be returned
/// for web platforms. If not provided, the default value for web,
/// will be either [ios] or [android] based on [DefaultPlatformManager.platform].
///
/// Example:
/// ```dart
/// final result = adaptiveValue(
///   ios: () => iosValue,
///   android: () => androidValue,
///   web: () => webValue,
/// );
/// ```
T adaptiveValue<T>({
  required Value<T> ios,
  required Value<T> android,
  Value<T>? web,
}) {
  if (kIsWeb) {
    return web?.call() ?? _handleWebPlatform<T>(ios, android);
  }

  return _handleMobilePlatform<T>(ios, android);
}

T _handleWebPlatform<T>(Value<T> ios, Value<T> android) {
  if (kPlatformManager.targetWeb == MobileTargetPlatform.iOS) {
    return ios();
  } else {
    return android();
  }
}

T _handleMobilePlatform<T>(Value<T> ios, Value<T> android) {
  switch (PlatformRuining.targetPlatform) {
    case MobileTargetPlatform.iOS:
      return ios();
    case MobileTargetPlatform.android:
      return android();
  }
}
