import 'package:flutter/material.dart';

class AdaptiveNavigationBarItem extends BottomNavigationBarItem {
  AdaptiveNavigationBarItem({
    super.activeIcon,
    super.backgroundColor,
    super.tooltip,
    required super.icon,
    required String super.label,
  });

  NavigationRailDestination toNavigationRailDestination() {
    return NavigationRailDestination(
      icon: icon,
      indicatorColor: backgroundColor,
      label: Text(label ?? '* - *'),
      selectedIcon: activeIcon,
    );
  }
}
