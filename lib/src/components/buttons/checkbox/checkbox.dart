import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';

/// A checkbox is a type of button that lets the user choose between
/// two opposite states, actions, or values. A selected checkbox is
/// considered on when it contains a checkmark and off when it's empty.
/// A checkbox is almost always followed by a title unless it appears in
/// a checklist.
///
/// Use this widget to create checkbox buttons with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoCheckbox] is utilized.
/// - On Android, [Checkbox] is used.
class AdaptiveCheckbox extends CoreAdaptiveComponent {
  /// Creates a adp-style checkbox.
  ///
  /// See also:
  ///
  /// * [AdaptiveRadioButton], let users select one option from a collection of two or more mutually exclusive, visible options.
  const AdaptiveCheckbox({
    super.key,
    super.builders,
    this.side,
    this.label,
    this.shape,
    this.activeColor,
    this.inactiveColor,
    this.autofocus = false,
    this.checkColor,
    this.focusColor,
    this.focusNode,
    required this.value,
    required this.onChanged,
  });

  /// The current value of the AdaptiveCheckbox (true for checked, false for unchecked).
  ///
  /// - If `null`, the checkbox is in its third state.
  final bool? value;

  /// Called when the value of the checkbox should change.
  ///
  /// The checkbox passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the checkbox with the new
  /// value.
  ///
  /// If this callback is null, the checkbox will be displayed as disabled
  /// and will not respond to input gestures.
  ///
  /// When the checkbox is tapped, if [value] is null (the default) then
  /// the [onChanged] callback will be applied to `!value`. If [value] is
  /// true this callback cycle from false to true to null and back to false
  /// again.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// AdaptiveCheckbox(
  ///   value: _throwShotAway,
  ///   onChanged: (bool? newValue) {
  ///     setState(() {
  ///       _throwShotAway = newValue!;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool>? onChanged;

  /// The label of the adp checkbox button.
  ///
  /// This, if non-null, is displayed at the right of the checkbox,
  /// and is affected by user touch.
  ///
  /// Usually a [Text].
  final Widget? label;

  /// The color to use when this checkbox is checked.
  final Color? activeColor;

  /// The color used if the checkbox is inactive and disabled.
  final Color? inactiveColor;

  /// The color to use for the check icon when this checkbox is checked.
  final Color? checkColor;

  /// The color for the checkbox border shadow when it has the input focus.
  final Color? focusColor;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// The color and width of the checkbox border.
  final BorderSide? side;

  /// The shape of the checkbox.
  ///
  /// If this property is null then the shape defaults to a
  /// [RoundedRectangleBorder] with a circular corner radius of 4.0.
  final OutlinedBorder? shape;

  /// if onChanged callback is not null, indicating that the checkbox is enabled.
  bool get isEnabled => onChanged != null;

  /// if the value of the checkbox is null, indicating it's in a tri-state mode.
  bool get isTriState => value == null;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    final theme = Theme.of(context);

    return Checkbox(
      side: side ??
          (inactiveColor != null ? BorderSide(color: inactiveColor!) : null),
      shape: shape,
      value: value,
      tristate: isTriState,
      focusColor: focusColor,
      autofocus: autofocus,
      focusNode: focusNode,
      checkColor: checkColor,
      fillColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return inactiveColor;
          }
          if (states.contains(WidgetState.selected)) {
            return activeColor;
          }
          return null;
        },
      ),
      onChanged: isEnabled ? (value) => onChanged?.call(value == true) : null,
    ).margeWith(
      _buildLabelWidget(theme.textTheme.titleMedium!),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoCheckbox(
      side: side,
      shape: shape,
      value: value,
      tristate: isTriState,
      focusColor: focusColor,
      autofocus: autofocus,
      focusNode: focusNode,
      checkColor: checkColor,
      activeColor: activeColor,
      fillColor: WidgetStatePropertyAll(inactiveColor) ,
      onChanged: isEnabled ? (value) => onChanged?.call(value == true) : null,
    ).margeWith(
      _buildLabelWidget(CupertinoTheme.of(context).textTheme.navTitleTextStyle),
      0.0,
    );
  }

  Widget? _buildLabelWidget([TextStyle? style]) {
    if (label != null) {
      return GestureDetector(
        onTap: isEnabled ? () => onChanged?.call(value == false) : null,
        child: DefaultTextStyle.merge(style: style, child: label!),
      );
    }
    return null;
  }
}
