import 'package:flutter/cupertino.dart';

import '../../../../core/common/construct/property.dart';

// Standard iOS 10 tab bar height.
const double kTabBarHeight = 50.0;

const Color kDefaultTabBarBorderColor = CupertinoDynamicColor.withBrightness(
  color: Color(0x4D000000),
  darkColor: Color(0x29000000),
);

const Border kDefaultTabBarBorder = Border(
  top: BorderSide(
    color: kDefaultTabBarBorderColor,
    width: 0.0,
  ),
);

class BottomNavigationBarIOSProperty extends CoreIOSProperty {
  const BottomNavigationBarIOSProperty({
    this.height = kTabBarHeight,
    this.border = kDefaultTabBarBorder,
  });

  /// The height of the [CupertinoTabBar].
  ///
  /// Defaults to 50.
  final double height;

  /// The border of the [CupertinoTabBar].
  ///
  /// The default value is [kDefaultTabBarBorder].
  final Border? border;
}
