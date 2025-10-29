import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import 'bottom_navigation_bar_item.dart';
import 'platforms/platforms.dart';

class AdaptiveBottomNavigationBar extends CoreAdaptiveComponent<
    BottomNavigationBarAndroidProperty, BottomNavigationBarIOSProperty> {
  const AdaptiveBottomNavigationBar({
    super.key,
    super.builders,
    super.properties,
    this.iconSize,
    this.currentIndex = 0,
    this.backgroundColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.onChanged,
    required this.items,
  });

  /// The index into [items] of the current active item.
  ///
  /// Must be between 0 and the number of tabs minus 1, inclusive.
  final int currentIndex;

  /// The callback that is called when a item is tapped.
  ///
  /// The widget creating the bottom navigation bar needs to keep track of the
  /// current index and call `setState` to rebuild it with the newly provided
  /// index.
  final ValueChanged<int>? onChanged;

  /// The interactive items laid out within the bottom navigation bar.
  final List<AdaptiveBottomNavigationBarItem> items;

  /// The size of all of the [BottomNavigationBarItem] icons.
  ///
  /// This value is used to configure the [IconTheme] for the navigation bar.
  /// When a [BottomNavigationBarItem.icon] widget is not an [Icon] the widget
  /// should configure itself to match the icon theme's size and color.
  final double? iconSize;

  /// The background color of the tab bar. If it contains transparency, the
  /// tab bar will automatically produce a blurring effect to the content
  /// behind it.
  ///
  /// Defaults to [CupertinoTheme]'s `barBackgroundColor` when null.
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
  Widget android(
    BuildContext context, [
    BottomNavigationBarAndroidProperty? property,
  ]) {
    if (property?.useMaterial3 ?? Theme.of(context).useMaterial3) {
      return NavigationBar(
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
        indicatorShape: property?.bar3property?.indicatorShape,
        surfaceTintColor: property?.bar3property?.surfaceTintColor,
        animationDuration: property?.bar3property?.animationDuration,
        destinations: items.map((e) => e.toNavigationDestination()).toList(),
      );
    }
    final showLabelVisibility = (property?.labelBehavior ??
            NavigationDestinationLabelBehavior.alwaysShow)
        .showLabelVisibility;
    return BottomNavigationBar(
      key: key,
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
      iconSize: iconSize ?? 24.0,
      currentIndex: currentIndex,
      backgroundColor: backgroundColor,
      selectedItemColor: selectedItemColor,
      selectedIconTheme: selectedIconTheme,
      unselectedItemColor: unselectedItemColor,
      unselectedIconTheme: unselectedIconTheme,
      showSelectedLabels: showLabelVisibility.$1,
      showUnselectedLabels: showLabelVisibility.$2,
      onTap: onChanged,
      items: items,
    );
  }

  @override
  Widget iOS(
    BuildContext context, [
    BottomNavigationBarIOSProperty? property,
  ]) {
    return CupertinoTabBar(
      key: key,
      // Specific Properties
      border: property?.border ?? kDefaultTabBarBorder,
      height: property?.height ?? kTabBarHeight,
      // Adaptive Properties
      onTap: onChanged,
      iconSize: iconSize ?? 30.0,
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
