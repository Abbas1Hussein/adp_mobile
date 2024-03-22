import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/model.dart';
import '../../../core/common/construct/properties.dart';
import '../../layout/bottom_navigation_bar/bottom_navigation_bar_item.dart';
import '../../layout/bottom_navigation_bar/platforms/ios.dart';
import '../navigation.dart';

/// A custom navigation bar view widget that adapts its appearance based on the platform.
///
/// See also:
///
///  * [AdaptiveNavigationView] rendering this component.
///
/// On iOS, the [BottomNavigationBar] and [NavigationRail] used.
/// On Android, the [CupertinoTabBar] used.
class AdaptiveNavigationBar
    extends CoreModel<(BottomNavigationBar, Widget), CupertinoTabBar> {
  /// Creates a adp nav bar
  ///
  /// [items] must have at least 2 items
  ///
  /// [currentIndex] must be in the range of 0 to [items.length]
  const AdaptiveNavigationBar({
    super.key,
    this.onChanged,
    this.currentIndex = 0,
    this.backgroundColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.unselectedItemColor,
    this.selectedItemColor,
    this.properties,
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

  /// Properties for configuring the appearance and behavior of the navigation sidebar.
  ///
  /// The `properties` parameter allows you to customize the visual and functional aspects
  /// of the navigation sidebar separately for Windows and macOS platforms.
  /// You can provide specific properties for each platform using `NavigationSidebarWindowsProperty`
  /// and `NavigationSidebarMacosProperty` respectively.
  final CoreProperties<NavigationBarAndroidProperty, NavigationBarIOSProperty>?
      properties;

  /// The background color of the navigation view.
  ///
  /// The `backgroundColor` parameter allows you to specify the background color of the entire
  /// navigation view. If `null`, the default background color of the underlying platform is used.
  final Color? backgroundColor;

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

  @override
  (BottomNavigationBar, Widget) toAndroid(BuildContext context) {
    final property = properties?.android;
    final navigationRail = NavigationRail(
      key: key,
      leading: property?.leading,
      trailing: property?.trailing,
      minWidth: property?.minWidth,
      elevation: property?.elevation,
      useIndicator: property?.useIndicator,
      extended: property?.extended ?? false,
      groupAlignment: property?.groupAlignment,
      indicatorShape: property?.indicatorShape,
      minExtendedWidth: property?.minExtendedWidth,
      selectedLabelTextStyle: property?.selectedLabelStyle,
      unselectedLabelTextStyle: property?.unselectedLabelStyle,
      labelType: property?.labelType ?? NavigationRailLabelType.all,
      selectedIndex: currentIndex,
      onDestinationSelected: onChanged,
      backgroundColor: backgroundColor,
      indicatorColor: selectedItemColor,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
      destinations: items.map((e) => e.toNavigationRailDestination()).toList(),
    );

    final bottomNavigationBar = BottomNavigationBar(
      items: items,
      onTap: onChanged,
      type: property?.type,
      currentIndex: currentIndex,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
      backgroundColor: backgroundColor,
      elevation: property?.elevation,
      mouseCursor: property?.mouseCursor,
      enableFeedback: property?.enableFeedback,
      landscapeLayout: property?.landscapeLayout,
      selectedFontSize: property?.selectedFontSize ?? 14.0,
      unselectedFontSize: property?.unselectedFontSize ?? 12.0,
      showSelectedLabels: property?.showSelectedLabels,
      showUnselectedLabels: property?.showUnselectedLabels,
      selectedLabelStyle: property?.selectedLabelStyle,
      unselectedLabelStyle: property?.unselectedLabelStyle,
      useLegacyColorScheme: property?.useLegacyColorScheme ?? true,
    );
    return (bottomNavigationBar, navigationRail);
  }

  @override
  CupertinoTabBar toIOS(BuildContext context) {
    final property = properties?.ios;

    return CupertinoTabBar(
      key: key,
      height: property?.height ?? kTabBarHeight,
      border: property?.border ?? kDefaultTabBarBorder,
      iconSize: property?.iconSize ?? 30.0,
      onTap: onChanged,
      currentIndex: currentIndex,
      activeColor: selectedItemColor,
      inactiveColor: unselectedItemColor ?? CupertinoColors.inactiveGray,
      backgroundColor: backgroundColor,
      items: items.map((item) {
        final isSelected = currentIndex == items.indexOf(item);

        return item.fromIconTheme(
          isSelected ? selectedIconTheme : unselectedIconTheme,
        );
      }).toList(),
    );
  }
}
