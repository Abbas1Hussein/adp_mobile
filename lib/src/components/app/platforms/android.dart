import 'package:flutter/material.dart';

import '../../../core/common/construct/property.dart';

class AppAndroidProperty extends CoreAndroidProperty {
  const AppAndroidProperty({this.theme, this.darkTheme});

  final ThemeData? theme;
  final ThemeData? darkTheme;
}
