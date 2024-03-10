import 'package:flutter/material.dart';

import '../../../../../adp_mobile.dart';
import '../cupertino_menu_action.dart';
import 'platforms/platforms.dart';
import 'single_choice.dart';

/// Callback type for handling the selection of items in a pulldown menu.
///
/// The [index] parameter represents the index of the selected item.
/// The [value] parameter represents the selected value of generic type [T].
typedef PulldownMenuSelectedCallback<T> = void Function(int index, T? value);

/// A pulldown menu button is used to create a nice overlay on the screen,
/// that allows the user to select any item from multiple options.
///
/// Use a pull-down button to present a list of commands.
///
/// - On iOS, Specific [PopupMenuButton] is utilized.
/// - On Android, [PopupMenuButton] is used.
class AdaptivePulldownMenuButton<T> extends CoreAdaptiveComponent {
  /// Creates an instance of AdaptivePulldownMenuButton.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// AdaptivePulldownMenuButton<String>(
  ///   title: 'Adp Menu',
  ///   onSelected: (String? value) {
  ///     // Handle the selected value
  ///   },
  ///   items: const [
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.folderAdd),
  ///       child: Text('New folder'),
  ///     ),
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.folderOpen),
  ///       child: Text('Open'),
  ///     ),
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.wand),
  ///       child: Text('Open with'),
  ///     ),
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.delete),
  ///       child: Text('Remove'),
  ///       enabled: false, // this will disabled.
  ///     ),
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.phone),
  ///       child: Text('Import from phone ...'),
  ///     ),
  ///     AdaptivePulldownMenuDivider(),
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.star),
  ///       child: Text('Give us a star'),
  ///     ),
  ///   ],
  /// );
  /// ```
  ///
  /// See also:
  ///
  /// * [AdaptivePulldownMenuButton.singleChoice] focuses on only one AdaptivePulldownMenuItem.
  /// * [AdaptivePopupMenuButton]
  const AdaptivePulldownMenuButton({
    super.key,
    super.builders,
    this.iconSize,
    this.iconColor,
    this.constraints,
    this.offset = Offset.zero,
    this.position,
    this.enableFeedback,
    this.padding = EdgeInsets.zero,
    this.elevation,
    this.clipBehavior = Clip.none,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.tooltip,
    this.onOpened,
    this.onCanceled,
    this.onSelected,
    this.pulldownColor,
    this.highlightColor,
    this.disabled = false,
    this.icon,
    this.disabledIcon,
    this.child,
    this.disabledChild,
    required this.items,
  })  : _type = SelectionType.none,
        assert(
          !(child != null && icon != null),
          'You can only pass [child] or [icon], not both.',
        );

  /// When used, will focus on only one [AdaptivePulldownMenuItem].
  ///
  /// If [AdaptivePulldownMenuItem.enabled] is true, it will be focused.
  ///
  /// - Should be exactly one item with the specified 'enabled' value set to true.
  ///
  /// Example:
  /// ```dart
  /// AdaptivePulldownMenuItem(
  ///   enabled: true,
  ///   leading: AdaptiveIcon(AdpIcons.star),
  ///   child: Text('Give us a star'),
  /// ),
  /// ```
  const AdaptivePulldownMenuButton.singleChoice({
    super.key,
    super.builders,
    this.iconSize,
    this.iconColor,
    this.constraints,
    this.offset = Offset.zero,
    this.position,
    this.enableFeedback,
    this.padding = EdgeInsets.zero,
    this.elevation,
    this.clipBehavior = Clip.none,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.tooltip,
    this.onOpened,
    this.onCanceled,
    this.onSelected,
    this.pulldownColor,
    this.highlightColor,
    this.disabled = false,
    this.icon,
    this.disabledIcon,
    this.child,
    this.disabledChild,
    required this.items,
  })  : _type = SelectionType.single,
        assert(
          !(child != null && icon != null),
          'You can only pass [child] or [icon], not both.',
        );

  /// The list of menu entries for the pull-down menu.
  ///
  /// Can be either [AdaptivePulldownMenuItem]s or [AdaptivePulldownMenuDivider]s.
  final List<AdaptivePulldownMenuItemEntry<T>> items;

  /// A callback function that is called when a menu item is selected.
  ///
  /// The callback will receive the value of the selected item as its argument.
  final PulldownMenuSelectedCallback<T>? onSelected;

  /// If provided, the [icon] is used for this button
  /// and the button will behave like an [IconButton].
  final Widget? icon;

  /// If provided, [child] is the widget used for this button
  /// and the button will utilize an [InkWell] for taps.
  final Widget? disabledIcon;

  /// If provided, [child] is the widget used for this button
  /// and the button will utilize an [InkWell] for taps.
  final Widget? child;

  /// The text that is displayed when the pull-down is disabled.
  ///
  /// If the pulldown is [disabled], this is displayed as a
  /// title for the pull-down button.
  final Widget? disabledChild;

  /// The pulldown color. If null,
  ///
  /// on windows: [FluentThemeData.menuColor] is used.
  /// on macos: [MacosPulldownButtonTheme.pulldownColor] is used.
  final Color? pulldownColor;

  final Color? highlightColor;

  /// If provided, this color is used for the button icon.
  ///
  /// If this property is null, then [PopupMenuThemeData.iconColor] is used.
  /// If [PopupMenuThemeData.iconColor] is also null then defaults to
  /// [IconThemeData.color].
  final Color? iconColor;

  /// If provided, the size of the [Icon].
  ///
  /// If this property is null, then [IconThemeData.size] is used.
  /// If [IconThemeData.size] is also null, then
  /// default size is 24.0 pixels.
  final double? iconSize;

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

  /// The offset is applied relative to the initial position
  /// set by the [position].
  ///
  /// When not set, the offset defaults to [Offset.zero].
  final Offset offset;

  /// Optional size constraints for the menu.
  ///
  /// When unspecified, defaults to:
  /// ```dart
  /// const BoxConstraints(
  ///   minWidth: 2.0 * 56.0,
  ///   maxWidth: 5.0 * 56.0,
  /// )
  /// ```
  ///
  /// The default constraints ensure that the menu width matches maximum width
  /// recommended by the Material Design guidelines.
  /// Specifying this parameter enables creation of menu wider than
  /// the default maximum width.
  final BoxConstraints? constraints;

  /// If provided, the shape used for the menu.
  ///
  /// If this property is null, then [PopupMenuThemeData.shape] is used.
  /// If [PopupMenuThemeData.shape] is also null, then the default shape for
  /// [MaterialType.card] is used. This default shape is a rectangle with
  /// rounded edges of BorderRadius.circular(2.0).
  final ShapeBorder? shape;

  /// If true, the pulldown button won't be clickable.
  ///
  /// Default is false.
  final bool disabled;

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

  /// Called when the pull-down button is tapped.
  ///
  /// The callback will not be invoked if the pull-down button is disabled.
  final VoidCallback? onOpened;

  /// Called when the user dismisses the popup menu without selecting an item.
  ///
  /// If the user selects a value, [onSelected] is called instead.
  final PopupMenuCanceled? onCanceled;

  /// Text that describes the action that will occur when the button is pressed.
  ///
  /// This text is displayed when the user long-presses on the button and is
  /// used for accessibility.
  final String? tooltip;

  /// The selection type for the pulldown menu button.
  ///
  /// - `SelectionType.single`: Enables single-item selection.
  /// - `SelectionType.none`: No item is selected by default.
  final SelectionType _type;

  @override
  Widget build(BuildContext context) {
    validateSelectedItem();
    return super.build(context);
  }

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return PopupMenuButton<T>(
      iconColor: iconColor,
      iconSize: iconSize,
      shape: shape,
      offset: offset,
      tooltip: tooltip,
      padding: padding,
      onOpened: onOpened,
      enabled: !disabled,
      position: position,
      elevation: elevation,
      color: pulldownColor,
      onCanceled: onCanceled,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
      constraints: constraints,
      enableFeedback: enableFeedback,
      surfaceTintColor: surfaceTintColor,
      itemBuilder: (context) {
        return items.map((item) {
          return item.buildCustomMenuItemEntry(
            context: context,
            highlightColor: highlightColor,
            onSelected: (AdaptivePulldownMenuItem<T> item) {
              onSelected?.call(items.indexOf(item), item.value);
            },
            selectionType: _type,
          );
        }).toList();
      },
      icon: disabled ? disabledIcon : icon,
      child: disabled ? disabledChild : child,
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return PulldownMenuIOS<T>(
      selectionType: _type,
      items: items,
      shape: shape,
      offset: offset,
      tooltip: tooltip,
      padding: padding,
      iconSize: iconSize,
      iconColor: iconColor,
      onOpened: onOpened,
      disabled: disabled,
      position: position,
      elevation: elevation,
      onSelected: onSelected,
      onCanceled: onCanceled,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
      pulldownColor: pulldownColor,
      highlightColor: highlightColor,
      enableFeedback: enableFeedback,
      surfaceTintColor: surfaceTintColor,
      icon: disabled ? disabledIcon : icon,
      childBuilder: (disabledChild != null || child != null)
          ? (context, showMenu) {
              if (disabled) return disabledChild ?? const SizedBox.shrink();
              return CupertinoMenuAction(
                backgroundColor: Colors.transparent,
                onPressed: showMenu,
                child: child,
              );
            }
          : null,
    );
  }

  void validateSelectedItem() {
    assert(
      items.isNotEmpty,
      "Validation failed in the $runtimeType.\n"
      "The list of items should not be empty.",
    );

    if (_type == SelectionType.single) {
      // Filter items to include only selected items (if applicable)
      final selectedItems =
          items.whereType<AdaptivePulldownMenuItem<T?>>().where((item) {
        return item.enabled ?? false;
      });

      // Check if there is exactly one selected item
      final hasUniqueSelectedItem = selectedItems.length == 1;

      assert(
        hasUniqueSelectedItem,
        "Validation failed in $runtimeType.\n\n"
        "There should be exactly one item with the specified 'enabled' value set to true.\n"
        "Ensure that there is only one AdaptivePulldownMenuItem in the list with 'enabled: true'.",
      );
    }
  }
}
