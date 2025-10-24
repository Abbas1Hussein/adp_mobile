import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/adaptive.dart';
import '../../components.dart';

/// A specialized version of [AdaptiveTabBar] that implements the [PreferredSizeWidget] interface.
/// You can use it within an [AdaptiveAppBar] to position the tab bar at the bottom,
/// as shown in the example below:
///
/// Example usage:
/// ```dart
/// AdaptiveAppBar(
///   bottom: AdaptiveTabBarPreferred(tabs: tabs),
/// )
/// ```
class AdaptiveTabBarPreferred extends AdaptiveTabBar
    implements PreferredSizeWidget {
  /// Creates an instance of [AdaptiveTabBarPreferred].
  ///
  /// The [tabs] parameter must not be null.
  const AdaptiveTabBarPreferred({
    super.key,
    super.properties,
    super.controller,
    super.isExpended,
    super.onChanged,
    super.selectedIconTheme,
    super.selectedLabelStyle,
    super.selectedTabColor,
    super.unselectedIconTheme,
    super.unselectedLabelStyle,
    super.unselectedTabColor,
    this.toolbarHeight,
    required super.tabs,
  });

  /// The height of the toolbar. If null, it adapts based on the platform.
  final double? toolbarHeight;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: AdaptiveTypography.of(context).body,
      child: super.build(context),
    );
  }

  @override
  EdgeInsetsGeometry get margin {
    return adaptiveValue(
      android: () => EdgeInsets.zero,
      iOS: () => const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(
      toolbarHeight ??
          adaptiveValue<double>(
            android: () => kToolbarHeight,
            iOS: () => kMinInteractiveDimensionCupertino,
          ),
    );
  }
}
