import '../../../layout/bottom_navigation_bar/platforms/ios.dart';
import 'package:flutter/cupertino.dart';

class NavigationBarIOSProperty extends BottomNavigationBarIOSProperty {
  const NavigationBarIOSProperty({
    super.border,
    super.height,
    this.iconSize = 30.0,
  });

  /// The size of all of the [BottomNavigationBarItem] icons.
  ///
  /// This value is used to configure the [IconTheme] for the navigation bar.
  /// When a [BottomNavigationBarItem.icon] widget is not an [Icon] the widget
  /// should configure itself to match the icon theme's size and color.
  ///
  /// Must not be null.
  final double? iconSize;
}
