import 'package:flutter/foundation.dart';

import '../core.dart';

/// Instance of [DefaultsPlatformManager] for managing platform configurations.
final kPlatformManager = DefaultsPlatformManager.instance;

/// Helper class for platform-related checks and information retrieval.
abstract final class PlatformRuining {
  const PlatformRuining._();

  /// Check if the app is running on Debugging iOS.
  ///
  /// Returns true if [DefaultsPlatformManager._platform] is initialized with [MobileTargetPlatform.iOS] and isDebugging is 'true'.
  /// Otherwise, returns false.
  ///
  /// Example usage:
  /// ```dart
  /// void main() async {
  ///   DefaultsPlatformManager.initialize(
  ///     MobileTargetPlatform.iOS,
  ///     isDebugging: true,
  ///   );
  ///   runApp(const App());
  /// }
  static final isFakeIOS = _isTargetPlatform(MobileTargetPlatform.iOS);

  /// Check if the app is running on Real IOS.
  ///
  /// Returns true if [DefaultsPlatformManager] is not initialized or initialized with isDebugging as 'false'.
  ///
  /// Example usage:
  /// ```dart
  /// void main() async {
  ///   DefaultsPlatformManager.initialize(
  ///     MobileTargetPlatform.iOS,
  ///     isDebugging: false,
  ///   );
  ///   runApp(const App());
  /// }
  static final isRealIOS = !isWeb && _defaultTargetPlatform == TargetPlatform.iOS;

  /// Whether the app is running on either Real or Debugging IOS.
  static final isIOS = isRealIOS || isFakeIOS;

  /// Check if the app is running on Debugging Android.
  ///
  /// Returns true if [DefaultsPlatformManager._platform] is initialized with [MobileTargetPlatform.Android] and isDebugging is 'true'.
  /// Otherwise, returns false.
  ///
  /// Example usage:
  /// ```dart
  /// void main() async {
  ///   DefaultsPlatformManager.initialize(
  ///     MobileTargetPlatform.android,
  ///     isDebugging: true,
  ///   );
  ///   runApp(const App());
  /// }
  static final isFakeAndroid = _isTargetPlatform(MobileTargetPlatform.android);

  /// Check if the app is running on Real Android.
  ///
  /// Returns true if [DefaultsPlatformManager._platform] is not initialized or initialized with isDebugging as 'false'.
  ///
  /// Example usage:
  /// ```dart
  /// void main() async {
  ///   DefaultsPlatformManager.initialize(
  ///     MobileTargetPlatform.android,
  ///     isDebugging: false,
  ///   );
  ///   runApp(const App());
  /// }
  static final isRealAndroid = !isWeb && _defaultTargetPlatform == TargetPlatform.android;

  /// Whether the app is running on either Real or Debugging Android.
  static final isAndroid = isRealAndroid || isFakeAndroid;

  /// Whether the application is running on the web platform.
  static const isWeb = kIsWeb;

  /// Retrieve the current platform from [DefaultsPlatformManager], or use the default if it's null.
  static final targetPlatform = _debugMobileTargetPlatform ?? _defaultTargetPlatform.mobileTargetPlatform;

  /// Whether the app is currently in debugging mode.
  static final isDebugging = kPlatformManager.isDebugging;

  /// The default target platform when not in debugging mode.
  static final _defaultTargetPlatform = defaultTargetPlatform;

  /// The target platform when in debugging mode, obtained from [kPlatformManager]. Null if not in debugging mode.
  static final _debugMobileTargetPlatform = isDebugging ? kPlatformManager.targetPlatform : null;

  /// Check if the current or target platforms match the specified platform.
  static bool _isTargetPlatform(MobileTargetPlatform platform) {
    if (isWeb) {
      return kPlatformManager.targetWeb == platform;
    }

    return _debugMobileTargetPlatform == platform;
  }
}
