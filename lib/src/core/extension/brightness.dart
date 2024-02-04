import 'package:flutter/cupertino.dart';

extension ResolveEx on Brightness {
  Color resolve({
    required Color darkColor,
    required Color lightColor,
  }) {
    if (this == Brightness.dark) return darkColor;
    return lightColor;
  }
}
