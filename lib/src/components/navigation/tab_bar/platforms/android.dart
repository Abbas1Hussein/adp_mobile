import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';
import '../tab.dart';
import 'controller.dart';

class TabBarAndroid extends StatelessWidget {
  const TabBarAndroid({
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

  final ValueChanged<int>? onChanged;
  final List<Widget> tabs;

  final Color? selectedTabColor;
  final Color? unselectedTabColor;

  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;

  final bool isExpended;
  final EdgeInsetsGeometry margin;

  final TabController? controller;
  final TabBarAndroidProperty? property;

  @override
  Widget build(BuildContext context) {
    final useSecondary =
        (property?.style ?? TabBarAndroidStyle.m3) == TabBarAndroidStyle.m3 &&
            Theme.of(context).useMaterial3;

    return SizedBox(
      width: isExpended ? double.infinity : null,
      child: IntrinsicWidth(
        child: ControllerTabBuilder(
          controller: controller,
          builder: (controller, index) {
            return useSecondary
                ? TabBar.secondary(
                    padding: margin,
                    onTap: onChanged,
                    controller: controller,
                    labelColor: selectedTabColor,
                    labelStyle: selectedLabelStyle,
                    unselectedLabelStyle: unselectedLabelStyle,
                    unselectedLabelColor: unselectedTabColor,
                    physics: property?.physics,
                    indicator: property?.indicator,
                    overlayColor: property?.overlayColor,
                    dividerColor: property?.dividerColor,
                    indicatorColor: property?.indicatorColor,
                    enableFeedback: property?.enableFeedback,
                    splashFactory: property?.splashFactory,
                    dragStartBehavior:
                        property?.dragStartBehavior ?? DragStartBehavior.start,
                    automaticIndicatorColorAdjustment:
                        property?.automaticIndicatorColorAdjustment ?? true,
                    indicatorSize: property?.indicatorSize,
                    indicatorPadding:
                        property?.indicatorPadding ?? EdgeInsets.zero,
                    splashBorderRadius: property?.splashBorderRadius,
                    indicatorWeight: property?.indicatorWeight ?? 2.0,
                    isScrollable: property?.isScrollable ?? false,
                    labelPadding: property?.labelPadding,
                    tabAlignment: property?.tabAlignment,
                    tabs: _buildTabs(context, index),
                  )
                : TabBar(
                    padding: margin,
                    onTap: onChanged,
                    controller: controller,
                    labelColor: selectedTabColor,
                    labelStyle: selectedLabelStyle,
                    unselectedLabelStyle: unselectedLabelStyle,
                    unselectedLabelColor: unselectedTabColor,
                    physics: property?.physics,
                    indicator: property?.indicator,
                    overlayColor: property?.overlayColor,
                    dividerColor: property?.dividerColor,
                    indicatorColor: property?.indicatorColor,
                    enableFeedback: property?.enableFeedback,
                    splashFactory: property?.splashFactory,
                    dragStartBehavior:
                        property?.dragStartBehavior ?? DragStartBehavior.start,
                    automaticIndicatorColorAdjustment:
                        property?.automaticIndicatorColorAdjustment ?? true,
                    indicatorSize: property?.indicatorSize,
                    indicatorPadding:
                        property?.indicatorPadding ?? EdgeInsets.zero,
                    splashBorderRadius: property?.splashBorderRadius,
                    indicatorWeight: property?.indicatorWeight ?? 2.0,
                    isScrollable: property?.isScrollable ?? false,
                    labelPadding: property?.labelPadding,
                    tabAlignment: property?.tabAlignment,
                    tabs: _buildTabs(context, index),
                  );
          },
        ),
      ),
    );
  }

  List<Widget> _buildTabs(BuildContext context, int currentIndex) {
    return tabs.map((tab) {
      if (tab is AdaptiveTab) {
        final isSelected = currentIndex == tabs.indexOf(tab);
        return tab.android(
          context,
          null,
          isSelected,
          property?.direction,
          selectedLabelStyle,
          unselectedLabelStyle,
          selectedIconTheme,
          unselectedIconTheme,
        );
      }
      return tab;
    }).toList();
  }
}

class TabBarAndroidProperty extends CoreAndroidProperty {
  const TabBarAndroidProperty({
    this.isScrollable,
    this.direction,
    this.indicatorColor,
    this.indicatorWeight,
    this.indicatorPadding,
    this.indicator,
    this.automaticIndicatorColorAdjustment,
    this.indicatorSize,
    this.dividerColor,
    this.labelPadding,
    this.overlayColor,
    this.dragStartBehavior,
    this.enableFeedback,
    this.physics,
    this.splashFactory,
    this.splashBorderRadius,
    this.tabAlignment,
    this.style = TabBarAndroidStyle.m3,
  });

  /// Whether this tab bar can be scrolled horizontally.
  ///
  /// If [isScrollable] is true, then each tab is as wide as needed for its label
  /// and the entire [TabBar] is scrollable. Otherwise each tab gets an equal
  /// share of the available space.
  final bool? isScrollable;

  /// The color of the line that appears below the selected tab.
  ///
  /// If this parameter is null, then the value of the Theme's indicatorColor
  /// property is used.
  ///
  /// If [indicator] is specified or provided from [TabBarTheme],
  /// this property is ignored.
  final Color? indicatorColor;

  /// The thickness of the line that appears below the selected tab.
  ///
  /// The value of this parameter must be greater than zero.
  ///
  /// If [ThemeData.useMaterial3] is true and [TabBar] is used to create a
  /// primary tab bar, the default value is 3.0. If the provided value is less
  /// than 3.0, the default value is used.
  ///
  /// If [ThemeData.useMaterial3] is true and [TabBar.secondary] is used to
  /// create a secondary tab bar, the default value is 2.0.
  ///
  /// If [ThemeData.useMaterial3] is false, the default value is 2.0.
  ///
  /// If [indicator] is specified or provided from [TabBarTheme],
  /// this property is ignored.
  final double? indicatorWeight;

  /// The padding for the indicator.
  ///
  /// The default value of this property is [EdgeInsets.zero].
  ///
  /// For [isScrollable] tab bars, specifying [kTabLabelPadding] will align
  /// the indicator with the tab's text for [Tab] widgets and all but the
  /// shortest [Tab.text] values.
  final EdgeInsetsGeometry? indicatorPadding;

  /// Defines the appearance of the selected tab indicator.
  ///
  /// If [indicator] is specified or provided from [TabBarTheme],
  /// the [indicatorColor] and [indicatorWeight] properties are ignored.
  ///
  /// The default, underline-style, selected tab indicator can be defined with
  /// [UnderlineTabIndicator].
  ///
  /// The indicator's size is based on the tab's bounds. If [indicatorSize]
  /// is [TabBarIndicatorSize.tab] the tab's bounds are as wide as the space
  /// occupied by the tab in the tab bar. If [indicatorSize] is
  /// [TabBarIndicatorSize.label], then the tab's bounds are only as wide as
  /// the tab widget itself.
  ///
  /// See also:
  ///
  ///  * [splashBorderRadius], which defines the clipping radius of the splash
  ///    and is generally used with [BoxDecoration.borderRadius].
  final Decoration? indicator;

  /// Whether this tab bar should automatically adjust the [indicatorColor].
  ///
  /// The default value of this property is true.
  ///
  /// If [automaticIndicatorColorAdjustment] is true,
  /// then the [indicatorColor] will be automatically adjusted to [Colors.white]
  /// when the [indicatorColor] is same as [Material.color] of the [Material]
  /// parent widget.
  final bool? automaticIndicatorColorAdjustment;

  /// Defines how the selected tab indicator's size is computed.
  ///
  /// The size of the selected tab indicator is defined relative to the
  /// tab's overall bounds if [indicatorSize] is [TabBarIndicatorSize.tab]
  /// (the default) or relative to the bounds of the tab's widget if
  /// [indicatorSize] is [TabBarIndicatorSize.label].
  ///
  /// The selected tab's location appearance can be refined further with
  /// the [indicatorColor], [indicatorWeight], [indicatorPadding], and
  /// [indicator] properties.
  final TabBarIndicatorSize? indicatorSize;

  /// The color of the divider.
  ///
  /// If null and [ThemeData.useMaterial3] is true, [TabBarTheme.dividerColor]
  /// color is used. If that is null and [ThemeData.useMaterial3] is true,
  /// [ColorScheme.surfaceContainerHighest] will be used, otherwise divider will not be drawn.
  final Color? dividerColor;

  /// The padding added to each of the tab labels.
  ///
  /// If there are few tabs with both icon and text and few
  /// tabs with only icon or text, this padding is vertically
  /// adjusted to provide uniform padding to all tabs.
  ///
  /// If this property is null, then kTabLabelPadding is used.
  final EdgeInsetsGeometry? labelPadding;

  /// Defines the ink response focus, hover, and splash colors.
  ///
  /// If non-null, it is resolved against one of [WidgetState.focused],
  /// [WidgetState.hovered], and [WidgetState.pressed].
  ///
  /// [WidgetState.pressed] triggers a ripple (an ink splash), per
  /// the current Material Design spec.
  ///
  /// If the overlay color is null or resolves to null, then the default values
  /// for [InkResponse.focusColor], [InkResponse.hoverColor], [InkResponse.splashColor],
  /// and [InkResponse.highlightColor] will be used instead.
  final WidgetStateProperty<Color?>? overlayColor;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior? dragStartBehavior;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a long-press
  /// will produce a short vibration, when feedback is enabled.
  ///
  /// Defaults to true.
  final bool? enableFeedback;

  /// How the [TabBar]'s and [page] scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to animate after the
  /// user stops dragging the scroll view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// Creates the tab bar's [InkWell] splash factory, which defines
  /// the appearance of "ink" splashes that occur in response to taps.
  ///
  /// Use [NoSplash.splashFactory] to defeat ink splash rendering. For example
  /// to defeat both the splash and the hover/pressed overlay, but not the
  /// keyboard focused overlay:
  ///
  /// ```dart
  /// TabBar(
  ///   splashFactory: NoSplash.splashFactory,
  ///   overlayColor: MaterialStateProperty.resolveWith<Color?>(
  ///     (Set<MaterialState> states) {
  ///       return states.contains(MaterialState.focused) ? null : Colors.transparent;
  ///     },
  ///   ),
  ///   tabs: const <Widget>[
  ///     // ...
  ///   ],
  /// )
  /// ```
  final InteractiveInkFeatureFactory? splashFactory;

  /// Defines the clipping radius of splashes that extend outside the bounds of the tab.
  ///
  /// This can be useful to match the [BoxDecoration.borderRadius] provided as [indicator].
  ///
  /// ```dart
  /// TabBar(
  ///   indicator: BoxDecoration(
  ///     borderRadius: BorderRadius.circular(40),
  ///   ),
  ///   splashBorderRadius: BorderRadius.circular(40),
  ///   tabs: const <Widget>[
  ///     // ...
  ///   ],
  /// )
  /// ```
  ///
  /// If this property is null, it is interpreted as [BorderRadius.zero].
  final BorderRadius? splashBorderRadius;

  /// Specifies the horizontal alignment of the tabs within a [TabBar].
  ///
  /// If [TabBar.isScrollable] is false, only [TabAlignment.fill] and
  /// [TabAlignment.center] are supported. Otherwise an exception is thrown.
  ///
  /// If [TabBar.isScrollable] is true, only [TabAlignment.start], [TabAlignment.startOffset],
  /// and [TabAlignment.center] are supported. Otherwise an exception is thrown.
  ///
  /// If this is null, then the value of [TabBarTheme.tabAlignment] is used.
  ///
  /// If [TabBarTheme.tabAlignment] is null and [ThemeData.useMaterial3] is true,
  /// then [TabAlignment.startOffset] is used if [isScrollable] is true,
  /// otherwise [TabAlignment.fill] is used.
  ///
  /// If [TabBarTheme.tabAlignment] is null and [ThemeData.useMaterial3] is false,
  /// then [TabAlignment.center] is used if [isScrollable] is true,
  /// otherwise [TabAlignment.fill] is used.
  final TabAlignment? tabAlignment;

  /// defines the direction of tabs in a tab bar.
  ///
  /// [Axis.vertical] represents icon displayed above the label.
  /// [Axis.horizontal] represents icon displayed in a horizontal line with the label.
  ///
  /// use this specify the desired tab layout direction for your tabs.
  /// default to [Axis.vertical],
  final Axis? direction;

  /// The style of the TabBar to use.
  ///
  /// This property determines whether to render a Material 2 or Material 3 style tab bar.
  /// It is used in conjunction with `ThemeData.useMaterial3` to achieve the desired style.
  ///
  /// By default, the style is set to `TabBarAndroidStyle.m3`.
  final TabBarAndroidStyle style;
}

/// Defines the style of the TabBar.
///
/// This enum is used to conditionally render either a Material 2 or Material 3 style tab bar
/// based on the `ThemeData.useMaterial3` property and the `style` property of `TabBarAndroidProperty`.
enum TabBarAndroidStyle {
  /// a Material 2 style tab bar.
  m2,

  /// a Material 3 style tab bar.
  m3,
}
