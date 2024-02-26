import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/common/adaptive.dart';

/// adaptive brightness for different platforms.
abstract final class AdaptiveBrightness {
  const AdaptiveBrightness._();

  static Brightness of(BuildContext context) {
    return adaptiveValue(
      ios: () => CupertinoTheme.brightnessOf(context),
      android: () => Theme.of(context).brightness,
    );
  }
}

extension AdaptiveBrightnessEx on Brightness {
  /// whether the brightness is dark.
  bool get isDark => this == Brightness.dark;

  /// checks whether the brightness is light.
  bool get isLight => !isDark;
}

extension ContextEx on BuildContext {
  /// adaptive brightness using the AdaptiveBrightness class.
  Brightness get brightness => AdaptiveBrightness.of(this);
}
