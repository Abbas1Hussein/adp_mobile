import 'package:flutter/widgets.dart';

class AdaptiveBottomNavigationBarItem extends BottomNavigationBarItem {
  AdaptiveBottomNavigationBarItem({
    super.activeIcon,
    super.backgroundColor,
    super.tooltip,
    required super.icon,
    required String super.label,
  });
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
