import 'package:flutter/foundation.dart';

import '../enum/target.dart';
import 'platform_ruining.dart';

/// Type definition for a function returning a generic value.
typedef Value<T> = T Function();

/// Returns the adaptive value based on the current platform.
///
/// The [iOS] and [android] parameters are required, and they provide the
/// values to be returned for iOS and Android platforms, respectively.
///
/// The [web] parameter is optional, and it provides the value to be returned
/// for web platforms. If not provided, the default value for web,
/// will be either [iOS] or [android] based on [DefaultPlatformManager.platform].
///
/// Example:
/// ```dart
/// final result = adaptiveValue(
///   iOS: () => iOSValue,
///   android: () => androidValue,
///   web: () => webValue,
/// );
/// ```
T adaptiveValue<T>({
  required Value<T> iOS,
  required Value<T> android,
  Value<T>? web,
}) {
  if (kIsWeb) {
    return web?.call() ?? _handleWebPlatform<T>(iOS, android);
  }

  return _handleMobilePlatform<T>(iOS, android);
}

T _handleWebPlatform<T>(Value<T> iOS, Value<T> android) {
  if (kPlatformManager.targetWeb == MobileTargetPlatform.iOS) {
    return iOS();
  } else {
    return android();
  }
}

T _handleMobilePlatform<T>(Value<T> iOS, Value<T> android) {
  switch (PlatformRuining.targetPlatform) {
    case MobileTargetPlatform.iOS:
      return iOS();
    case MobileTargetPlatform.android:
      return android();
  }
}
