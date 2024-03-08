import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/adaptive.dart';

/// Drawers are typically used with the [Scaffold.drawer] property. The child of
/// the drawer is usually a [ListView] whose first child is a [DrawerHeader]
/// that displays status information about the current user. The remaining
/// drawer children are often constructed with [AdaptiveListTile]s, often concluding
/// with an [AboutListTile].
///
/// The [AdaptiveAppBar] automatically displays an appropriate [AdaptiveIconButton] to show the
/// [AdaptiveDrawer] when a [AdaptiveDrawer] is available in the [AdaptiveScaffold]. The [AdaptiveScaffold]
/// automatically handles the edge-swipe gesture to show the drawer.
///
/// An open drawer may be closed with a swipe to close gesture, pressing the
/// escape key, by tapping the scrim, or by calling pop route function such as
/// [Navigator.pop]. For example a drawer item might close the drawer when tapped:
///
/// ```dart
/// AdaptiveListTile(
///   leading: const AdaptiveIcon(AdpIcons.archive),
///   title: const Text('Change history'),
///   onTap: () {
///     // change app state...
///     Navigator.pop(context); // close the drawer
///   },
/// );
/// ```
///
/// See also:
///
///  * [Scaffold.drawer], where one specifies a [Drawer] so that it can be
///    shown.
///  * [Scaffold.of], to obtain the current [ScaffoldState], which manages the
///    display and animation of the drawer.
///  * [ScaffoldState.openDrawer], which displays its [Drawer], if any.
///  * <https://material.io/design/components/navigation-drawer.html>
class AdaptiveDrawer extends StatelessWidget {
  /// Creates a ADP Design drawer.
  ///
  /// Typically used in the [AdaptiveScaffold.drawer] property.
  ///
  /// The [elevation] must be non-negative.
  const AdaptiveDrawer({
    super.key,
    this.width = 304,
    this.elevation,
    this.semanticLabel,
    this.backgroundColor,
    this.shape,
    this.clipBehavior = Clip.none,
    this.shadowColor = const Color(0xFF000000),
    this.child,
  });

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The width of the drawer.
  ///
  /// Default to 300px.
  final double width;

  /// Sets the color that holds all of the [AdaptiveDrawer]'s
  /// contents.
  ///
  /// If this is null, then base platform color is used.
  final Color? backgroundColor;

  /// The z-coordinate at which to place this drawer relative to its parent.
  ///
  /// This controls the size of the shadow below the drawer.
  ///
  /// Defaults to 0.
  final double? elevation;

  /// The color used to paint a drop shadow under the drawer's which reflects the drawer's [elevation].
  ///
  ///
  /// See also:
  ///   * [elevation], which affects how the drop shadow is painted.
  final Color shadowColor;

  /// The shape of the drawer.
  ///
  /// Defines the drawer's [Material.shape].
  ///
  /// If this is null, then [DrawerThemeData.shape] is used. If that
  /// is also null, then it falls back to [Material]'s default.
  final ShapeBorder? shape;

  /// The semantic label of the drawer used by accessibility frameworks to
  /// announce screen transitions when the drawer is opened and closed.
  final String? semanticLabel;

  /// The [clipBehavior] argument specifies how to clip the drawer's [shape].
  ///
  /// If the drawer has a [shape], it defaults to [Clip.hardEdge]. Otherwise,
  /// defaults to [Clip.none].
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final Color drawerBackgroundColor = backgroundColor ??
        adaptiveValue(
          ios: () => CupertinoTheme.of(context).barBackgroundColor,
          android: () =>
              Theme.of(context).drawerTheme.backgroundColor ??
              Theme.of(context).canvasColor,
        );

    return Drawer(
      shape: shape,
      width: width,
      elevation: elevation,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
      semanticLabel: semanticLabel,
      backgroundColor: drawerBackgroundColor,
      child: child,
    );
  }
}
