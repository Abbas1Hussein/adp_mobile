import 'package:flutter/cupertino.dart';

extension FromTheme on IconThemeData {
  IconThemeData toCupertino(BuildContext context) {
    return CupertinoIconThemeData(
      size: size,
      fill: fill,
      color: color,
      grade: grade,
      weight: weight,
      shadows: shadows,
      opacity: opacity,
      opticalSize: opticalSize,
    ).resolve(context);
  }
}
