import 'package:flutter/material.dart';

import '../../../../../core/common/construct/property.dart';
import '../../menu.dart';
import '../single_choice.dart';

class PulldownMenuAndroid<T> extends StatelessWidget {
  const PulldownMenuAndroid({
    super.key,
    this.property,
    this.disabled = false,
    this.onOpened,
    this.onCanceled,
    this.highlightColor,
    this.tooltip,
    this.onSelected,
    this.disabledChild,
    this.child,
    required this.selectionType,
    required this.items,
  });

  final bool disabled;
  final VoidCallback? onOpened;
  final PopupMenuCanceled? onCanceled;
  final String? tooltip;
  final PulldownMenuSelectedCallback<T>? onSelected;
  final List<AdaptivePulldownMenuItemEntry> items;
  final Widget? disabledChild;
  final Widget? child;

  final Color? highlightColor;

  final PulldownMenuAndroidProperty? property;
  final SelectionType selectionType;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      // Common properties
      color: property?.color,
      surfaceTintColor: property?.surfaceTintColor,
      shape: property?.shape,
      shadowColor: property?.shadowColor,
      clipBehavior: property?.clipBehavior ?? Clip.none,
      elevation: property?.elevation,
      padding: property?.padding ?? EdgeInsets.zero,
      enableFeedback: property?.enableFeedback,
      position: property?.position,
      offset: property?.offset ?? Offset.zero,
      splashRadius: property?.splashRadius,
      // Adaptive properties
      tooltip: tooltip,
      enabled: !disabled,
      onOpened: onOpened,
      onCanceled: onCanceled,
      // onSelected: (value) {},
      itemBuilder: (context) {
        return items
            .map((item) {
              if (item is AdaptivePulldownMenuItem<T>) {
                return _CustomPopupMenuItem<T>(
                  selectionType: selectionType,
                  highlightColor: highlightColor,
                  onTap: () {
                    onSelected?.call(items.indexOf(item), item.value);
                    item.onTap?.call();
                  },
                  value: item.value,
                  enabled: item.enabled ?? selectionType == SelectionType.none,
                  child: item.buildListTile(context),
                );
              }
              return const PopupMenuDivider();
            })
            .whereType<PopupMenuEntry<T>>()
            .toList();
      },
      child: disabled ? disabledChild : child,
    );
  }
}

class _CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  const _CustomPopupMenuItem({
    super.key,
    super.child,
    super.onTap,
    super.value,
    super.enabled,
    this.highlightColor,
    required this.selectionType,
  });

  final Color? highlightColor;
  final SelectionType selectionType;

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() =>
      _CustomPopupMenuItemState<T>();
}

class _CustomPopupMenuItemState<T> extends PopupMenuItemState<T, _CustomPopupMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    final isSingleSelection = widget.selectionType == SelectionType.single;

    if (isSingleSelection) {
      final highlightColor = widget.enabled
          ? (widget.highlightColor ?? Theme.of(context).focusColor)
          : Colors.transparent;

      return ColoredBox(
        color: highlightColor,
        child: PopupMenuItem(
          value: widget.value,
          onTap: widget.onTap,
          child: widget.child,
        ),
      );
    }

    return PopupMenuItem(
      enabled: widget.enabled,
      value: widget.value,
      onTap: widget.onTap,
      child: widget.child,
    );
  }
}

class PulldownMenuAndroidProperty extends CoreAndroidProperty {
  const PulldownMenuAndroidProperty({
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.padding = EdgeInsets.zero,
    this.splashRadius,
    this.offset = Offset.zero,
    this.shape,
    this.color,
    this.enableFeedback,
    this.position,
    this.clipBehavior = Clip.none,
  });

  /// The z-coordinate at which to place the menu when open. This controls the
  /// size of the shadow below the menu.
  ///
  /// Defaults to 8, the appropriate elevation for popup menus.
  final double? elevation;

  /// The color used to paint the shadow below the menu.
  ///
  /// If null then the ambient [PopupMenuThemeData.shadowColor] is used.
  /// If that is null too, then the overall theme's [ThemeData.shadowColor]
  /// (default black) is used.
  final Color? shadowColor;

  /// The color used as an overlay on [color] to indicate elevation.
  ///
  /// If null, [PopupMenuThemeData.surfaceTintColor] is used. If that
  /// is also null, the default value is [ColorScheme.surfaceTint].
  ///
  /// See [Material.surfaceTintColor] for more details on how this
  /// overlay is applied.
  final Color? surfaceTintColor;

  /// Matches IconButton's 8 dps padding by default. In some cases, notably where
  /// this button appears as the trailing element of a list item, it's useful to be able
  /// to set the padding to zero.
  final EdgeInsetsGeometry padding;

  /// The splash radius.
  ///
  /// If null, default splash radius of [InkWell] or [IconButton] is used.
  final double? splashRadius;

  /// The offset is applied relative to the initial position
  /// set by the [position].
  ///
  /// When not set, the offset defaults to [Offset.zero].
  final Offset offset;

  /// If provided, the shape used for the menu.
  ///
  /// If this property is null, then [PopupMenuThemeData.shape] is used.
  /// If [PopupMenuThemeData.shape] is also null, then the default shape for
  /// [MaterialType.card] is used. This default shape is a rectangle with
  /// rounded edges of BorderRadius.circular(2.0).
  final ShapeBorder? shape;

  /// If provided, the background color used for the menu.
  ///
  /// If this property is null, then [PopupMenuThemeData.color] is used.
  /// If [PopupMenuThemeData.color] is also null, then
  /// Theme.of(context).cardColor is used.
  final Color? color;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  /// Whether the popup menu is positioned over or under the popup menu button.
  ///
  /// [offset] is used to change the position of the popup menu relative to the
  /// position set by this parameter.
  ///
  /// If this property is `null`, then [PopupMenuThemeData.position] is used. If
  /// [PopupMenuThemeData.position] is also `null`, then the position defaults
  /// to [PopupMenuPosition.over] which makes the popup menu appear directly
  /// over the button that was used to create it.
  final PopupMenuPosition? position;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// The [clipBehavior] argument is used the clip shape of the menu.
  ///
  /// Defaults to [Clip.none].
  final Clip clipBehavior;
}
