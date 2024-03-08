import 'package:flutter/material.dart';

import '../../../../../adp_mobile.dart';
import 'platforms/platforms.dart';
import 'single_choice.dart';

/// A pulldown menu button is used to create a nice overlay on the screen,
/// that allows the user to select any item from multiple options.
///
/// Use a pull-down button to present a list of commands.
///
/// - On macOS, [MacosPulldownButton] is utilized.
/// - On Windows, [DropDownButton] is used.
class AdaptivePulldownMenuButton<T> extends CoreAdaptiveComponent<
    PulldownMenuAndroidProperty, PulldownMenuIOSProperty> {
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
    super.properties,
    this.tooltip,
    this.onOpened,
    this.onCanceled,
    this.onSelected,
    this.pulldownColor,
    this.highlightColor,
    this.disabled = false,
    this.disabledChild,
    this.child,
    required this.items,
  }) : _type = SelectionType.none;

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
    super.properties,
    this.tooltip,
    this.onOpened,
    this.onCanceled,
    this.onSelected,
    this.pulldownColor,
    this.highlightColor,
    this.disabled = false,
    this.disabledChild,
    this.child,
    required this.items,
  }) : _type = SelectionType.single;

  /// If provided, [child] is the widget used for this button
  /// and the button will utilize an [InkWell] for taps.
  final Widget? child;

  /// The text that is displayed when the pull-down is disabled.
  ///
  /// If the pulldown is [disabled], this is displayed as a
  /// title for the pull-down button.
  final Widget? disabledChild;

  /// The list of menu entries for the pull-down menu.
  ///
  /// Can be either [AdaptivePulldownMenuItem]s or [AdaptivePulldownMenuDivider]s.
  final List<AdaptivePulldownMenuItemEntry<T>> items;

  /// A callback function that is called when a menu item is selected.
  ///
  /// The callback will receive the value of the selected item as its argument.
  final PulldownMenuSelectedCallback<T>? onSelected;

  /// The pulldown color. If null,
  ///
  /// on windows: [FluentThemeData.menuColor] is used.
  /// on macos: [MacosPulldownButtonTheme.pulldownColor] is used.
  final Color? pulldownColor;

  final Color? highlightColor;

  /// If true, the pulldown button won't be clickable.
  ///
  /// Default is false.
  final bool disabled;

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
  Widget android(BuildContext context, [PulldownMenuAndroidProperty? property]) {
    return PulldownMenuAndroid<T>(
      property: property,
      items: items,
      tooltip: tooltip,
      disabled: disabled,
      onOpened: onOpened,
      onSelected: onSelected,
      onCanceled: onCanceled,
      highlightColor: highlightColor,
      disabledChild: disabledChild,
      selectionType: _type,
      child: child,
    );
  }

  @override
  Widget iOS(BuildContext context, [PulldownMenuIOSProperty? property]) {
    return PulldownMenuIOS<T>(
      property: property,
      items: items,
      tooltip: tooltip,
      disabled: disabled,
      onOpened: onOpened,
      onSelected: onSelected,
      onCanceled: onCanceled,
      highlightColor: highlightColor,
      disabledChild: disabledChild,
      selectionType: _type,
      child: child,
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
