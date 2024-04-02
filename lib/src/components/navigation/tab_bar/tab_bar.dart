import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platforms/platforms.dart';

/// Apps often have different categories of content or features available to users. Naturally,
/// you want your users to be able to quickly glance at each option and move between categories with a simple swipe.
/// That’s where the Flutter TabBar class comes in.
///
/// Use this widget to create a tabBar with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoSlidingSegmentedControl] and [CupertinoSegmentedControl] is utilized.
/// - On Android, [TabBar] is used.
class AdaptiveTabBar
    extends CoreAdaptiveComponent<TabBarAndroidProperty, TabBarIOSProperty> {
  /// Creates an instance of [AdaptiveTabBar].
  ///
  /// The [AdaptiveTabBar] invokes the callback with the new selected value and
  /// automatically manages state updates until the parent widget rebuilds the
  /// tab bar with the updated value.
  ///
  /// You do not need to manually update the state; the [AdaptiveTabBar] handles
  /// state changes directly.
  ///
  /// The [properties] parameter allows you to customize the visual and functional aspects
  /// of the tab view separately for Windows and macOS platforms.
  /// You can provide specific [properties] for each platform using `TabBarAndroidProperty`
  /// and `TabBarIOSProperty` respectively.
  ///
  /// See also:
  ///
  ///  * [TabBarView], which displays page views that correspond to each tab.
  ///  * [TabController], which coordinates tab selection between a [TabBar] and a [TabBarView].
  const AdaptiveTabBar({
    super.key,
    super.properties,
    this.margin = const EdgeInsets.symmetric(horizontal: 6.0),
    this.isExpended = true,
    this.unselectedLabelStyle,
    this.selectedLabelStyle,
    this.unselectedIconTheme,
    this.selectedIconTheme,
    this.unselectedTabColor,
    this.selectedTabColor,
    this.onChanged,
    this.controller,
    required this.tabs,
  }) : assert(tabs.length >= 2);

  /// The controller that manages which tab is selected.
  ///
  /// If this is null, you should wrapper widget with a [DefaultTabController].
  ///
  /// If you want to control the tab selection manually, you can
  /// provide your own [TabController].
  final TabController? controller;

  /// Called when a tab is selected.
  ///
  /// The index parameter indicates which tab has been selected.
  /// This callback is invoked whenever the user taps on a tab to select it.
  final ValueChanged<int>? onChanged;

  /// List of [Widget] representing the tabs in the tab bar.
  ///
  /// - must have at least 2 items.
  ///
  /// Usually an [AdaptiveTab] widget.
  final List<Widget> tabs;

  /// The color of the tab when selected.
  ///
  /// The `selectedTabColor` parameter defines the background color of the tab's
  /// when it is selected. This color is applied to indicate the currently active.
  final Color? selectedTabColor;

  /// The color of the tab when unselected.
  ///
  /// The `unselectedTabColor` parameter allows you to specify the color of the tab's
  /// when it is not selected. It is the background color of the item representing an tab's in the [AdaptiveTabView].
  final Color? unselectedTabColor;

  /// The text style for the selected label.
  ///
  /// The `selectedLabelStyle` parameter defines the text style of the label or text associated with
  /// the currently selected tabs. It allows you to customize the appearance of the text
  /// when the tab is in a selected state.
  final TextStyle? selectedLabelStyle;

  /// The text style for the unselected label.
  ///
  /// The `unselectedLabelStyle` parameter specifies the text style for the label or text associated
  /// with unselected tabs. This style is applied to the text when the item is not in focus.
  final TextStyle? unselectedLabelStyle;

  /// The theme for the selected icon.
  ///
  /// The `selectedIconTheme` parameter allows you to customize the visual appearance of icons associated
  /// with the currently selected tabs. You can adjust properties such as the icon's color,
  /// size, and opacity when the tab is selected.
  final IconThemeData? selectedIconTheme;

  /// The theme for the unselected icon.
  ///
  /// Similar to `selectedIconTheme`, the `unselectedIconTheme` parameter lets you customize the visual
  /// appearance of icons for unselected tabs. You can control the color, size, and opacity
  /// when they are not in focus.
  final IconThemeData? unselectedIconTheme;

  /// Whether the tab-bar should expand to fill available width.
  ///
  /// Defaults to `true`.
  final bool isExpended;

  /// The margin around the tab bar.
  ///
  /// This specifies the empty space surrounding the tab bar widget.
  /// This margin can be customized using various EdgeInsetsGeometry classes
  /// such as EdgeInsets, EdgeInsets.symmetric, EdgeInsets.only, etc.
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 6.0)`.
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    validate(context);
    return super.build(context);
  }

  @override
  Widget android(BuildContext context, [TabBarAndroidProperty? property]) {
    return TabBarAndroid(
      tabs: tabs,
      margin: margin,
      property: property,
      controller: controller,
      onChanged: onChanged,
      isExpended: isExpended,
      selectedTabColor: selectedTabColor,
      unselectedTabColor: unselectedTabColor,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
    );
  }

  @override
  Widget iOS(BuildContext context, [TabBarIOSProperty? property]) {
    return TabBarIOS(
      tabs: tabs,
      margin: margin,
      property: property,
      onChanged: onChanged,
      controller: controller,
      isExpended: isExpended,
      selectedTabColor: selectedTabColor,
      unselectedTabColor: unselectedTabColor,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
    );
  }

  validate(BuildContext context) {
    final TabController? newController =
        controller ?? DefaultTabController.maybeOf(context);
    assert(() {
      if (newController == null) {
        throw FlutterError(
          'No TabController for $runtimeType.\n'
          'When creating a $runtimeType, you must either provide an explicit '
          'TabController using the "controller" property, or you must ensure that there '
          'is a DefaultTabController above the $runtimeType.\n'
          'In this case, there was neither an explicit controller nor a default controller.',
        );
      }
      return true;
    }());

    assert(newController!.index >= 0 && newController.index < tabs.length);
  }
}
