import 'package:flutter/material.dart';

class AdaptiveBottomNavigationBarItem extends BottomNavigationBarItem {
  const AdaptiveBottomNavigationBarItem({
    super.activeIcon,
    super.backgroundColor,
    super.tooltip,
    required super.icon,
    required String super.label,
  });

  NavigationDestination toNavigationDestination() {
    return NavigationDestination(
      icon: icon,
      tooltip: tooltip,
      selectedIcon: activeIcon,
      label: label ?? '* - *',
    );
  }
}

extension IconThemeEx on BottomNavigationBarItem {
  AdaptiveBottomNavigationBarItem fromIconTheme(
    IconThemeData? activeIconTheme,
  ) {
    final buildIconTheme = activeIconTheme != null
        ? IconTheme.merge(data: activeIconTheme, child: icon)
        : icon;

    final buildActiveIconTheme = activeIconTheme != null
        ? IconTheme.merge(data: activeIconTheme, child: activeIcon)
        : activeIcon;

    return AdaptiveBottomNavigationBarItem(
      icon: buildIconTheme,
      label: label!,
      tooltip: tooltip,
      activeIcon: buildActiveIconTheme,
      backgroundColor: backgroundColor,
    );
  }
}
