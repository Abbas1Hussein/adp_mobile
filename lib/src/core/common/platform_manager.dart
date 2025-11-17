import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/foundation.dart';

/// Manages default configurations for the mobile platform.
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
/// ```
class DefaultsPlatformManager {
  const DefaultsPlatformManager._(
    this._platform, {
    MobileTargetPlatform? targetWeb,
    bool isDebugging = kDebugMode,
  })  : _targetWeb = targetWeb,
        _isDebugging = isDebugging;

  /// Initializes the DefaultsPlatformManager with the specified parameters.
  ///
  /// - [targetPlatform] Use MobileTargetPlatform.<value> for the application:
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
  /// ```
  ///
  /// - [targetWeb] is the target web platform or defaults to [targetPlatform] if not specified.
  /// - [isDebugging] is the debugging status for the application, If set to false,
  /// the [targetPlatform] parameter will be ignored, and the specific widget behavior will depend on the base platform.
  ///
  /// Throws an error if the manager is already initialized.
  factory DefaultsPlatformManager.initialize({
    required MobileTargetPlatform targetPlatform,
    MobileTargetPlatform? targetWeb,
    bool isDebugging = kDebugMode,
  }) {
    assert(
        _instance == null, 'DefaultsPlatformManager is already initialized.');

    return _instance = DefaultsPlatformManager._(
      targetPlatform,
      targetWeb: targetWeb,
      isDebugging: isDebugging,
    );
  }

  /// the debugging status for the application.
  bool get isDebugging => _isDebugging;
  final bool _isDebugging;

  /// the Mobile target platform for the application.
  MobileTargetPlatform get targetPlatform => _platform;
  final MobileTargetPlatform _platform;

  /// the target web platform or defaults to [targetPlatform] if not specified.
  MobileTargetPlatform get targetWeb => _targetWeb ?? _platform;
  final MobileTargetPlatform? _targetWeb;

  /// Gets the singleton instance of DefaultsPlatformManager.
  ///
  /// Throws an error if the manager is not initialized.
  static DefaultsPlatformManager get instance {
    ensureInitialized();

    return _instance!;
  }

  static bool get isInitialized => _instance != null;

  /// Ensures that the manager has been initialized.
  ///
  /// Throws an error if the manager is not initialized.
  static void ensureInitialized() {
    if (!isInitialized) {
      throw StateError(
        'DefaultsPlatformManager has not been initialized.\n'
        'Call DefaultsPlatformManager.initialize() before accessing instance.',
      );
    }
  }

  static DefaultsPlatformManager? _instance;
}
