import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/model.dart';
import '../../../core/common/construct/properties.dart';
import '../../layout/bottom_navigation_bar/bottom_navigation_bar_item.dart';
import '../../layout/bottom_navigation_bar/platforms/platforms.dart';
import '../navigation.dart';

/// A custom navigation bar view widget that adapts its appearance based on the platform.
///
/// See also:
///
///  * [AdaptiveNavigationView] rendering this component.
///
/// On Android, the (BottomNavigationBar), (NavigationBar), (NavigationRail), used.
/// On iOS, the [CupertinoTabBar] used.
class AdaptiveNavigationBar extends CoreModel<
    (BottomNavigationBar, NavigationBar, NavigationRail), CupertinoTabBar> {
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
  /// of the navigation sidebar separately for Android and IOS platforms.
  /// You can provide specific properties for each platform using `NavigationBarAndroidProperty`
  /// and `NavigationBarIOSProperty` respectively.
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
  (BottomNavigationBar, NavigationBar, NavigationRail) toAndroid(BuildContext context) {
    final property = properties?.android;

    final railProperty = property?.navigationRailProperty;
    final navigationRail = NavigationRail(
      key: key,
      selectedIndex: currentIndex,
      onDestinationSelected: onChanged,
      leading: railProperty?.leading,
      trailing: railProperty?.trailing,
      minWidth: railProperty?.minWidth,
      backgroundColor: backgroundColor,
      indicatorColor: selectedItemColor,
      elevation: railProperty?.elevation,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
      useIndicator: railProperty?.useIndicator,
      extended: railProperty?.extended ?? false,
      indicatorShape: railProperty?.indicatorShape,
      groupAlignment: railProperty?.groupAlignment,
      minExtendedWidth: railProperty?.minExtendedWidth,
      selectedLabelTextStyle: railProperty?.selectedLabelTextStyle,
      unselectedLabelTextStyle: railProperty?.unselectedLabelTextStyle,
      labelType:
          property?.labelBehavior?.railLabelType ?? NavigationRailLabelType.all,
      destinations: items.map((e) => e.toNavigationRailDestination()).toList(),
    );

    final navigationBar = NavigationBar(
      key: key,
      selectedIndex: currentIndex,
      onDestinationSelected: onChanged,
      backgroundColor: backgroundColor,
      indicatorColor: selectedItemColor,
      labelBehavior: property?.labelBehavior,
      height: property?.bar3property?.height,
      elevation: property?.bar3property?.elevation,
      shadowColor: property?.bar3property?.shadowColor,
      overlayColor: property?.bar3property?.overlayColor,
      surfaceTintColor: property?.bar3property?.surfaceTintColor,
      animationDuration: property?.bar3property?.animationDuration,
      indicatorShape: property?.bar3property?.indicatorShape,
      destinations: items.map((e) => e.toNavigationDestination()).toList(),
    );

    final showLabelVisibility = (property?.labelBehavior ??
            NavigationDestinationLabelBehavior.alwaysShow)
        .showLabelVisibility;
    final bottomNavigationBar = BottomNavigationBar(
      key: key,
      items: items,
      onTap: onChanged,
      currentIndex: currentIndex,
      backgroundColor: backgroundColor,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      showSelectedLabels: showLabelVisibility.$1,
      showUnselectedLabels: showLabelVisibility.$2,
      type: property?.bar2property?.type,
      elevation: property?.bar2property?.elevation,
      mouseCursor: property?.bar2property?.mouseCursor,
      enableFeedback: property?.bar2property?.enableFeedback,
      landscapeLayout: property?.bar2property?.landscapeLayout,
      selectedFontSize: property?.bar2property?.selectedFontSize ?? 14.0,
      unselectedFontSize: property?.bar2property?.unselectedFontSize ?? 12.0,
      selectedLabelStyle: property?.bar2property?.selectedLabelStyle,
      unselectedLabelStyle: property?.bar2property?.unselectedLabelStyle,
      useLegacyColorScheme:
          property?.bar2property?.useLegacyColorScheme ?? true,
    );

    return (bottomNavigationBar, navigationBar, navigationRail);
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
