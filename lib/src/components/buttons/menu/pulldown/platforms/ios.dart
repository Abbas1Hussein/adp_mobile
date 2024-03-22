import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extension/widget.dart';
import '../../../../additional/brightness.dart';
import '../../../icon_button/icon_button.dart';
import '../../menu.dart';
import '../single_choice.dart';

const border = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
  borderSide: BorderSide(color: CupertinoColors.separator),
);

class PulldownMenuIOS<T> extends StatefulWidget {
  const PulldownMenuIOS({
    super.key,
    this.iconColor,
    this.iconSize,
    this.pulldownColor,
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
    this.disabled = false,
    this.onOpened,
    this.onCanceled,
    this.tooltip,
    this.onSelected,
    this.icon,
    this.childBuilder,
    this.highlightColor,
    required this.items,
    required this.selectionType,
  });

  final Color? pulldownColor;
  final Color? highlightColor;

  final Widget? icon;
  final Color? iconColor;
  final double? iconSize;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final EdgeInsetsGeometry padding;
  final Offset offset;
  final ShapeBorder? shape;
  final bool? enableFeedback;
  final PopupMenuPosition? position;
  final Clip clipBehavior;
  final BoxConstraints? constraints;

  final String? tooltip;
  final bool disabled;
  final VoidCallback? onOpened;
  final List<AdaptivePulldownMenuItemEntry<T>> items;
  final PulldownMenuSelectedCallback<T>? onSelected;
  final PopupMenuCanceled? onCanceled;
  final Widget Function(BuildContext context, VoidCallback showMenu)?
      childBuilder;

  final SelectionType selectionType;

  @override
  State<PulldownMenuIOS<T>> createState() => _PulldownMenuIOSState<T>();
}

class _PulldownMenuIOSState<T> extends State<PulldownMenuIOS<T>> {
  late final _offset = widget.offset;
  late final _padding = widget.padding;

  /// A method to show a popup menu with the items supplied to
  /// [PopupMenuButton.itemBuilder] at the position of your [PopupMenuButton].
  ///
  /// By default, it is called when the user taps the button and [PopupMenuButton.enabled]
  /// is set to `true`. Moreover, you can open the button by calling the method manually.
  ///
  /// You would access your [PopupMenuButtonState] using a [GlobalKey] and
  /// show the menu of the button with `globalKey.currentState.showButtonMenu`.
  void showButtonMenu() {
    final PopupMenuThemeData popupMenuTheme = PopupMenuTheme.of(context);
    final RenderBox button = context.findRenderObject()! as RenderBox;
    final RenderBox overlay =
        Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
    final PopupMenuPosition popupMenuPosition =
        widget.position ?? popupMenuTheme.position ?? PopupMenuPosition.over;
    late Offset offset;
    switch (popupMenuPosition) {
      case PopupMenuPosition.over:
        offset = _offset;
      case PopupMenuPosition.under:
        offset = Offset(0.0, button.size.height) + _offset;
        if (widget.childBuilder == null) {
          // Remove the padding of the icon button.
          offset -= Offset(0.0, _padding.vertical / 2);
        }
    }
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(offset, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero) + offset,
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    // Only show the menu if there is something to show
    if (_allItemsEntry.isNotEmpty) {
      widget.onOpened?.call();
      showMenu<T?>(
        context: context,
        position: position,
        items: _allItemsEntry,
        elevation: widget.elevation,
        shadowColor: widget.shadowColor,
        shape: widget.shape ?? border,
        clipBehavior: widget.clipBehavior,
        constraints: widget.constraints,
        color: widget.pulldownColor ??
            CupertinoTheme.of(context).barBackgroundColor,
        surfaceTintColor: widget.surfaceTintColor ??
            CupertinoTheme.of(context).primaryContrastingColor,
      ).then<void>((T? newValue) {
        if (!mounted) return null;

        if (newValue == null) {
          widget.onCanceled?.call();
          return null;
        }
      });
    }
  }

  List<PopupMenuEntry<T?>> get _allItemsEntry {
    final items = widget.items;

    final Iterable<PopupMenuEntry<T?>> iterableEntry = items.map((item) {
      return item.buildCustomCupertinoMenuItemEntry(
        context: context,
        highlightColor: widget.highlightColor,
        selectionType: widget.selectionType,
        onSelected: (item) {
          widget.onSelected?.call(items.indexOf(item), item.value);
        },
      );
    });

    return iterableEntry.whereType<PopupMenuEntry<T?>>().toList();
  }

  @override
  Widget build(BuildContext context) {
    final child = widget.childBuilder != null
        ? widget.childBuilder?.call(context, showButtonMenu)
        : _buildIconButton();

    return Tooltip(
      message:
          widget.tooltip ?? MaterialLocalizations.of(context).showMenuTooltip,
      child: child,
    );
  }

  Widget _buildIconButton() {
    final icon = IconTheme.merge(
      data: CupertinoIconThemeData(
        color: widget.iconColor,
        size: widget.iconSize,
      ).resolve(context),
      child: const Icon(CupertinoIcons.ellipsis_vertical),
    );

    return AdaptiveIconButton(
      icon: widget.icon ?? icon,
      onPressed:
          widget.disabled || _allItemsEntry.isEmpty ? null : showButtonMenu,
    ).iOS(context);
  }
}

class _CustomCupertinoPopupMenuItem<T> extends PopupMenuItem<T> {
  const _CustomCupertinoPopupMenuItem({
    super.key,
    this.highlightColor,
    required this.item,
    required this.selectionType,
    required VoidCallback super.onTap,
  }) : super(child: null);

  final Color? highlightColor;
  final SelectionType selectionType;
  final AdaptivePulldownMenuItem<T> item;

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() =>
      _CustomPopupMenuItemState<T>();
}

class _CustomPopupMenuItemState<T>
    extends PopupMenuItemState<T, _CustomCupertinoPopupMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final isSingleSelection = widget.selectionType == SelectionType.single;
    final enabled = item.enabled ?? !isSingleSelection;

    if (isSingleSelection) {
      final highlightColor = enabled
          ? (widget.highlightColor ?? CupertinoColors.secondarySystemFill)
          : null;

      return CupertinoListTile.notched(
        onTap: widget.onTap,
        title: mergeWithColor(item.child, highlightColor, enabled),
        leading: mergeWithColor(item.leading, highlightColor, enabled),
        trailing: mergeWithColor(item.trailing, highlightColor, enabled),
        backgroundColor: highlightColor,
        backgroundColorActivated: widget.highlightColor,
      );
    }

    return CupertinoListTile.notched(
      title: item.child,
      leading: item.leading,
      trailing: item.trailing,
      onTap: enabled ? widget.onTap : null,
      backgroundColorActivated: widget.highlightColor,
    ).applyDisabledEffect(!enabled);
  }

  Widget mergeWithColor(Widget? child, Color? highlightColor, bool enabled) {
    if (child == null) return const SizedBox.shrink();

    final brightness = CupertinoTheme.brightnessOf(context);

    final fillColor = widget.highlightColor != null
        ? brightness.isLight
            ? enabled
                ? CupertinoColors.white
                : CupertinoColors.black
            : CupertinoColors.white
        : null;

    return IconTheme.merge(
      data: CupertinoIconThemeData(color: fillColor),
      child: DefaultTextStyle.merge(
          style: TextStyle(color: fillColor), child: child),
    );
  }
}

extension CustomCupertinoPopupMenuItemEx<T> on AdaptivePulldownMenuItemEntry<T> {
  PopupMenuEntry<T> buildCustomCupertinoMenuItemEntry({
    Color? highlightColor,
    ValueChanged<AdaptivePulldownMenuItem<T>>? onSelected,
    required BuildContext context,
    required SelectionType selectionType,
  }) {
    if (this is AdaptivePulldownMenuItem<T>) {
      final item = this as AdaptivePulldownMenuItem<T>;
      return _CustomCupertinoPopupMenuItem<T>(
        item: item,
        selectionType: selectionType,
        highlightColor: highlightColor,
        onTap: () {
          onSelected?.call(item);
          item.onTap?.call();

          Navigator.maybePop(context);
        },
      );
    }

    return const PopupMenuDivider();
  }
}
