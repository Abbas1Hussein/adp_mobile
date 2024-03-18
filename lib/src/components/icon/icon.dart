import 'package:flutter/cupertino.dart';

import '../../core/common/construct/component.dart';
import 'icons.dart';

/// An adaptive icon widget that provides platform-specific styling and behavior.
class AdaptiveIcon extends CoreAdaptiveComponent {
  /// Creates an adp icon.
  ///
  /// The [size] and [color] default to the value given by the current platform Theme.
  const AdaptiveIcon(
    AdpIcons this.adaptiveIcons, {
    super.key,
    super.builders,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
  })  : cupertino = null,
        material = null;

  /// Creates a new adaptive icon with specific icons for each platform.
  ///
  /// - On Android: [material] icon is used.
  /// - On IOS: [cupertino]  icon is used.
  const AdaptiveIcon.from({
    super.key,
    super.builders,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    required IconData this.material,
    required IconData this.cupertino,
  }) : adaptiveIcons = null;

  /// Creates a new adaptive icon with one icons for all platforms.
  const AdaptiveIcon.all(
    IconData iconData, {
    super.key,
    super.builders,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
  })  : material = iconData,
        cupertino = iconData,
        adaptiveIcons = null;

  /// The color to use when drawing the icon.
  final Color? color;

  /// The size of the icon in logical pixels. icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the current platform theme size.
  final double? size;

  /// The icon to display, used for different platforms.
  /// The available icons are described in [CupertinoIcons] snd [MaterialIcons].
  ///
  /// The icon cannot be null.
  final AdpIcons? adaptiveIcons;

  /// The material UI icon data to be displayed on Android [materialIcons].
  ///
  /// used on [AdaptiveIcon.from].
  final IconData? material;

  /// The Cupertino icon data to be displayed on IOS [CupertinoIcons].
  ///
  /// used on [AdaptiveIcon.from].
  final IconData? cupertino;

  /// A semantic label providing accessibility information
  /// for the icon.
  final String? semanticLabel;

  /// The text direction to use for rendering the icon.
  final TextDirection? textDirection;

  @override
  Icon android(BuildContext context, [CoreAndroidProperty? property]) {
    final icon = material ?? adaptiveIcons?.material;
    return Icon(
      icon,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }

  @override
  Icon iOS(BuildContext context, [CoreIOSProperty? property]) {
    final icon = cupertino ?? adaptiveIcons?.cupertino;
    final iconStyle = const CupertinoIconThemeData().resolve(context);
    return Icon(
      icon,
      key: key,
      fill: iconStyle.fill,
      grade: iconStyle.grade,
      weight: iconStyle.weight,
      shadows: iconStyle.shadows,
      size: size ?? iconStyle.size,
      color: color ?? iconStyle.color,
      opticalSize: iconStyle.opticalSize,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
