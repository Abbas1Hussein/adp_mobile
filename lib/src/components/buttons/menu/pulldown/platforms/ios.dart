import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/construct/property.dart';
import '../../../icon_button/icon_button.dart';
import '../../menu.dart';
import '../single_choice.dart';

class PulldownMenuIOS<T> extends StatelessWidget {
  const PulldownMenuIOS({
    super.key,
    this.property,
    this.disabled = false,
    this.onOpened,
    this.onCanceled,
    this.tooltip,
    this.onSelected,
    this.disabledChild,
    this.child,
    this.highlightColor,
    required this.items,
    required this.selectionType,
  });

  final String? tooltip;
  final bool disabled;
  final VoidCallback? onOpened;
  final List<AdaptivePulldownMenuItemEntry> items;
  final PulldownMenuSelectedCallback<T>? onSelected;
  final PopupMenuCanceled? onCanceled;
  final Widget? disabledChild;
  final Widget? child;

  final Color? highlightColor;

  final PulldownMenuIOSProperty? property;
  final SelectionType selectionType;

  @override
  Widget build(BuildContext context) {
    // return CupertinoContextMenu(
    //   actions: _buildActionItems(context).map((e) {
    //     return CupertinoContextMenuAction(
    //       onPressed: e.onPressed,
    //       child: e.item.buildListTile(context),
    //     );
    //   }).toList(),
    //   child: AdaptiveIconButton(
    //    onPressed: disabled ? null : () => _buildPulldown(context),
    //     icon: (disabled ? disabledChild : child) ?? _defaultIcon(context),
    //   ).iOS(context),
    // );
    return Tooltip(
      message: tooltip ?? MaterialLocalizations.of(context).showMenuTooltip,
      child: AdaptiveIconButton(
        onPressed: disabled ? null : () => _buildPulldown(context),
        icon: (disabled ? disabledChild : child) ?? _defaultIcon(context),
      ).iOS(context),
    );
  }

  void _buildPulldown(BuildContext context) {
    onOpened?.call();
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: _buildActionItems(context),
          cancelButton: _buildCancelButton(context),
        );
      },
    );
  }

  List<_CupertinoPulldownItem> _buildActionItems(BuildContext context) {
    return items
        .map((item) {
          if (item is AdaptivePulldownMenuItem<T>) {
            return _buildCupertinoPulldownItem(context, item);
          }
          return const SizedBox.shrink();
        })
        .whereType<_CupertinoPulldownItem>()
        .toList();
  }

  _CupertinoPulldownItem _buildCupertinoPulldownItem(
    BuildContext context,
    AdaptivePulldownMenuItem<T> item,
  ) {
    return _CupertinoPulldownItem(
      highlightColor: highlightColor,
      disabledNoneColor: property?.disabledNoneColor,
      enabled: item.enabled ?? selectionType == SelectionType.none,
      selectionType: selectionType,
      onPressed: () {
        item.onTap?.call();
        onSelected?.call(items.indexOf(item), item.value);
        Navigator.maybePop(context);
      },
      item: item,
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return CupertinoActionSheetAction(
      child: Text(
        property?.cancelButtonLabel ??
            MaterialLocalizations.of(context).cancelButtonLabel,
      ),
      onPressed: () {
        Navigator.maybePop(context);
        onCanceled?.call();
      },
    );
  }

  Widget _defaultIcon(BuildContext context) {
    return IconTheme.merge(
      data: const CupertinoIconThemeData().resolve(context),
      child: const Icon(CupertinoIcons.chevron_down),
    );
  }
}

class _CupertinoPulldownItem<T> extends StatelessWidget {
  const _CupertinoPulldownItem({
    super.key,
    this.highlightColor,
    this.disabledNoneColor,
    required this.item,
    required this.enabled,
    required this.onPressed,
    required this.selectionType,
  });

  final bool enabled;

  final Color? highlightColor;
  final Color? disabledNoneColor;

  final VoidCallback onPressed;
  final AdaptivePulldownMenuItem<T> item;

  final SelectionType selectionType;

  static const EdgeInsets _insetPadding = EdgeInsets.all(15.0);

  @override
  Widget build(BuildContext context) {
    final isSingleSelection = selectionType == SelectionType.single;

    if (isSingleSelection) {
      final highlightBackgroundColor = enabled
          ? (highlightColor ?? CupertinoColors.secondarySystemFill)
          : null;

      return CupertinoListTile(
        onTap: onPressed,
        title: item.child,
        leading: item.leading,
        trailing: item.trailing,
        padding: _insetPadding,
        backgroundColor: highlightBackgroundColor,
      );
    }

    return CupertinoListTile(
      title: item.child,
      leading: item.leading,
      trailing: item.trailing,
      onTap: enabled ? onPressed : null,
      padding: _insetPadding,
      backgroundColor: enabled
          ? Colors.transparent
          : (disabledNoneColor ?? CupertinoColors.placeholderText),
    );
  }
}

class PulldownMenuIOSProperty extends CoreIOSProperty {
  const PulldownMenuIOSProperty({
    this.cancelButtonLabel,
    this.disabledNoneColor,
  });

  final Color? disabledNoneColor;
  final String? cancelButtonLabel;
}
