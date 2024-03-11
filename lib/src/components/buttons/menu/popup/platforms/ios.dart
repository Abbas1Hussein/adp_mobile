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
    this.items,
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
  final List<AdaptivePopupMenuItem<T>>? items;
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
  int currentIndex = 0;

  bool get isEnabled => widget.onChanged != null;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    bool applyDisabledEffect = false;

    if (widget.selectedItemBuilder != null && isEnabled) {
      final items = widget.selectedItemBuilder!(context);
      final selectedItem =
          items.length > currentIndex ? items[currentIndex] : null;

      child = selectedItem != null
          ? DefaultTextStyle.merge(style: widget.style, child: selectedItem)
          : null;
    } else if (widget.hasValue) {
      applyDisabledEffect = !isEnabled;
      child = widget.items
          ?.firstWhere((element) => element.value == widget.value)
          .child;
    } else if (isEnabled) {
      applyDisabledEffect = true;
      child = widget.placeholder;
    } else {
      applyDisabledEffect = true;
      child = widget.disabledPlaceholder ?? widget.placeholder;
    }

    if (child != null) {
      child = Padding(padding: widget.padding, child: child);
    }

    final Color? iconColor =
        isEnabled ? widget.iconEnabledColor : widget.iconDisabledColor;

    final Widget? icon = widget.icon != null ? IconTheme.merge(
            data: CupertinoIconThemeData(
              color: iconColor,
              size: widget.iconSize,
            ),
            child: widget.icon!,
          ) : null;

    return SizedBox(
      width: widget.isExpanded ? double.infinity : null,
      child: PulldownMenuIOS<T>(
        tooltip: '',
        onOpened: widget.onTap,
        pulldownColor: widget.popupColor,
        elevation: widget.elevation?.toDouble(),
        position: widget.isExpanded ? PopupMenuPosition.under : null,
        constraints: widget.isExpanded ? const BoxConstraints.tightFor(width: double.infinity) : null,
        selectionType: SelectionType.single,
        onSelected: (index, valueX) {
          setState(() {
            value = valueX;
            currentIndex = index;
          });
          widget.onChanged?.call(valueX);
        },
        items: _buildItems(context),
        childBuilder: (context, showMenu) {
          final isSelected = value == widget.value ||
              widget.items![currentIndex].value == value;

          final backgroundColor = (isSelected && isEnabled)
              ? widget.focusColor
              : Colors.transparent;

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
              trailing: widget.icon == null
                  ? Icon(CupertinoIcons.chevron_down,
                      size: widget.iconSize, color: iconColor)
                  : icon,
              onPressed: showMenu,
              child: child,
            ).applyDisabledEffect(
              applyDisabledEffect,
              0.5,
              !isEnabled,
            ),
          );
        },
      ),
    );
  }

  List<AdaptivePulldownMenuItemEntry<T>> _buildItems(BuildContext context) {
    final items = widget.items?.map((item) {
      final isMarked = widget.value == item.value;

      return item.toIOS(context, isMarked, widget.style);
    });
    return items?.toList() ?? [];
  }
}
