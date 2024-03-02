import 'package:flutter/cupertino.dart';

import '../../../../core/common/construct/property.dart';

class NavigationViewIOSProperty extends CoreIOSProperty {
  const NavigationViewIOSProperty({this.iconSize, this.height, this.border});

  /// The size of all of the [BottomNavigationBarItem] icons.
  ///
  /// This value is used to configure the [IconTheme] for the navigation bar.
  /// When a [BottomNavigationBarItem.icon] widget is not an [Icon] the widget
  /// should configure itself to match the icon theme's size and color.
  ///
  /// Must not be null.
  final double? iconSize;

  /// The height of the [CupertinoTabBar].
  ///
  /// Defaults to 50.0. Must not be null.
  final double? height;

  /// The border of the [CupertinoTabBar].
  ///
  /// The default value is a one physical pixel top border with grey color.
  final Border? border;
}
