import 'package:flutter/cupertino.dart' hide Builder;
import 'package:flutter/material.dart' hide Builder;

import '../../core/common/construct/component.dart';
import '../../core/common/construct/component_mixin.dart';

/// The type of builder function for the Android platform.
typedef _AndroidBuilder = Widget Function(
    Widget platformChild, ThemeData theme);

/// The type of builder function for the iOS platform.
typedef _IOSBuilder = Widget Function(
    Widget platformChild, CupertinoThemeData theme);

/// The type of builder function for the Android and iOS platform without property argument.
typedef PlatformBuilder = CoreAdaptiveBuilder<_AndroidBuilder, _IOSBuilder>;

/// The type of builder function for the Android and iOS platform with property argument.
typedef PlatformBuilderExtended = CoreAdaptiveBuilder<
    Widget Function(Widget _, ThemeData __, CoreAndroidProperty? ___),
    Widget Function(Widget _, CupertinoThemeData __, CoreIOSProperty? ___)>;

/// A widget that renders its child consistently on both Android and iOS platforms, via builders.
///
/// Example usage:
///
/// ```dart
/// AdaptiveBuilderWidget(
///   builders: AdaptiveBuilder(
///     android: (Widget platformChild, ThemeData theme) {
///       return ColoredBox(color: theme.primaryColor, child: platformChild);
///     },
///     ios: (Widget platformChild, CupertinoThemeData theme) {
///       return ColoredBox(color: theme.primaryColor, child: platformChild);
///     },
///   ),
///   child: const Padding(
///     padding: EdgeInsets.all(8.0),
///     child: Text('Adaptive Mobile Package'),
///   ),
/// ),
/// ```
///
/// See also:
///
/// * [AdaptiveWidget], A simpler version of adaptive widget without builders.
/// * [adaptiveValue], A method that get adaptive values based on platform.
class AdaptiveBuilderWidget extends CoreAdaptiveComponent {
  /// Creates an instance of AdaptiveBuilderWidget.
  ///
  /// Required argument:
  ///  * [child], The widget to be displayed on both Android and iOS platforms.
  ///
  /// Optional argument:
  ///  * [builders], A [CoreAdaptiveBuilder] containing platform-specific
  ///     builders for Android and iOS. If provided, these builders will be
  ///     used to potentially customize the widget's appearance on each platform.
  AdaptiveBuilderWidget(
      { super.key, PlatformBuilder? builders, required this.child })
      : super(builders: builders != null ? adaptiveBuilder(builders) : null);

  /// The child widget to be displayed on both platforms.
  final Widget child;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) =>
      child;

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) => child;

  /// The adaptiveBuilder method is converts a PlatformBuilder into a PlatformBuilderExtended,
  /// which is a builder that works for both Android and iOS platforms.
  static PlatformBuilderExtended adaptiveBuilder(PlatformBuilder builders) {
    return AdaptiveBuilder(
      iOS: (platformChild, theme, _) {
        return builders.iOS?.call(platformChild, theme) ?? platformChild;
      },
      android: (platformChild, theme, _) {
        return builders.android?.call(platformChild, theme) ?? platformChild;
      },
    );
  }
}
