import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/properties.dart';
import 'base_button.dart';

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
    super.onTapUp,
    super.onTapDown,
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
    super.onTapUp,
    super.onTapDown,
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
    super.onTapUp,
    super.onTapDown,
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
        return ElevatedButton(onPressed: onPressed, child: child);
      case AdaptiveButtonType.filled:
        return FilledButton(onPressed: onPressed, child: child);
      case AdaptiveButtonType.outlined:
        return OutlinedButton(onPressed: onPressed, child: child);
    }
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    switch (_type) {
      case AdaptiveButtonType.base:
        return CupertinoButton(onPressed: onPressed, child: child);
      case AdaptiveButtonType.filled:
        return CupertinoButton.filled(onPressed: onPressed, child: child);
      case AdaptiveButtonType.outlined:
        return CupertinoButton(onPressed: onPressed, child: child);
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
