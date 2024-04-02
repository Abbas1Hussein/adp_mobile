import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';

class BottomNavigationBarAndroidProperty extends CoreAndroidProperty {
  const BottomNavigationBarAndroidProperty({
    this.useMaterial3,
    this.labelBehavior,
    this.bar2property,
    this.bar3property,
  });

  /// Determines whether to use the Material 3 design for the bottom navigation bar.
  ///
  /// If `true`, the [NavigationBar] Widget will be used to configure a Material 3 style navigation bar.
  /// If `false`, the [BottomNavigationBar] Widget will be used to configure a traditional bottom navigation bar.
  ///
  /// By default to `Theme.of(context).useMaterial3`.
  final bool? useMaterial3;

  /// The property configuration for a Material 3 style navigation bar.
  ///
  /// This property is only used if [useMaterial3] is set to `true`. It allows customization of the navigation bar's appearance and behavior.
  /// See [BottomNavigationBar3Property] for details on available properties.
  final BottomNavigationBar3Property? bar3property;

  /// The property configuration for a traditional bottom navigation bar.
  ///
  /// This property is only used if [useMaterial3] is set to `false` . It allows customization of the appearance and behavior of the bottom navigation bar in a pre-Material 3 style.
  /// See [BottomNavigationBar2Property] for details on available properties.
  final BottomNavigationBar2Property? bar2property;

  /// Defines how the [destinations]' labels will be laid out and when they'll
  /// be displayed.
  ///
  /// Can be used to show all labels, show only the selected label, or hide all
  /// labels.
  ///
  /// If null, [NavigationBarThemeData.labelBehavior] is used. If that
  /// is also null, the default is
  /// [NavigationDestinationLabelBehavior.alwaysShow].
  final NavigationDestinationLabelBehavior? labelBehavior;
}

class BottomNavigationBar2Property extends CoreAndroidProperty {
  const BottomNavigationBar2Property({
    this.type,
    this.elevation,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.selectedFontSize = 14.0,
    this.unselectedFontSize = 12.0,
    this.showUnselectedLabels,
    this.showSelectedLabels,
    this.mouseCursor,
    this.enableFeedback,
    this.landscapeLayout,
    this.useLegacyColorScheme = true,
  });

  /// The z-coordinate of this [BottomNavigationBar].
  ///
  /// If null, defaults to `8.0`.
  ///
  /// {@macro flutter.material.material.elevation}
  final double? elevation;

  /// Defines the layout and behavior of a [BottomNavigationBar].
  ///
  /// See documentation for [BottomNavigationBarType] for information on the
  /// meaning of different types.
  final BottomNavigationBarType? type;

  /// The [TextStyle] of the [BottomNavigationBarItem] labels when they are
  /// selected.
  final TextStyle? selectedLabelStyle;

  /// The [TextStyle] of the [BottomNavigationBarItem] labels when they are not
  /// selected.
  final TextStyle? unselectedLabelStyle;

  /// The font size of the [BottomNavigationBarItem] labels when they are selected.
  ///
  /// If [TextStyle.fontSize] of [selectedLabelStyle] is non-null, it will be
  /// used instead of this.
  ///
  /// Defaults to `14.0`.
  final double selectedFontSize;

  /// The font size of the [BottomNavigationBarItem] labels when they are not
  /// selected.
  ///
  /// If [TextStyle.fontSize] of [unselectedLabelStyle] is non-null, it will be
  /// used instead of this.
  ///
  /// Defaults to `12.0`.
  final double unselectedFontSize;

  /// Whether the labels are shown for the unselected [BottomNavigationBarItem]s.
  final bool? showUnselectedLabels;

  /// Whether the labels are shown for the selected [BottomNavigationBarItem].
  final bool? showSelectedLabels;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// items.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [MaterialStateProperty.resolve] is used for the following [MaterialState]s:
  ///
  ///  * [MaterialState.selected].
  ///
  /// If null, then the value of [BottomNavigationBarThemeData.mouseCursor] is used. If
  /// that is also null, then [MaterialStateMouseCursor.clickable] is used.
  ///
  /// See also:
  ///
  ///  * [MaterialStateMouseCursor], which can be used to create a [MouseCursor]
  ///    that is also a [MaterialStateProperty<MouseCursor>].
  final MouseCursor? mouseCursor;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  /// The arrangement of the bar's [tabs] when the enclosing
  /// [MediaQueryData.orientation] is [Orientation.landscape].
  ///
  /// The following alternatives are supported:
  ///
  /// * [BottomNavigationBarLandscapeLayout.spread] - the items are
  ///   evenly spaced and spread out across the available width. Each
  ///   item's label and icon are arranged in a column.
  /// * [BottomNavigationBarLandscapeLayout.centered] - the items are
  ///   evenly spaced in a row but only consume as much width as they
  ///   would in portrait orientation. The row of items is centered within
  ///   the available width. Each item's label and icon are arranged
  ///   in a column.
  /// * [BottomNavigationBarLandscapeLayout.linear] - the items are
  ///   evenly spaced and each item's icon and label are lined up in a
  ///   row instead of a column.
  ///
  /// If this property is null, then the value of the enclosing
  /// [BottomNavigationBarThemeData.landscapeLayout is used. If that
  /// property is also null, then
  /// [BottomNavigationBarLandscapeLayout.spread] is used.
  ///
  /// This property is null by default.
  ///
  /// See also:
  ///
  ///  * [ThemeData.bottomNavigationBarTheme] - which can be used to specify
  ///    bottom navigation bar defaults for an entire application.
  ///  * [BottomNavigationBarTheme] - which can be used to specify
  ///    bottom navigation bar defaults for a widget subtree.
  ///  * [MediaQuery.of] - which can be used to determine the current
  ///    orientation.
  final BottomNavigationBarLandscapeLayout? landscapeLayout;

  /// This flag is controlling how [BottomNavigationBar] is going to use
  /// the colors provided by the [selectedIconTheme], [unselectedIconTheme],
  /// [selectedItemColor], [unselectedItemColor].
  /// The default value is `true` as the new theming logic is a breaking change.
  /// To opt-in the new theming logic set the flag to `false`
  final bool useLegacyColorScheme;
}

class BottomNavigationBar3Property extends CoreAndroidProperty {
  const BottomNavigationBar3Property({
    this.elevation,
    this.indicatorShape,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.height,
    this.animationDuration,
  });

  /// The elevation of the [NavigationBar] itself.
  ///
  /// If null, [NavigationBarThemeData.elevation] is used. If that
  /// is also null, then if [ThemeData.useMaterial3] is true then it will
  /// be 3.0 otherwise 0.0.
  final double? elevation;

  /// The color used for the drop shadow to indicate elevation.
  ///
  /// If null, [NavigationBarThemeData.shadowColor] is used. If that
  /// is also null, the default value is [Colors.transparent] which
  /// indicates that no drop shadow will be displayed.
  ///
  /// See [Material.shadowColor] for more details on drop shadows.
  final Color? shadowColor;

  /// The color used as an overlay on [backgroundColor] to indicate elevation.
  ///
  /// If null, [NavigationBarThemeData.surfaceTintColor] is used. If that
  /// is also null, the default value is [ColorScheme.surfaceTint].
  ///
  /// See [Material.surfaceTintColor] for more details on how this
  /// overlay is applied.
  final Color? surfaceTintColor;

  /// The shape of the selected indicator.
  ///
  /// If null, [NavigationBarThemeData.indicatorShape] is used. If that
  /// is also null and [ThemeData.useMaterial3] is true, [StadiumBorder] is used.
  /// Otherwise, [RoundedRectangleBorder] with a circular border radius of 16 is used.
  final ShapeBorder? indicatorShape;

  /// Determines the transition time for each destination as it goes between
  /// selected and unselected.
  final Duration? animationDuration;

  /// The height of the [NavigationBar] itself.
  ///
  /// If this is used in [Scaffold.bottomNavigationBar] and the scaffold is
  /// full-screen, the safe area padding is also added to the height
  /// automatically.
  ///
  /// The height does not adjust with [ThemeData.visualDensity] or
  /// [MediaQueryData.textScaler] as this component loses usability at
  /// larger and smaller sizes due to the truncating of labels or smaller tap
  /// targets.
  ///
  /// If null, [NavigationBarThemeData.height] is used. If that
  /// is also null, the default is 80.
  final double? height;

  /// The highlight color that's typically used to indicate that
  /// the [NavigationDestination] is focused, hovered, or pressed.
  final MaterialStateProperty<Color?>? overlayColor;
}

extension NavigationLabelVisibilityX on NavigationDestinationLabelBehavior {
  /// Returns a tuple of booleans indicating whether to show selected and
  /// unselected labels in a [BottomNavigationBar] widget.
  ///
  /// - If [alwaysShow], returns (true, true) to display both label types.
  /// - If [alwaysHide], returns (false, false) to hide both label types.
  /// - If [onlyShowSelected], returns (true, false) to show only the selected label.
  (bool showSelectedLabels, bool showUnselectedLabels) get showLabelVisibility {
    switch (this) {
      case NavigationDestinationLabelBehavior.alwaysShow:
        return (true, true);
      case NavigationDestinationLabelBehavior.alwaysHide:
        return (false, false);
      case NavigationDestinationLabelBehavior.onlyShowSelected:
        return (true, false);
    }
  }
}
