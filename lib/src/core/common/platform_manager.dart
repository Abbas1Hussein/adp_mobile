import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:window_manager/window_manager.dart';

/// Manages default configurations for the mobile platform.
///
/// Example usage:
/// ```dart
/// void main() async {
///   DefaultsPlatformManager.initialize(
///     MobileTargetPlatform.windows,
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
  }) {
    assert(
        _instance == null, 'DefaultsPlatformManager is already initialized.');

    if (isDebugging && !kIsWeb) {
      _initializeWindowConfiguration();
    }

    return _instance = DefaultsPlatformManager._(
      targetPlatform,
      targetWeb: targetWeb,
      isDebugging: isDebugging,
    );
  }

  /// Initializes window configuration for the application.
  ///
  /// Hides the default title bar.
  static Future<void> _initializeWindowConfiguration() async {
    WidgetsFlutterBinding.ensureInitialized();

    const size = Size(345, 600);

    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      size: size,
      center: true,
      titleBarStyle: TitleBarStyle.hidden,
    );
    await windowManager.waitUntilReadyToShow(windowOptions);
    await windowManager.show();
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
