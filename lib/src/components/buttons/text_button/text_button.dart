import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/property.dart';
import '../../../core/extension/widget.dart';
import '../button/base_button.dart';
import '../button/iOS.dart';

/// A borderless button with mainly text-based content
///
/// See also:
///
/// * [AdaptiveButtonType.base] A standard adaptive button.
/// * [AdaptiveButtonType.filled] A filled adaptive colored button.
/// * [AdaptiveButtonType.outlined] An outlined adaptive button with a border.
///
/// Use this widget to create text buttons with platform-specific
/// styling and behavior:
/// - On iOS, [IOSButton] is utilized.
/// - On Android, [TextButton] is used.
class AdaptiveTextButton extends AdaptiveBaseButton {
  const AdaptiveTextButton({
    super.key,
    super.builders,
    super.shape,
    super.onLongPress,
    super.hoverColor,
    super.pressedColor,
    super.disabledColor,
    super.backgroundColor,
    super.mouseCursor,
    required super.onPressed,
    required super.child,
  })  : label = null,
        icon = null;

  /// Create a text button from a pair of widgets that serve as the button's
  /// [icon] and [label].
  ///
  /// The icon and label are arranged in a row and padded by 8 logical pixels
  /// at the ends, with an 8 pixel gap in between.
  const AdaptiveTextButton.icon({
    super.key,
    super.builders,
    super.shape,
    super.onLongPress,
    super.hoverColor,
    super.pressedColor,
    super.disabledColor,
    super.backgroundColor,
    super.mouseCursor,
    required super.onPressed,
    required Widget this.label,
    required Widget this.icon,
  }) : super(child: label);

  final Widget? label;
  final Widget? icon;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return TextButton(
      style: androidDefaultStyle(),
      onLongPress: onLongPress,
      onPressed: onPressed,
      child: child.margeWith(icon, 8.0),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    final theme = CupertinoTheme.of(context);
    return IOSButton(
      pressedOpacity: 0.6,
      shape: shape,
      onPressed: onPressed,
      mouseCursor: mouseCursor,
      onLongPress: onLongPress,
      hoverColor: hoverColor ?? Colors.transparent,
      pressedColor: pressedColor ?? CupertinoColors.quaternaryLabel,
      disabledColor: disabledColor,
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.all(2.0),
      child: DefaultTextStyle.merge(
        style: theme.textTheme.textStyle.copyWith(
          letterSpacing: 0.5,
          color: theme.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        child: child.margeWith(icon, 8.0),
      ),
    );
  }
}
