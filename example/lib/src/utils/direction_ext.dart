import 'package:flutter/widgets.dart';

extension OrientationExtension on Orientation {
  Axis getAxis(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Axis.vertical
        : Axis.horizontal;
  }
}
