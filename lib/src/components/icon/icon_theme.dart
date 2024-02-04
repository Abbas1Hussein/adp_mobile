import 'package:flutter/material.dart';

import '../../core/common/adaptive.dart';
import '../../core/common/construct/component.dart';
import '../../core/common/construct/model.dart';
import 'platforms/ios.dart';

class AdaptiveIconTheme extends CoreAdaptiveComponent {
  /// Creates an adp icon theme that controls the color, opacity, and size of
  /// descendant widgets.
  ///
  /// Both [data] and [child] arguments must not be null.
  const AdaptiveIconTheme({
    super.key,
    required this.data,
    required this.child,
  });

  final Widget child;

  /// The color, opacity, and size to use for icons in this subtree.
  final AdaptiveIconThemeData data;

  /// The data from the closest instance of this class that encloses the given
  /// context, if any.
  ///
  /// If there is no ambient icon theme, defaults to [AdaptiveIconThemeData.fallback].
  /// The returned [AdaptiveIconThemeData] is concrete (all values are non-null).
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// AdaptiveIconThemeData theme = AdaptiveIconThemeData.of(context);
  /// ```
  static AdaptiveIconThemeData of(BuildContext context) {
    return adaptiveValue<AdaptiveIconThemeData>(
      ios: () =>
          AdaptiveIconThemeData._fromCupertino(CupertinoIconTheme.of(context)),
      android: () => AdaptiveIconThemeData._fromWindows(IconTheme.of(context)),
    );
  }

  /// Creates an icon theme that controls the color, opacity, and size of
  /// descendant widgets, and merges in the current icon theme, if any.
  ///
  /// The [data] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    required AdaptiveIconThemeData data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        return adaptiveValue(
          ios: () =>
              CupertinoIconTheme.merge(data: data.toIOS(context), child: child),
          android: () =>
              IconTheme.merge(data: data.toAndroid(context), child: child),
        );
      },
    );
  }

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return IconTheme(data: data.toAndroid(context), child: child);
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoIconTheme(data: data.toIOS(context), child: child);
  }
}

class AdaptiveIconThemeData
    extends CoreModel<IconThemeData, CupertinoIconThemeData> {
  const AdaptiveIconThemeData({this.color, this.size, this.opacity});

  final Color? color;
  final double? size;
  final double? opacity;

  @override
  CupertinoIconThemeData toIOS(BuildContext context) {
    return CupertinoIconThemeData(color: color, size: size, opacity: opacity);
  }

  @override
  IconThemeData toAndroid(BuildContext context) {
    return IconThemeData(size: size, color: color, opacity: opacity);
  }

  static AdaptiveIconThemeData _fromCupertino(CupertinoIconThemeData data) {
    return AdaptiveIconThemeData(
        size: data.size, color: data.color, opacity: data.opacity);
  }

  static AdaptiveIconThemeData _fromWindows(IconThemeData data) {
    return AdaptiveIconThemeData(
        size: data.size, color: data.color, opacity: data.opacity);
  }

  /// Creates an icon theme with some reasonable default values.
  ///
  /// on Cupertino: The [color] is blue, the [opacity] is 1.0, and the [size] is 24.0.
  /// on Windows: [color] is black, the [opacity] is 1.0. and the [size] is 24.0, [fill] is 0.0, [weight] is 400.0, [grade] is 0.0, opticalSize is 48.0.
  factory AdaptiveIconThemeData.fallback() {
    return adaptiveValue<AdaptiveIconThemeData>(
      ios: () => _fromCupertino(const CupertinoIconThemeData.fallback()),
      android: () => _fromWindows(const IconThemeData.fallback()),
    );
  }

  /// Creates a copy of this icon theme but with the given fields replaced with
  /// the new values.
  AdaptiveIconThemeData copyWith({
    Color? color,
    double? size,
    double? opacity,
  }) {
    return AdaptiveIconThemeData(
      size: size ?? this.size,
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
    );
  }

  /// Returns a new icon theme that matches this icon theme but with some values
  /// replaced by the non-null parameters of the given icon theme. If the given
  /// icon theme is null, simply returns this icon theme.
  AdaptiveIconThemeData merge(AdaptiveIconThemeData? other) {
    if (other == null) return this;
    return copyWith(
      size: other.size,
      color: other.color,
      opacity: other.opacity,
    );
  }
}

extension CupertinoIconThemeDataEx on CupertinoIconThemeData {
  IconThemeData toAndroidData() =>
      IconThemeData(color: color, size: size, opacity: opacity);
}

extension IconThemeDataEx on IconThemeData {
  CupertinoIconThemeData toIOSData() =>
      CupertinoIconThemeData(color: color, size: size, opacity: opacity);
}
