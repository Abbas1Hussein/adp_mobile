import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';
import '../../../../core/extension/widget.dart';
import '../tab.dart';

class TabViewAndroid extends StatelessWidget {
  const TabViewAndroid({
    super.key,
    this.property,
    this.onChanged,
    this.primaryColor,
    this.secondaryColor,
    this.contentPadding,
    this.contentMargin,
    this.selectedTabColor,
    this.unselectedTabColor,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    required this.tabs,
    required this.children,
    required this.currentIndex,
  });

  final TabViewAndroidProperty? property;

  final int currentIndex;
  final ValueChanged<int>? onChanged;
  final List<AdaptiveTab> tabs;
  final List<Widget> children;

  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? contentMargin;

  final Color? primaryColor;
  final Color? secondaryColor;

  final Color? selectedTabColor;
  final Color? unselectedTabColor;

  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: currentIndex,
      animationDuration: property?.animationDuration,
      child: Material(
        color: primaryColor,
        child: Column(
          children: [
            TabBar(
              overlayColor: property?.overlayColor,
              dividerColor: property?.dividerColor,
              indicator: property?.indicator,
              indicatorColor: property?.indicatorColor,
              enableFeedback: property?.enableFeedback,
              dragStartBehavior:
                  property?.dragStartBehavior ?? DragStartBehavior.start,
              physics: property?.physics,
              splashFactory: property?.splashFactory,
              automaticIndicatorColorAdjustment:
                  property?.automaticIndicatorColorAdjustment ?? true,
              indicatorPadding: property?.indicatorPadding ?? EdgeInsets.zero,
              indicatorSize: property?.indicatorSize,
              indicatorWeight: property?.indicatorWeight ?? 2.0,
              isScrollable: property?.isScrollable ?? false,
              labelPadding: property?.labelPadding,
              splashBorderRadius: property?.splashBorderRadius,
              tabAlignment: property?.tabAlignment,
              labelColor: selectedTabColor,
              unselectedLabelColor: unselectedTabColor,
              labelStyle: selectedLabelStyle,
              unselectedLabelStyle: unselectedLabelStyle,
              padding: property?.padding,
              tabs: tabs.map((tab) {
                final isSelected = tabs.indexOf(tab) == currentIndex;

                final iconTheme = tab.icon != null
                    ? IconTheme.merge(
                        data: (isSelected
                                ? selectedIconTheme
                                : unselectedIconTheme) ??
                            IconTheme.of(context),
                        child: tab.icon!,
                      )
                    : null;

                if (property?.direction == TabDirection.up) {
                  return Tab(
                    iconMargin: EdgeInsets.zero,
                    icon: iconTheme,
                    child: tab.label,
                  );
                }
                return Tab(child: tab.label.margeWith(iconTheme, 8.0));
              }).toList(),
              onTap: onChanged,
            ),
            Expanded(
              child: TabBarView(
                physics: property?.physics,
                dragStartBehavior:
                    property?.dragStartBehavior ?? DragStartBehavior.start,
                children: children.map((child) {
                  return Padding(
                    padding: contentMargin ?? EdgeInsets.zero,
                    child: ColoredBox(
                      color: secondaryColor ?? Colors.transparent,
                      child: Padding(
                        padding: contentPadding ?? EdgeInsets.zero,
                        child: child,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabViewAndroidProperty extends CoreAndroidProperty {
  const TabViewAndroidProperty({
    this.isScrollable,
    this.padding,
    this.direction,
    this.indicatorColor,
    this.indicatorWeight,
    this.indicatorPadding,
    this.indicator,
    this.automaticIndicatorColorAdjustment,
    this.animationDuration,
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
  });

  /// Controls the duration of DefaultTabController and TabBarView animations.
  ///
  /// Defaults to kTabScrollDuration.
  final Duration? animationDuration;

  /// Whether this tab bar can be scrolled horizontally.
  ///
  /// If [isScrollable] is true, then each tab is as wide as needed for its label
  /// and the entire [TabBar] is scrollable. Otherwise each tab gets an equal
  /// share of the available space.
  final bool? isScrollable;

  /// The amount of space by which to inset the tab bar.
  ///
  /// When [isScrollable] is false, this will yield the same result as if [TabBar] was wrapped
  /// in a [Padding] widget. When [isScrollable] is true, the scrollable itself is inset,
  /// allowing the padding to scroll with the tab bar, rather than enclosing it.
  final EdgeInsetsGeometry? padding;

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
  /// [ColorScheme.surfaceVariant] will be used, otherwise divider will not be drawn.
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
  /// If non-null, it is resolved against one of [MaterialState.focused],
  /// [MaterialState.hovered], and [MaterialState.pressed].
  ///
  /// [MaterialState.pressed] triggers a ripple (an ink splash), per
  /// the current Material Design spec.
  ///
  /// If the overlay color is null or resolves to null, then the default values
  /// for [InkResponse.focusColor], [InkResponse.hoverColor], [InkResponse.splashColor],
  /// and [InkResponse.highlightColor] will be used instead.
  final MaterialStateProperty<Color?>? overlayColor;

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
  /// [TabDirection.up] represents icon displayed above the label.
  /// [TabDirection.line] represents icon displayed in a horizontal line with the label.
  ///
  /// use this specify the desired tab layout direction for your tabs.
  /// default to [TabDirection.line],
  final TabDirection? direction;
}

/// An enum that defines the direction of tabs in a tab bar.
enum TabDirection {
  /// icon are displayed above the content.
  up,

  /// icon are displayed in a horizontal line with the label.
  line,
}
