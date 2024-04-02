import 'package:flutter/material.dart';

class AdaptiveNavigationBarItem extends BottomNavigationBarItem {
  const AdaptiveNavigationBarItem({
    super.tooltip,
    super.activeIcon,
    super.backgroundColor,
    required super.icon,
    required String super.label,
  });

  NavigationRailDestination toNavigationRailDestination() {
    return NavigationRailDestination(
      icon: icon,
      selectedIcon: activeIcon,
      label: Text(label ?? '* - *'),
      indicatorColor: backgroundColor,
    );
  }

  NavigationDestination toNavigationDestination() {
    return NavigationDestination(
      icon: icon,
      tooltip: tooltip,
      selectedIcon: activeIcon,
      label: label ?? '* - *',
    );
  }
}
