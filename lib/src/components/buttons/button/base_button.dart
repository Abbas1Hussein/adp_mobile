import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';

abstract class AdaptiveBaseButton extends CoreAdaptiveComponent {
  const AdaptiveBaseButton({
    super.builders,
    super.key,
    this.shape,
    this.onLongPress,
    this.hoverColor,
    this.pressedColor,
    this.disabledColor,
    this.backgroundColor,
    this.mouseCursor = SystemMouseCursors.click,
    required this.child,
    required this.onPressed,
  });

  /// The child widget to be displayed within the button.
  final Widget child;

  /// The color of the button when it is being hovered over by the mouse.
  final Color? hoverColor;

  /// The color of the button when it is being pressed.
  final Color? pressedColor;

  /// The background color of the button in its normal state.
  final Color? backgroundColor;

  /// The background color of the button when it is disabled.
  final Color? disabledColor;

  final OutlinedBorder? shape;

  /// The mouse cursor to use when hovering over this widget.
  final MouseCursor mouseCursor;

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this callback, [onLongPress], [onTapDown], and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  ///
  /// If this callback, [onPressed], [onTapDown] and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  /// Whether the button is enabled or disabled. Buttons are disabled by default. To
  /// enable a button, set its [onPressed] property to a non-null value.
  bool get enabled => onPressed != null || onLongPress != null;

  ButtonStyle androidDefaultStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all(shape),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return forStates(
            states,
            pressed: pressedColor,
            hovering: hoverColor,
            disabled: disabledColor,
            none: backgroundColor,
          );
        },
      ),
    );
  }
}

T forStates<T>(
  Set<MaterialState> states, {
  required T disabled,
  required T none,
  T? pressed,
  T? hovering,
  T? focused,
}) {
  if (states.contains(MaterialState.disabled)) return disabled;
  if (pressed != null && states.contains(MaterialState.pressed)) {
    return pressed;
  }
  if (hovering != null && states.contains(MaterialState.hovered)) {
    return hovering;
  }
  if (states.contains(MaterialState.focused)) {
    return focused ?? pressed ?? none;
  }

  return none;
}
