import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/model.dart';
import 'navigation_bar_item.dart';

/// A custom navigation bar view widget that adapts its appearance based on the platform.
///
/// See also:
///
///  * [AdaptiveNavigationView] rendering this component.
///
/// On iOS, the [BottomNavigationBar] and [NavigationRail] used.
/// On Android, the [CupertinoTabBar] used.
class AdaptiveNavigationBar
    extends CoreModel<(BottomNavigationBar, NavigationRail), CupertinoTabBar> {
  /// Creates a adp nav bar
  ///
  /// [items] must have at least 2 items
  ///
  /// [currentIndex] must be in the range of 0 to [items.length]
  const AdaptiveNavigationBar({
    this.onChanged,
    this.currentIndex = 0,
    this.backgroundColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.unselectedItemColor,
    this.selectedItemColor,
    this.items = const [],
  })  : assert(items.length >= 2),
        assert(currentIndex >= 0 && currentIndex < items.length);

  /// The current selected index. This must be in the range of 0 to [items.length].
  final int currentIndex;

  /// Called when the current selected index should be changed.
  ///
  /// The navigation sidebar passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the navigation sidebar with the new
  /// value.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// onChanged: (newValue) {
  ///   setState(() {
  ///     currentIndex = newValue;
  ///   });
  /// },
  /// ```
  final ValueChanged<int>? onChanged;

  /// The list of navigation bar items.
  ///
  /// The `items` parameter is a list of [AdaptiveNavigationBarItem] objects,
  /// each representing an individual item in the navigation sidebar. It is required
  /// to have at least two items.
  final List<AdaptiveNavigationBarItem> items;

  /// The color of the item when selected.
  ///
  /// The `selectedItemColor` parameter defines the background color of the navigation item's
  /// when it is selected. This color is applied to indicate the currently active.
  final Color? selectedItemColor;

  /// The color of the item when unselected.
  ///
  /// The `unselectedItemColor` parameter allows you to specify the color of the navigation item
  /// when it is not selected. It is the background color of the item representing an item's in the sidebar.
  final Color? unselectedItemColor;

  /// The text style for the selected label.
  ///
  /// The `selectedLabelStyle` parameter defines the text style of the label or text associated with
  /// the currently selected navigation item. It allows you to customize the appearance of the text
  /// when the item is in a selected state.
  final TextStyle? selectedLabelStyle;

  /// The text style for the unselected label.
  ///
  /// The `unselectedLabelStyle` parameter specifies the text style for the label or text associated
  /// with unselected navigation items. This style is applied to the text when the item is not in focus.
  final TextStyle? unselectedLabelStyle;

  /// The theme for the selected icon.
  ///
  /// The `selectedIconTheme` parameter allows you to customize the visual appearance of icons associated
  /// with the currently selected navigation item. You can adjust properties such as the icon's color,
  /// size, and opacity when the item is selected.
  final IconThemeData? selectedIconTheme;

  /// The theme for the unselected icon.
  ///
  /// Similar to `selectedIconTheme`, the `unselectedIconTheme` parameter lets you customize the visual
  /// appearance of icons for unselected navigation items. You can control the color, size, and opacity
  /// when they are not in focus.
  final IconThemeData? unselectedIconTheme;

  /// The background color of the navigation view.
  ///
  /// The `backgroundColor` parameter allows you to specify the background color of the entire
  /// navigation view. If `null`, the default background color of the underlying platform is used.
  final Color? backgroundColor;

  @override
  (BottomNavigationBar, NavigationRail) toAndroid(BuildContext context) {
    final navigationRail = NavigationRail(
      extended: false,
      selectedIndex: currentIndex,
      onDestinationSelected: onChanged,
      backgroundColor: backgroundColor,
      indicatorColor: selectedItemColor,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
      selectedLabelTextStyle: selectedLabelStyle,
      unselectedLabelTextStyle: unselectedLabelStyle,
      destinations: items.map((e) => e.toNavigationRailDestination()).toList(),
      labelType: NavigationRailLabelType.all,
    );
    final bottomNavigationBar = BottomNavigationBar(
      onTap: onChanged,
      currentIndex: currentIndex,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      backgroundColor: backgroundColor,
      items: items,
    );
    return (bottomNavigationBar, navigationRail);
  }

  @override
  CupertinoTabBar toIOS(BuildContext context) {
    return CupertinoTabBar(
      onTap: onChanged,
      currentIndex: currentIndex,
      activeColor: selectedItemColor,
      inactiveColor: unselectedItemColor ?? CupertinoColors.inactiveGray,
      backgroundColor: backgroundColor,
      items: items,
    );
  }
}
