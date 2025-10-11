import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../core/common/construct/component.dart';

/// A widget that adapts its rendering based on the target platform (Android or iOS).
///
/// This widget allows you to define separate widget builders for each platform.
/// It's a simplified version of CoreAdaptiveComponent, suitable for scenarios
/// where no platform-specific adjustments are required.
class AdaptiveWidget extends CoreAdaptiveComponent {
  /// Creates an instance of AdaptiveWidget.
  const AdaptiveWidget({
    super.key,
    this.onWeb,
    required this.onAndroid,
    required this.oniOS,
  });

  /// The widget builder function for Android.
  ///
  /// Returns the widget to be displayed on Android devices.
  final WidgetBuilder onAndroid;

  /// The widget builder function for iOS.
  ///
  /// Returns the widget to be displayed on iOS devices.
  final WidgetBuilder oniOS;

  /// The widget builder function for the web platform.
  ///
  /// This function defines the widget structure to be displayed
  /// when the application runs on a web browser.
  ///
  /// If omitted, the widget will automatically fall back to either the Android or iOS
  /// builder, depending on the platform determined by [DefaultsPlatformManager.targetPlatform].
  final WidgetBuilder? onWeb;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && onWeb != null) return onWeb!(context);
    return super.build(context);
  }

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) => onAndroid(context);

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) => oniOS(context);
}
