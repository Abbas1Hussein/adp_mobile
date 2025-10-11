import 'package:adp_mobile/adp_mobile.dart';

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
    bool isDebugging = true,
  })  : _targetWeb = targetWeb,
        _isDebugging = isDebugging;

  /// Initializes the DefaultsPlatformManager with the specified parameters.
  ///
  /// Throws an error if the manager is already initialized.
  factory DefaultsPlatformManager.initialize({
    required MobileTargetPlatform targetPlatform,
    MobileTargetPlatform? targetWeb,
    bool isDebugging = true,
  }) { assert(
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
    assert(_instance != null, 'DefaultsPlatformManager is not initialized.');
    return _instance!;
  }

  static DefaultsPlatformManager? _instance;
}
