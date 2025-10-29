import 'dart:ui';

import 'package:adp_mobile/src/components/surfaces/surfaces.dart';

import '../../../../core/common/construct/property.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetIOS extends StatelessWidget {
  const BottomSheetIOS({
    super.key,
    this.property,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.contentPadding,
    this.contentTextStyle,
    this.contentScrollController,
    required this.content,
    this.actions,
    this.actionsPadding,
    this.actionsTextStyle,
    this.actionScrollController,
  });

  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;
  final Widget content;
  final ScrollController? contentScrollController;
  final ScrollController? actionScrollController;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? actionsPadding;
  final TextStyle? actionsTextStyle;

  final BottomSheetIOSProperty? property;

  @override
  Widget build(BuildContext context) {
    final actions = this.actions?.where((value) {
      if (value is AdaptiveBottomSheetAction) {
        return !value.canceled;
      }
      return false;
    });

    return CupertinoActionSheet(
      title: title != null
          ? Padding(
              padding: titlePadding ?? EdgeInsets.zero,
              child:
                  DefaultTextStyle.merge(style: titleTextStyle, child: title!),
            )
          : null,
      message: Padding(
        padding: contentPadding ?? EdgeInsets.zero,
        child: DefaultTextStyle.merge(style: contentTextStyle, child: content),
      ),
      messageScrollController: contentScrollController,
      cancelButton: property?.cancelButton ??
          CupertinoActionSheetAction(
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
            onPressed: () => Navigator.maybePop(context),
          ),
      actionScrollController: actionScrollController,
      actions: actions?.map(
        (child) {
          return Padding(
            padding: actionsPadding ?? EdgeInsets.zero,
            child: DefaultTextStyle.merge(
              style: actionsTextStyle,
              child: child,
            ),
          );
        },
      ).toList(),
    );
  }
}

class BottomSheetIOSProperty extends CoreIOSProperty {
  const BottomSheetIOSProperty({this.cancelButton, this.filter});

  final ImageFilter? filter;

  /// The optional cancel button that is grouped separately from the other
  /// actions.
  ///
  /// Typically this is an [CupertinoActionSheetAction] widget.
  final Widget? cancelButton;
}
