import 'package:flutter/material.dart';

import '../../core/common/construct/component.dart';
import 'icons.dart';
import 'platforms/ios.dart';

class AdaptiveIcon extends CoreAdaptiveComponent {
  /// Creates an adp icon.
  ///
  /// The [size] and [color] default to the value given by the current platform Theme.
  const AdaptiveIcon(
    this.adaptiveIcons, {
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
  })  : cupertino = iconData,
        material = iconData,
        adaptiveIcons = null;

  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the current platform theme size,
  /// if any defaults to 24.0.
  final double? size;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the current [AdaptiveIconTheme] color, if any.
  final Color? color;

  /// The icon to display, used for different platforms.
  /// The available icons are described in [CupertinoIcons], [materialIcons].
  ///
  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
  final AdpIcons? adaptiveIcons;

  /// The material UI icon data to be displayed on Android [materialIcons].
  ///
  /// used on [AdaptiveIcon.from].
  final IconData? material;

  /// The Cupertino icon data to be displayed on IOS [CupertinoIcons].
  ///
  /// used on [AdaptiveIcon.from].
  final IconData? cupertino;

  /// Semantic label for the icon.
  final String? semanticLabel;

  /// The text direction to use for rendering the icon.
  final TextDirection? textDirection;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
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
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    final icon = cupertino ?? adaptiveIcons?.cupertino;

    return CupertinoIcon(
      icon,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
