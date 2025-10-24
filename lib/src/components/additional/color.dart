import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/common/adaptive.dart';

/// a collection of color for different platforms, iOS and Android, using cupertino UI and material UI libraries.
abstract final class AdpColors {
  const AdpColors._();

  static const Color black = Colors.black;

  static const Color white = Colors.white;

  static final Color green = _dynamic(
    cupertinoColor: CupertinoColors.systemGreen,
    materialColor: Colors.green,
  );

  static final Color red = _dynamic(
    cupertinoColor: CupertinoColors.systemRed,
    materialColor: Colors.red,
  );

  static final Color blue = _dynamic(
    cupertinoColor: CupertinoColors.systemBlue,
    materialColor: Colors.blue,
  );

  static final Color yellow = _dynamic(
    cupertinoColor: CupertinoColors.systemYellow,
    materialColor: Colors.yellow,
  );

  static final Color orange = _dynamic(
    cupertinoColor: CupertinoColors.systemOrange,
    materialColor: Colors.orange,
  );

  static final Color purple = _dynamic(
    cupertinoColor: CupertinoColors.systemPurple,
    materialColor: Colors.purple,
  );

  static final Color gray = _dynamic(
    cupertinoColor: CupertinoColors.systemGrey,
    materialColor: Colors.grey,
  );

  static final Color teal = _dynamic(
    cupertinoColor: CupertinoColors.systemTeal,
    materialColor: Colors.teal,
  );

  static final Color cyan = _dynamic(
    cupertinoColor: CupertinoColors.systemCyan,
    materialColor: Colors.cyan,
  );

  static final Color magenta = _dynamic(
    cupertinoColor: CupertinoColors.systemPink,
    materialColor: Colors.pink,
  );

  /// Returns the adaptive color for the current platform.
  ///
  /// * [materialColor]: The color to use on Android.
  /// * [cupertinoColor]: The color to use on iOS.
  static Color _dynamic({
    required Color materialColor,
    required Color cupertinoColor,
  }) {
    return adaptiveValue<Color>(
      iOS: () => cupertinoColor,
      android: () => materialColor,
    );
  }
}
