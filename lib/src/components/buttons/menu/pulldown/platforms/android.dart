import 'package:flutter/material.dart';

import '../../menu.dart';
import '../single_choice.dart';

class _CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  const _CustomPopupMenuItem({
    super.key,
    this.highlightColor,
    required this.item,
    required this.selectionType,
    required VoidCallback super.onTap,
  }) : super(child: null);

  final Color? highlightColor;
  final AdaptivePulldownMenuItem<T> item;
  final SelectionType selectionType;

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() =>
      _CustomPopupMenuItemState<T>();
}

class _CustomPopupMenuItemState<T>
    extends PopupMenuItemState<T, _CustomPopupMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final isSingleSelection = widget.selectionType == SelectionType.single;
    final enabled = item.enabled ?? !isSingleSelection;

    if (isSingleSelection) {
      final highlightColor = enabled
          ? (widget.highlightColor ?? Theme.of(context).focusColor)
          : Colors.transparent;

      return ColoredBox(
        color: highlightColor,
        child: PopupMenuItem<T>(
          value: item.value,
          onTap: widget.onTap,
          child: item.buildListTile(context),
        ),
      );
    }

    return PopupMenuItem<T>(
      enabled: enabled,
      value: item.value,
      onTap: widget.onTap,
      child: item.buildListTile(context),
    );
  }
}

extension CustomPopupMenuItemEx<T> on AdaptivePulldownMenuItemEntry<T> {
  PopupMenuEntry<T> buildCustomMenuItemEntry({
    Color? highlightColor,
    ValueChanged<AdaptivePulldownMenuItem<T>>? onSelected,
    required BuildContext context,
    required SelectionType selectionType,
  }) {
    if (this is AdaptivePulldownMenuItem<T>) {
      final item = this as AdaptivePulldownMenuItem<T>;
      return _CustomPopupMenuItem<T>(
        item: item,
        selectionType: selectionType,
        highlightColor: highlightColor,
        onTap: () {
          onSelected?.call(item);
          item.onTap?.call();
        },
      );
    }
    return const PopupMenuDivider();
  }
}
