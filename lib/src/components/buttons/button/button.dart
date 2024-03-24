import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/properties.dart';
import '../../../core/extension/brightness.dart';
import 'base_button.dart';
import 'iOS.dart';

/// Buttons are the graphical control element that provides a user to trigger an event such as taking actions, making choices, searching things, and many more.
/// They can be placed anywhere in our UI like dialogs, forms, cards, toolbars, etc.
///
/// This widget provides three variants:
/// - [AdaptiveButtonType.base]: A standard adaptive button.
/// - [AdaptiveButtonType.filled]: A filled adaptive colored button.
/// - [AdaptiveButtonType.outlined]: An outlined adaptive button with a border.
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
  }) : _type = AdaptiveButtonType.base;

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
  }) : _type = AdaptiveButtonType.filled;

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
  }) : _type = AdaptiveButtonType.outlined;

  /// The type of the adaptive button, determining its visual style.
  final AdaptiveButtonType _type;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    switch (_type) {
      case AdaptiveButtonType.base:
        return ElevatedButton(
          style: androidDefaultStyle(),
          onLongPress: onLongPress,
          onPressed: onPressed,
          child: child,
        );
      case AdaptiveButtonType.filled:
        return FilledButton(
          style: androidDefaultStyle(),
          onLongPress: onLongPress,
          onPressed: onPressed,
          child: child,
        );
      case AdaptiveButtonType.outlined:
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
      case AdaptiveButtonType.base:
        return IOSButton(
          pressedOpacity: 0.95,
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
      case AdaptiveButtonType.filled:
        return IOSButton(
          pressedOpacity: 0.85,
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
      case AdaptiveButtonType.outlined:
        return IOSButton(
          pressedOpacity: 0.75,
          shape: shape ??
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    width: 1,
                    color: CupertinoTheme.brightnessOf(context).resolve(
                      lightColor: CupertinoColors.black,
                      darkColor: CupertinoColors.extraLightBackgroundGray,
                    ),
                    strokeAlign: BorderSide.strokeAlignOutside,
                  )),
          onPressed: onPressed,
          onLongPress: onLongPress,
          mouseCursor: mouseCursor,
          disabledColor: disabledColor,
          backgroundColor: backgroundColor ?? Colors.transparent,
          pressedColor: pressedColor,
          hoverColor: hoverColor,
          child: DefaultTextStyle(
            style: theme.textTheme.textStyle.copyWith(
              color: shape?.side.color,
              fontWeight: FontWeight.w500,
            ),
            child: child,
          ),
        );
    }
  }
}

/// different types of [AdaptiveButton] variants.
enum AdaptiveButtonType {
  /// The base type represents a standard adaptive button.
  base,

  /// The filled type represents a filled adaptive button with colored styling.
  filled,

  /// The outlined type represents an outlined adaptive button with a border.
  outlined,
}
