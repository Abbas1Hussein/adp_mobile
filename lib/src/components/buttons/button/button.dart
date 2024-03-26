import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/properties.dart';
import '../../../core/extension/brightness.dart';
import 'base_button.dart';
import 'iOS.dart';

/// Buttons are essential UI elements that allow users to interact with your app by triggering actions, making choices, searching information,
/// and more. They can be placed anywhere within your user interface, including dialogs, forms, cards, toolbars, etc.
///
/// This `AdaptiveButton` widget provides three versatile styles to match your app's design:
///
/// * [Base], A standard adaptive button with a platform-specific appearance.
/// * [Filled], A filled adaptive button with a colored background, suitable for primary actions.
/// * [Outlined], An outlined adaptive button with a border, often used for secondary actions or those requiring less emphasis.
class AdaptiveButton extends AdaptiveBaseButton {
  /// Creates an instance of [AdaptiveButton] with the base type.
  const AdaptiveButton({
    super.builders,
    super.key,
    super.shape,
    super.onLongPress,
    super.hoverColor,
    super.pressedColor,
    super.disabledColor,
    super.backgroundColor,
    super.mouseCursor,
    required super.child,
    required super.onPressed,
  }) : _type = _AdaptiveButtonTypes.base;

  /// Creates an instance of [AdaptiveButton] with the filled type.
  const AdaptiveButton.filled({
    super.builders,
    super.key,
    super.shape,
    super.onLongPress,
    super.hoverColor,
    super.pressedColor,
    super.disabledColor,
    super.backgroundColor,
    super.mouseCursor,
    required super.child,
    required super.onPressed,
  }) : _type = _AdaptiveButtonTypes.filled;

  /// Creates an instance of [AdaptiveButton] with the outlined type.
  const AdaptiveButton.outlined({
    super.builders,
    super.key,
    super.shape,
    super.onLongPress,
    super.hoverColor,
    super.pressedColor,
    super.disabledColor,
    super.backgroundColor,
    super.mouseCursor,
    required super.child,
    required super.onPressed,
  }) : _type = _AdaptiveButtonTypes.outlined;

  /// The type of the adaptive button, determining its visual style.
  final _AdaptiveButtonTypes _type;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    switch (_type) {
      case _AdaptiveButtonTypes.base:
        return ElevatedButton(
          style: androidDefaultStyle(),
          onLongPress: onLongPress,
          onPressed: onPressed,
          child: child,
        );
      case _AdaptiveButtonTypes.filled:
        return FilledButton(
          style: androidDefaultStyle(),
          onLongPress: onLongPress,
          onPressed: onPressed,
          child: child,
        );
      case _AdaptiveButtonTypes.outlined:
        return OutlinedButton(
          style: androidDefaultStyle(),
          onLongPress: onLongPress,
          onPressed: onPressed,
          child: child,
        );
    }
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    final theme = CupertinoTheme.of(context);
    switch (_type) {
      case _AdaptiveButtonTypes.base:
        return IOSButton(
          shape: shape,
          onPressed: onPressed,
          hoverColor: hoverColor,
          mouseCursor: mouseCursor,
          onLongPress: onLongPress,
          pressedColor: pressedColor ?? CupertinoColors.systemFill,
          disabledColor: disabledColor,
          backgroundColor: backgroundColor,
          child: child,
        );
      case _AdaptiveButtonTypes.filled:
        return IOSButton(
          pressedOpacity: 0.45,
          shape: shape,
          onPressed: onPressed,
          onLongPress: onLongPress,
          mouseCursor: mouseCursor,
          disabledColor: disabledColor ?? CupertinoColors.secondaryLabel,
          backgroundColor: backgroundColor ?? theme.primaryColor,
          pressedColor: pressedColor,
          hoverColor: hoverColor,
          child: DefaultTextStyle.merge(
            style: theme.textTheme.textStyle.copyWith(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.white,
                context,
              ),
            ),
            child: child,
          ),
        );
      case _AdaptiveButtonTypes.outlined:
        return IOSButton(
          pressedOpacity: 0.45,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: theme.primaryColor,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
          onPressed: onPressed,
          onLongPress: onLongPress,
          mouseCursor: mouseCursor,
          disabledColor: disabledColor,
          backgroundColor: backgroundColor ?? Colors.transparent,
          pressedColor: pressedColor,
          hoverColor: hoverColor,
          child: DefaultTextStyle(
            style: theme.textTheme.textStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: shape?.side.color ?? theme.primaryColor,
            ),
            child: child,
          ),
        );
    }
  }
}

/// different types of [AdaptiveButton] variants.
enum _AdaptiveButtonTypes {
  /// Standard adaptive button style.
  base,

  /// Filled adaptive button with colored background.
  filled,

  /// Outlined adaptive button with border.
  outlined,
}
