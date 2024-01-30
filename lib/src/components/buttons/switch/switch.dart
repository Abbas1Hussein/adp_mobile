import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';
import '../../../core/extension/widget.dart';

/// The switch represents a physical switch that allows users to turn
/// things on or off, like a light switch. Use switch controls to present
/// users with two mutually exclusive options (such as on/off), where choosing
/// an option provides immediate results.
///
/// Use a switch for binary operations that take effect right after the
/// user flips the switch,Think of the switch as a physical power switch for a device: you flip
/// it on or off when you want to enable or disable the action performed by the device.
///
/// Use this widget to create switch buttons with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoSwitch] is utilized.
/// - On Android, [Switch] is used.
class AdaptiveSwitch extends CoreAdaptiveComponent {
  /// Creates a adp-style switch.
  ///
  /// See also:
  ///
  ///  * [AdaptiveCheckbox], which let the user select multiple items from a collection of
  ///    two or more items
  ///  * [AdaptiveRadio], which let the user select one item from a collection of two
  ///    or more options
  const AdaptiveSwitch({
    super.key,
    super.builders,
    this.label,
    this.focusColor,
    this.focusNode,
    this.autofocus = true,
    this.onFocusChange,
    this.foregroundColor,
    this.activeKnobColor,
    this.inactiveKnobColor,
    this.activeColor,
    this.inactiveColor,
    this.dragStartBehavior = DragStartBehavior.start,
    this.onChanged,
    required this.value,
  });

  /// the current state of the switch: true for "on" and false for "off".
  final bool value;

  /// Callback function triggered when the switch state changes.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch with the new
  /// value.
  ///
  /// if null, the switch button will be displayed as disabled.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// AdaptiveSwitch(
  ///   value: _currentValue,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _currentValue = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool>? onChanged;

  /// The label of the radio button.
  ///
  /// This, if non-null, is displayed at the right of the switcher,
  /// and is affected by user touch.
  ///
  /// Usually a [Text] or [Icon] widget
  final Widget? label;

  /// Background color of the switch when it is in the `on` state.
  final Color? activeColor;

  /// Color of the switch knob when it is in the `on` state.
  final Color? activeKnobColor;

  /// Background color of the switch when it is in the `off` state.
  final Color? inactiveColor;

  /// Color of the switch knob when it is in the `off` state.
  final Color? inactiveKnobColor;

  /// The color of the radio button's [label].
  final Color? foregroundColor;

  /// The color to use for the focus highlight for keyboard interactions.
  ///
  /// Defaults to a slightly transparent [activeColor].
  final Color? focusColor;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.material.inkwell.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.cupertino.CupertinoSwitch.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  bool get _enabled => onChanged != null;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    final buildLabel = label != null
        ? GestureDetector(
            onTap: _enabled ? () => onChanged?.call(!value) : null,
            child: IconTheme.merge(
              data: IconTheme.of(context).copyWith(color: foregroundColor),
              child: DefaultTextStyle.merge(
                style: Theme.of(context)
                    .typography
                    .dense
                    .titleLarge!
                    .copyWith(color: foregroundColor),
                child: label!,
              ),
            ),
          )
        : null;
    return Switch(
      value: value,
      activeColor: activeColor,
      inactiveTrackColor: inactiveColor,
      thumbColor: MaterialStateProperty.all(
        value ? activeKnobColor : inactiveKnobColor,
      ),
      autofocus: autofocus,
      onChanged: onChanged,
      focusNode: focusNode,
      focusColor: focusColor,
      onFocusChange: onFocusChange,
      dragStartBehavior: dragStartBehavior,
    ).margeWith(buildLabel);
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    final knobColor = value ? activeKnobColor : inactiveKnobColor;

    final buildLabel = label != null
        ? GestureDetector(
            onTap: _enabled ? () => onChanged?.call(!value) : null,
            child: IconTheme.merge(
              data: IconTheme.of(context).copyWith(color: foregroundColor),
              child: DefaultTextStyle.merge(
                style: Theme.of(context)
                    .typography
                    .dense
                    .headlineMedium!
                    .copyWith(color: foregroundColor, fontWeight: FontWeight.w400),
                child: label!,
              ),
            ),
          )
        : null;
    return CupertinoSwitch(
      value: value,
      thumbColor: knobColor,
      trackColor: inactiveColor,
      activeColor: activeColor,
      autofocus: autofocus,
      onChanged: onChanged,
      focusNode: focusNode,
      focusColor: focusColor,
      onFocusChange: onFocusChange,
      dragStartBehavior: dragStartBehavior,
    ).margeWith(buildLabel, 8.0);
  }
}
