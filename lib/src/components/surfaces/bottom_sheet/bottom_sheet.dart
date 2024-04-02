import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A modal dialog that’s attached to a particular window and prevents further
/// interaction with the window until the sheet is dismissed,
/// can be displayed on both iOS and android.
///
/// See also:
///
/// * [showAdpBottomSheet] A function to display an adaptive platform-specific bottom sheet.
class AdaptiveBottomSheet extends CoreAdaptiveComponent<
    BottomSheetAndroidProperty, BottomSheetIOSProperty> {
  /// Creates an adaptive bottom sheet.
  ///
  /// The [content] parameter is required and represents the main content of the bottom sheet.
  const AdaptiveBottomSheet({
    super.key,
    super.builders,
    super.properties,
    this.title,
    this.titleTextStyle,
    this.titlePadding,
    this.contentTextStyle,
    this.contentPadding,
    this.contentScrollController,
    this.actions,
    this.actionsPadding,
    this.actionsTextStyle,
    this.actionScrollController,
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

  /// Style for the text in the [content] of this [AdaptiveBottomSheet].
  final TextStyle? contentTextStyle;

  /// Padding around the content.
  ///
  /// If there is no [content], no padding will be provided. Otherwise, this
  /// padding is used.
  final EdgeInsetsGeometry? contentPadding;

  /// A scroll controller that can be used to control the scrolling of the
  /// [content] in the action sheet.
  ///
  /// This attribute is typically not needed, as alert messages should be
  /// short.
  final ScrollController? contentScrollController;

  /// The set of actions that are displayed for the user to select.
  ///
  /// Typically this is a list of [AdaptiveBottomSheetAction] widgets.
  final List<Widget>? actions;

  /// Style for the text in the [content] of this [AdaptiveBottomSheet].
  final TextStyle? actionsTextStyle;

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

  /// A scroll controller that can be used to control the scrolling of the
  /// [actions] in the action sheet.
  ///
  /// This attribute is typically not needed.
  final ScrollController? actionScrollController;

  @override
  Widget android(BuildContext context, [BottomSheetAndroidProperty? property]) {
    return BottomSheetAndroid(
      title: title,
      content: content,
      actions: actions,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
      contentPadding: contentPadding,
      actionsPadding: actionsPadding,
      actionsTextStyle: actionsTextStyle,
      contentTextStyle: contentTextStyle,
      contentScrollController: contentScrollController,
      actionScrollController: actionScrollController,
    );
  }

  @override
  Widget iOS(BuildContext context, [BottomSheetIOSProperty? property]) {
    return BottomSheetIOS(
      title: title,
      content: content,
      actions: actions,
      property: property,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
      contentPadding: contentPadding,
      actionsPadding: actionsPadding,
      actionsTextStyle: actionsTextStyle,
      contentTextStyle: contentTextStyle,
      contentScrollController: contentScrollController,
      actionScrollController: actionScrollController,
    );
  }
}

class AdaptiveBottomSheetAction extends CoreAdaptiveComponent {
  const AdaptiveBottomSheetAction({
    super.key,
    this.textStyle,
    required this.onPressed,
    required this.child,
  }) : canceled = false;

  /// This will displayed on Android only.
  ///
  /// Always will skipped on iOS (will use native cancel iOS).
  const AdaptiveBottomSheetAction.skipCancel({
    super.key,
    this.textStyle,
    required this.onPressed,
    required this.child,
  }) : canceled = true;
  final bool canceled;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// [TextStyle] to apply to any text that appears in this button.
  final TextStyle? textStyle;

  /// The callback that is called when the button is tapped or otherwise
  /// activated.
  final VoidCallback onPressed;

  @override
  Widget android(BuildContext context,
      [CoreAndroidProperty? property, bool useTextButton = false]) {
    if (Theme.of(context).useMaterial3 && useTextButton) {
      return TextButton(
        onPressed: onPressed,
        child: DefaultTextStyle.merge(style: textStyle, child: child),
      );
    }
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
