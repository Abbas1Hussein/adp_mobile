import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extension/widget.dart';
import '../../cupertino_menu_action.dart';
import '../../menu.dart';
import '../../pulldown/platforms/ios.dart';
import '../../pulldown/single_choice.dart';

class PopupMenuIOS<T> extends StatefulWidget {
  const PopupMenuIOS({
    super.key,
    this.value,
    this.onTap,
    this.style,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.onChanged,
    this.popupColor,
    this.focusColor,
    this.placeholder,
    this.elevation,
    this.isExpanded = false,
    this.selectedItemBuilder,
    required this.items,
    required this.padding,
    required this.hasValue,
    required this.disabledPlaceholder,
  });

  final T? value;
  final bool hasValue;
  final bool isExpanded;
  final TextStyle? style;
  final Color? popupColor;
  final Color? focusColor;
  final VoidCallback? onTap;
  final Widget? placeholder;
  final EdgeInsetsGeometry padding;
  final Widget? disabledPlaceholder;
  final ValueChanged<T?>? onChanged;
  final List<AdaptivePopupMenuItem<T>> items;
  final PopupMenuButtonBuilder? selectedItemBuilder;
  final int? elevation;

  final Widget? icon;
  final double? iconSize;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;

  @override
  _PopupMenuIOSState createState() => _PopupMenuIOSState<T>();
}

class _PopupMenuIOSState<T> extends State<PopupMenuIOS<T>> {
  T? value;
  int _selectedIndex = 0;

  @override
  void didUpdateWidget(covariant PopupMenuIOS<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateSelectedIndex();
  }

  void _updateSelectedIndex() {
    if (widget.items.isEmpty ||
        (widget.value == null &&
            widget.items
                .where((AdaptivePopupMenuItem<T> item) =>
                    item.value == widget.value)
                .isEmpty)) {
      return;
    }

    for (int itemIndex = 0; itemIndex < widget.items.length; itemIndex++) {
      final item = widget.items[itemIndex];
      if (item.value == widget.value) {
        value = item.value;
        _selectedIndex = itemIndex;
        return;
      }
    }
  }

  bool get isEnabled => widget.items.isNotEmpty && widget.onChanged != null;

  @override
  Widget build(BuildContext context) {
    final (Widget?, bool, double) recordingElement = _buildRecordingElement();

    final child = recordingElement.$1 != null
        ? Padding(padding: widget.padding, child: recordingElement.$1)
        : null;

    final applyDisabledEffect = recordingElement.$2;
    final disabledEffectOpacity = recordingElement.$3;

    return SizedBox(
      width: widget.isExpanded ? double.infinity : null,
      child: PulldownMenuIOS<T>(
        tooltip: '',
        onOpened: widget.onTap,
        pulldownColor: widget.popupColor,
        highlightColor: widget.popupColor,
        elevation: widget.elevation?.toDouble(),
        position: widget.isExpanded ? PopupMenuPosition.under : null,
        constraints: widget.isExpanded
            ? const BoxConstraints.tightFor(width: double.infinity)
            : null,
        selectionType: SelectionType.single,
        onSelected: (index, valueX) => widget.onChanged?.call(valueX),
        items: _buildItems(context),
        childBuilder: (context, showMenu) {
          final isSelected = value == widget.value ||
              (isEnabled && widget.items[_selectedIndex].value == value);

          final backgroundColor =
              isSelected && isEnabled ? widget.focusColor : Colors.transparent;

          return IntrinsicWidth(
            child: CupertinoMenuAction(
              padding: widget.padding,
              backgroundColor: backgroundColor,
              pressedColor:
                  isSelected ? widget.focusColor?.withOpacity(0.90) : null,
              textStyle: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(fontWeight: FontWeight.w800),
              trailing: _buildIcon(),
              onPressed: showMenu,
              child: child,
            ).applyDisabledEffect(
                applyDisabledEffect, disabledEffectOpacity, !isEnabled),
          );
        },
      ),
    );
  }

  Widget _buildIcon() {
    final iconColor =
        isEnabled ? widget.iconEnabledColor : widget.iconDisabledColor;

    return widget.icon != null
        ? IconTheme.merge(
            data: CupertinoIconThemeData(
              color: iconColor,
              size: widget.iconSize,
            ),
            child: widget.icon!,
          )
        : Icon(
            CupertinoIcons.chevron_down,
            size: widget.iconSize,
            color: iconColor,
          );
  }

  (Widget? child, bool applyDisabledEffect, double disabledEffectOpacity)
      _buildRecordingElement() {
    // If the items list is empty, return null child with disabled effect applied and opacity 0.5
    if (widget.items.isEmpty) return (null, true, 0.5);

    if (widget.selectedItemBuilder != null && isEnabled) {
      // Return the selected item if it exists, with disabled effect not applied.
      final items = widget.selectedItemBuilder!(context);
      final selectedItem =
          items.length > _selectedIndex ? items[_selectedIndex] : null;
      return (
        selectedItem != null
            ? DefaultTextStyle.merge(style: widget.style, child: selectedItem)
            : null,
        false,
        1.0,
      );
    } else if (widget.hasValue) {
      // Return the child of the item with the same value as the current value of the widget
      // Apply disabled effect if the widget is disabled, with opacity based on isEnabled flag.
      return (
        widget.items
            .firstWhere((element) => element.value == widget.value)
            .child,
        !isEnabled,
        !isEnabled ? 0.5 : 1,
      );
    } else {
      // If none of the above conditions are met, i.e., the widget is neither enabled nor disabled.
      // Return the placeholder or disabled placeholder with the disabled effect applied and opacity 0.65.
      return (
        isEnabled
            ? widget.placeholder
            : widget.disabledPlaceholder ?? widget.placeholder,
        true,
        0.65,
      );
    }
  }

  List<AdaptivePulldownMenuItemEntry<T>> _buildItems(BuildContext context) {
    final items = widget.items.map((item) {
      final isMarked = widget.value == item.value;

      return item.toIOS(context, isMarked, widget.style);
    });
    return items.toList();
  }
}
