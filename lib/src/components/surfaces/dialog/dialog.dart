import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A custom dialog widget that adapts its appearance based on the platform.
///
/// Use this widget to create dialog with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoAlertDialog] is utilized.
/// - On Android, [AlertDialog] is used.
///
/// See also:
/// * [showAdpDialog], A function to display an adaptive platform-specific dialog.
/// * [DialogPresenter], A utility class for presenting different types of adaptive dialogs.
/// * [AdaptiveDialogAction], which is an adp-style dialog button.
class AdaptiveDialog
    extends CoreAdaptiveComponent<DialogAndroidProperty, DialogIOSProperty> {
  /// Creates an adp dialog-Style.
  ///
  /// Typically used in conjunction with [showAdpDialog].
  ///
  /// The [titlePadding] and [contentPadding] default to null, which implies a
  /// default that depends on the values of the other properties.
  const AdaptiveDialog({
    super.key,
    super.builders,
    super.properties,
    this.title,
    this.titleTextStyle,
    this.titlePadding,
    this.content,
    this.contentTextStyle,
    this.contentPadding,
    this.actions,
    this.actionsPadding,
  });

  /// The title of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Style for the text in the [title] of this [AlertDialog].
  ///
  /// If null, [DialogTheme.titleTextStyle] is used. If that's null, defaults to
  /// [TextTheme.titleLarge] of [ThemeData.textTheme].
  final TextStyle? titleTextStyle;

  /// Padding around the title.
  ///
  /// If there is no title, no padding will be provided. Otherwise, this padding
  /// is used.
  ///
  /// This property defaults to providing 24 pixels on the top, left, and right
  /// of the title. If the [content] is not null, then no bottom padding is
  /// provided (but see [contentPadding]). If it _is_ null, then an extra 20
  /// pixels of bottom padding is added to separate the [title] from the
  /// [actions].
  final EdgeInsetsGeometry? titlePadding;

  /// The content of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget? content;

  /// Padding around the content.
  ///
  /// If there is no [content], no padding will be provided. Otherwise, this
  /// padding is used.
  ///
  /// This property defaults to providing a padding of 20 pixels above the
  /// [content] to separate the [content] from the [title], and 24 pixels on the
  /// left, right, and bottom to separate the [content] from the other edges of
  /// the dialog.
  ///
  /// If [ThemeData.useMaterial3] is true, the top padding separating the
  /// content from the title defaults to 16 pixels instead of 20 pixels.
  final EdgeInsetsGeometry? contentPadding;

  /// Style for the text in the [content] of this [AlertDialog].
  ///
  /// If null, [DialogTheme.contentTextStyle] is used. If that's null, defaults
  /// to [TextTheme.titleMedium] of [ThemeData.textTheme].
  final TextStyle? contentTextStyle;

  /// The list of bottom widgets,  of the dialog.
  ///
  /// Typically a [AdaptiveDialogAction] widget.
  final List<Widget>? actions;

  /// Padding around the set of [actions] at the bottom of the dialog.
  ///
  /// Typically used to provide padding to the button bar between the button bar
  /// and the edges of the dialog.
  ///
  /// The [buttonPadding] may contribute to the padding on the edges of
  /// [actions] as well.
  ///
  /// If there are no [actions], then no padding will be included.
  ///
  /// {@tool snippet}
  /// This is an example of a set of actions aligned with the content widget.
  /// ```dart
  /// AlertDialog(
  ///   title: const Text('Title'),
  ///   content: Container(width: 200, height: 200, color: Colors.green),
  ///   actions: <Widget>[
  ///     ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
  ///     ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
  ///   ],
  ///   actionsPadding: const EdgeInsets.symmetric(horizontal: 8.0),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  final EdgeInsetsGeometry? actionsPadding;

  @override
  Widget android(BuildContext context, [DialogAndroidProperty? property]) {
    return AlertDialog(
      title: title,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
      content: content,
      contentPadding: contentPadding,
      contentTextStyle: contentTextStyle,
      actions: actions,
      actionsPadding: actionsPadding,
      scrollable: property?.scrollable ?? false,
      clipBehavior: property?.clipBehavior ?? Clip.none,
      backgroundColor: property?.backgroundColor,
      shape: property?.shape,
      alignment: property?.alignment,
      icon: property?.icon,
      elevation: property?.elevation,
      semanticLabel: property?.semanticLabel,
      insetPadding: property?.insetPadding ?? defaultInsetPadding,
      surfaceTintColor: property?.surfaceTintColor,
      shadowColor: property?.shadowColor,
      actionsAlignment: property?.actionsAlignment,
      actionsOverflowAlignment: property?.actionsOverflowAlignment,
      actionsOverflowButtonSpacing: property?.actionsOverflowButtonSpacing,
      actionsOverflowDirection: property?.actionsOverflowDirection,
      buttonPadding: property?.buttonPadding,
      iconColor: property?.iconColor,
      iconPadding: property?.iconPadding,
    );
  }

  @override
  Widget iOS(BuildContext context, [DialogIOSProperty? property]) {
    final buildTitle = title != null
        ? Padding(
            padding: titlePadding ?? EdgeInsets.zero,
            child: DefaultTextStyle.merge(
              style: titleTextStyle,
              child: title!,
            ),
          )
        : null;
    final buildContent = content != null
        ? Padding(
            padding: contentPadding ?? EdgeInsets.zero,
            child: DefaultTextStyle.merge(
              style: contentTextStyle,
              child: content!,
            ),
          )
        : null;

    final List<Widget> buildAction = actions != null
        ? actions!.map(
            (e) {
              return Padding(
                  padding: actionsPadding ?? EdgeInsets.zero, child: e);
            },
          ).toList()
        : const [];
    return CupertinoAlertDialog(
      title: buildTitle,
      content: buildContent,
      actions: buildAction,
      scrollController: property?.scrollController,
      actionScrollController: property?.actionScrollController,
      insetAnimationCurve: property?.insetAnimationCurve ?? Curves.decelerate,
      insetAnimationDuration:
          property?.insetAnimationDuration ?? const Duration(milliseconds: 100),
    );
  }
}

/// A action button used in [AdaptiveDialog] widget that adapts its appearance based on the platform.
///
/// Use this widget to create custom dialog action button with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoDialogAction] is utilized.
/// - On Android, [TextButton] is used.
class AdaptiveDialogAction extends CoreAdaptiveComponent {
  const AdaptiveDialogAction({
    super.key,
    super.builders,
    this.textStyle,
    this.onPressed,
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
  final VoidCallback? onPressed;

  /// [TextStyle] to apply to any text that appears in this button.
  final TextStyle? textStyle;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return TextButton(
      onPressed: onPressed,
      child: DefaultTextStyle.merge(style: textStyle, child: child),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoDialogAction(
        onPressed: onPressed, textStyle: textStyle, child: child);
  }
}
