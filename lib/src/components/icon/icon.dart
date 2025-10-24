import 'package:adp_mobile/src/core/core.dart';
import 'package:flutter/cupertino.dart';

import 'icons.dart';

/// An adaptive icon widget that provides platform-specific styling and behavior.
class AdaptiveIcon extends Icon {
  /// Creates an adp icon.
  ///
  /// The [size] and [color] default to the value given by the current platform Theme.
  const AdaptiveIcon(
    AdpIcons this.adaptiveIcons, {
    super.key,
    super.size,
    super.color,
    super.shadows,
    super.weight,
    super.fill,
    super.grade,
    super.opticalSize,
    super.semanticLabel,
    super.textDirection,
  })  : iICON = null,
        aICON = null,
        super(null);

  /// Creates a new adaptive icon with specific icons for each platform.
  ///
  /// - On Android: [aICON] icon is used.
  /// - On IOS: [iICON]  icon is used.
  const AdaptiveIcon.from({
    super.key,
    super.size,
    super.color,
    super.shadows,
    super.weight,
    super.fill,
    super.grade,
    super.opticalSize,
    super.semanticLabel,
    super.textDirection,
    required IconData this.aICON,
    required IconData this.iICON,
  })  : adaptiveIcons = null,
        super(null);

  /// Creates a new adaptive icon with one icons for all platforms.
  const AdaptiveIcon.all(
    IconData iconData, {
    super.key,
    super.size,
    super.color,
    super.shadows,
    super.weight,
    super.fill,
    super.grade,
    super.opticalSize,
    super.semanticLabel,
    super.textDirection,
  })  : aICON = iconData,
        iICON = iconData,
        adaptiveIcons = null,
        super(null);

  /// The icon to display, used for different platforms.
  ///
  /// The available icons are described in [CupertinoIcons] snd [MaterialIcons].
  ///
  /// The icon cannot be null.
  final AdpIcons? adaptiveIcons;

  /// The material UI icon data to be displayed on Android [materialIcons].
  ///
  /// used on [AdaptiveIcon.from].
  final IconData? aICON;

  /// The Cupertino icon data to be displayed on IOS [CupertinoIcons].
  ///
  /// used on [AdaptiveIcon.from].
  final IconData? iICON;

  @override
  Widget build(BuildContext context) {
    final icon = adaptiveValue<IconData?>(
      iOS: () => iICON ?? adaptiveIcons?.iICON,
      android: () => aICON ?? adaptiveIcons?.aICON,
    );

    return Icon(
      icon,
      fill: fill,
      size: size,
      color: color,
      grade: grade,
      weight: weight,
      shadows: shadows,
      opticalSize: opticalSize,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
