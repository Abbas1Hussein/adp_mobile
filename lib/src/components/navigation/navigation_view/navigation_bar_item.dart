import 'package:flutter/material.dart';

class AdaptiveNavigationBarItem extends BottomNavigationBarItem {
  const AdaptiveNavigationBarItem({
    super.tooltip,
    super.activeIcon,
    super.backgroundColor,
    required super.icon,
    required super.label,
  });

  NavigationRailDestination toNavigationRailDestination() {
    return NavigationRailDestination(
      icon: icon,
      selectedIcon: activeIcon,
      label: Text(label ?? '* - *'),
      indicatorColor: backgroundColor,
    );
  }
}
