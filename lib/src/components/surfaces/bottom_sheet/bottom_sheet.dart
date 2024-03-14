import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';

/// A modal dialog that’s attached to a particular window and prevents further
/// interaction with the window until the sheet is dismissed,
/// can be displayed on both iOS and android.
///
/// See also:
///
/// * [showAdpBottomSheet] A function to display an adaptive platform-specific bottom sheet.
class AdaptiveBottomSheet extends CoreAdaptiveComponent {
  /// Creates an adaptive bottom sheet.
  ///
  /// The [content] parameter is required and represents the main content of the bottom sheet.
  const AdaptiveBottomSheet({
    super.key,
    super.builders,
    this.title,
    this.titleTextStyle,
    this.titlePadding,
    this.contentTextStyle,
    this.contentPadding,
    this.actions,
    this.actionsPadding,
    this.actionsTextStyle,
    required this.content,
  });

  /// The title of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Style for the text in the [title] of this [AdaptiveBottomSheet].
  final TextStyle? titleTextStyle;

  /// Padding around the title.
  ///
  /// If there is no title, no padding will be provided. Otherwise, this padding
  /// is used.
  final EdgeInsetsGeometry? titlePadding;

  /// The content of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget content;

  /// Style for the text in the [content] of this [AlertDialog].
  final TextStyle? contentTextStyle;

  /// Padding around the content.
  ///
  /// If there is no [content], no padding will be provided. Otherwise, this
  /// padding is used.
  final EdgeInsetsGeometry? contentPadding;

  /// The set of actions that are displayed for the user to select.
  ///
  /// Typically this is a list of [AdaptiveBottomSheetAction] widgets.
  final List<Widget>? actions;

  /// Padding around the set of [actions] at the bottom of the bottom sheet.
  ///
  /// Typically used to provide padding to the button bar between the button bar
  /// and the edges of the dialog.
  ///
  /// The [buttonPadding] may contribute to the padding on the edges of
  /// [actions] as well.
  ///
  /// If there are no [actions], then no padding will be included.
  final EdgeInsetsGeometry? actionsPadding;

  /// Style for the text in the [content] of this [AlertDialog].
  final TextStyle? actionsTextStyle;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle.merge(
                style: titleTextStyle ??
                    Theme.of(context).textTheme.titleSmall,
                child: title!,
              ),
            ),
            Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle.merge(
                style: contentTextStyle ??
                    Theme.of(context).textTheme.bodySmall,
                child: SingleChildScrollView(child: content),
              ),
            ),
          ),
          if (actions != null && actions!.isNotEmpty)
            if (actions!.length <= 2)
              Row(
                children: actions!.map(
                  (child) {
                    return Expanded(
                      child: Padding(
                        padding: actionsPadding ?? const EdgeInsets.all(4.0),
                        child: DefaultTextStyle.merge(
                          style: actionsTextStyle,
                          child: child,
                        ),
                      ),
                    );
                  },
                ).toList(),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: actions!.map(
                  (child) {
                    return Padding(
                      padding: actionsPadding ?? const EdgeInsets.all(4.0),
                      child: DefaultTextStyle.merge(
                        style: actionsTextStyle,
                        child: child,
                      ),
                    );
                  },
                ).toList(),
              ),
        ],
      ),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoActionSheet(
      title: title != null
          ? DefaultTextStyle.merge(style: titleTextStyle, child: title!)
          : null,
      message: DefaultTextStyle.merge(
        style: contentTextStyle,
        child: content,
      ),
      actions: actions
          ?.map(
            (child) => Padding(
              padding: actionsPadding ?? EdgeInsets.zero,
              child: DefaultTextStyle.merge(
                style: actionsTextStyle,
                child: child,
              ),
            ),
          )
          .toList(),
    );
  }
}

class AdaptiveBottomSheetAction extends CoreAdaptiveComponent {
  const AdaptiveBottomSheetAction({
    super.key,
    this.textStyle,
    required this.onPressed,
    required this.child,
  });

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// The callback that is called when the button is tapped or otherwise
  /// activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback onPressed;

  /// [TextStyle] to apply to any text that appears in this button.
  final TextStyle? textStyle;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return OutlinedButton(
      onPressed: onPressed,
      child: DefaultTextStyle.merge(style: textStyle, child: child),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoActionSheetAction(
      onPressed: onPressed,
      child: DefaultTextStyle.merge(style: textStyle, child: child),
    );
  }
}
