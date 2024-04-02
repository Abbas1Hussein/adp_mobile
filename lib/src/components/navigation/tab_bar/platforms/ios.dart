import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';
import '../tab.dart';
import 'controller.dart';

class TabBarIOS extends StatelessWidget {
  const TabBarIOS({
    super.key,
    this.property,
    this.controller,
    this.margin = const EdgeInsets.symmetric(horizontal: 6.0),
    this.isExpended = true,
    this.unselectedLabelStyle,
    this.selectedLabelStyle,
    this.unselectedIconTheme,
    this.selectedIconTheme,
    this.unselectedTabColor,
    this.selectedTabColor,
    this.onChanged,
    required this.tabs,
  });

  final List<Widget> tabs;
  final ValueChanged<int>? onChanged;

  final Color? selectedTabColor;
  final Color? unselectedTabColor;

  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;

  final bool isExpended;
  final EdgeInsetsGeometry margin;

  final TabController? controller;
  final TabBarIOSProperty? property;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpended ? double.infinity : null,
      child: ControllerTabBuilder(
        controller: controller,
        builder: (controller, index) {
          if (property?.style == TabBarIOSStyle.normal) {
            return CupertinoSegmentedControl<int>(
              padding: margin,
              selectedColor: selectedTabColor,
              unselectedColor: unselectedTabColor,
              borderColor: property?.backgroundColor,
              groupValue: index,
              children: _buildTabsAsMap(context, index),
              onValueChanged: (value) => _onValueChanged(controller, value),
            );
          }
          return Padding(
            padding: margin,
            child: CupertinoSlidingSegmentedControl<int>(
              groupValue: index,
              thumbColor: selectedTabColor ??
                  const CupertinoDynamicColor.withBrightness(
                    color: Color(0xFFFFFFFF),
                    darkColor: Color(0xFF636366),
                  ),
              backgroundColor: property?.backgroundColor ??
                  CupertinoColors.tertiarySystemFill,
              children: _buildTabsAsMap(context, index),
              onValueChanged: (value) => _onValueChanged(controller, value!),
            ),
          );
        },
      ),
    );
  }

  void _onValueChanged(TabController controller, int value) {
    assert(value >= 0);
    controller.animateTo(value, curve: Curves.bounceInOut);
    onChanged?.call(value);
  }

  Map<int, Widget> _buildTabsAsMap(BuildContext context, int index) {
    final tabsMapper = tabs.map(
      (tab) {
        if (tab is AdaptiveTab) {
          final isSelected = index == tabs.indexOf(tab);
          return tab.iOS(
            context,
            null,
            unselectedTabColor,
            isSelected,
            property?.direction,
            selectedLabelStyle,
            unselectedLabelStyle,
            selectedIconTheme,
            unselectedIconTheme,
            property?.alignment,
          );
        }
        return tab;
      },
    );
    return tabsMapper.toList().asMap();
  }
}

class TabBarIOSProperty extends CoreIOSProperty {
  const TabBarIOSProperty({
    this.direction,
    this.backgroundColor,
    this.isExpended = true,
    this.alignment = Alignment.center,
    this.style = TabBarIOSStyle.sliding,
  });

  /// Determines whether the sliding segmented control should expand to fill available width.
  ///
  /// Defaults to `true`.
  final bool isExpended;

  /// If [TabBarIOSStyle.normal] this will used as borderColor, if null [CupertinoTheme.primaryColor] will used.
  /// if [TabBarIOSStyle.sliding] The color used to paint the rounded rect behind the [children] and the separators.
  /// The default value is [CupertinoColors.tertiarySystemFill]. The background
  /// will not be painted if null is specified.
  final Color? backgroundColor;

  /// Alignment of tab labels within the sliding segmented control.
  ///
  /// Defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// defines the direction of tabs in a tab bar.
  ///
  /// [Axis.vertical] represents icon displayed above the label.
  /// [Axis.horizontal] represents icon displayed in a horizontal line with the label.
  ///
  /// use this specify the desired tab layout direction for your tabs.
  /// default to [Axis.horizontal],
  final Axis? direction;

  /// The style of the TabBar to use.
  ///
  /// This property determines whether to render a segmented control
  /// or segmented sliding control style tab bar.
  ///
  /// By default, the style is set to `TabBarIOSStyle.sliding`.
  final TabBarIOSStyle style;
}

/// Different types of segmented controls for iOS in a tab view.
enum TabBarIOSStyle {
  /// An iOS-style segmented control.
  sliding,

  /// a segmented control widget in the style used up until iOS 13.
  normal,
}
