import 'package:adp_mobile/adp_mobile.dart';

/// Initializes default settings for mobile tests.
///
/// If testing a single file, must provide the [platform] parameter to specify
/// the target platform.
///
/// If testing multiple files, the target platform is
/// determined from the 'platform' environment variable using [getTargetPlatformFromEnvironment].
void initializeMobileDefaultsTests([MobileTargetPlatform? platform]) {
  final targetPlatform = getTargetPlatformFromEnvironment(platform);

  DefaultsPlatformManager.initialize(
    targetPlatform: targetPlatform,
    isDebugging: true,
  );
}

/// Determines the target desktop platform based on the 'platform' environment variable.
///
/// If the environment variable is set to 'iOS', returns [MobileTargetPlatform.iOS].
/// If it is set to 'android', returns [MobileTargetPlatform.android].
MobileTargetPlatform getTargetPlatformFromEnvironment(
    MobileTargetPlatform? platform) {
  const targetPlatform = String.fromEnvironment('platform');

  /// Throws an [UnimplementedError] if running a single test and the 'platform' parameter
  /// on [initializeMobileDefaultsTests] is not provided.
  if (targetPlatform.isEmpty) {
    if (platform != null) return platform;
    throw UnimplementedError(
      'Please specify the target platform using initializeMobileDefaultsTests when running a single test.',
    );
  }

  switch (targetPlatform) {
    case 'iOS':
      return MobileTargetPlatform.iOS;
    case 'android':
      return MobileTargetPlatform.android;
  }

  /// Throws a [UnimplementedError] if the 'platform' environment variable is not set to a valid value.
  throw UnimplementedError(
    'Please run the tests with the appropriate platform specified.\n'
    'Run: flutter test --dart-define=platform="iOS" or flutter test --dart-define=platform="android"',
  );
}

/// Wraps the provided [child] widget with an adaptive app configuration.
///
/// The adaptive app includes configurations for IOS and Android platforms.
Widget wrapApp({required Widget child}) {
  return AdpApp(home: child, themeMode: ThemeMode.dark);
}

/// Wraps the provided [child] widget with an adaptive scaffold configuration.
///
/// The adaptive scaffold includes configurations for IOS and Android platforms.
Widget wrapAppWithScaffold({required Widget child}) {
  return wrapApp(child: AdaptiveScaffoldPage(content: child));
}
