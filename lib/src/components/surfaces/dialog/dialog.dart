import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';

/// A custom dialog widget that adapts its appearance based on the platform.
///
/// Use this widget to create list Tiles with platform-specific
/// styling and behavior:
/// - On macOS, [MacosAlertDialog] is utilized.
/// - On Windows, [ContentDialog] is used.
///
/// See also:
/// * [showAdpDialog]: A function to display an adaptive platform-specific dialog.
class AdaptiveDialog extends CoreAdaptiveComponent {
  /// Creates an adaptive dialog.
  ///
  /// The [primary] parameter is required and represents the main button of the bottom sheet.
  ///
  /// Example:
  /// ```dart
  /// showAdpDialog(
  ///   context: context,
  ///   child: AdaptiveDialog(
  ///     title: Text(DummyText.generateQuestion),
  ///     content: Text(DummyText.generateAnswer),
  ///     primary: AdaptiveFlatButton(
  ///       child: const Text('Yes'),
  ///       onPressed: () {
  ///         // Handle 'Yes' button press
  ///         Navigator.pop(context);
  ///       },
  ///     ),
  ///     secondary: AdaptiveFlatButton(
  ///       child: const Text('No'),
  ///       onPressed: () {
  ///         // Handle 'No' button press
  ///         Navigator.pop(context);
  ///       },
  ///     ),
  ///   ),
  /// );
  /// ```
  const AdaptiveDialog({
    super.key,
    super.builders,
    super.properties,
    this.title,
    this.content,
    this.actions,
  });

  /// The title of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// The content of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget? content;

  /// The list of bottom widgets,  of the dialog.
  ///
  /// Typically a [AdaptiveDialogAction] widget.
  final List<Widget>? actions;

  @override
  Widget android(BuildContext context, [property]) {
    return AlertDialog(title: title, content: content, actions: actions);
  }

  @override
  Widget iOS(BuildContext context, [property]) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions != null ? actions! : const [],
    );
  }
}

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
      onPressed: onPressed,
      textStyle: textStyle,
      child: child,
    );
  }
}
