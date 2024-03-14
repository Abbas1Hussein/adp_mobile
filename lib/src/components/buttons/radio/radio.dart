import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';

/// Radio buttons, also called option buttons, let users select one option from
/// a collection of two or more mutually exclusive, but related, options. Radio
/// buttons are always used in groups, and each option is represented by one
/// radio button in the group.
///
/// In the default state, no radio button in a RadioButtons group is selected.
/// That is, all radio buttons are cleared. However, once a user has selected a
/// radio button, the user can't deselect the button to restore the group to its
/// initial cleared state.
///
/// The singular behavior of a RadioButtons group distinguishes it from check
/// boxes, which support multi-selection and deselection, or clearing.
///
/// Use this widget to create radio buttons with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoRadio] is utilized.
/// - On Android, [Radio] is used.
class AdaptiveRadio<T> extends CoreAdaptiveComponent {
  /// Creates a adp radio button.
  ///
  /// See also:
  ///
  ///   * [AdaptiveSlider], which let the user lie within a range of values,
  ///     (for example, 10, 20, 30, ... 100).
  ///   * [AdaptiveCheckbox], which let the user select multiple options.
  const AdaptiveRadio({
    super.key,
    super.builders,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.foregroundColor,
    this.autofocus = false,
    this.focusNode,
    this.focusColor,
    this.groupValue,
    this.onChanged,
    required this.value,
  });

  /// The value represented by this adp radio button.
  final T value;

  /// The currently selected value for a group of adp radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T? groupValue;

  /// Called when the user selects this adp radio button.
  ///
  /// The radio button passes [value] as a parameter to this callback. The radio
  /// button does not actually change state until the parent widget rebuilds the
  /// radio button with the new [groupValue].
  ///
  /// If null, the radio button will be displayed as disabled.
  ///
  /// The provided callback will not be invoked if this radio button is already
  /// selected.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// AdaptiveRadio<SingingCharacter>(
  ///   value: SingingCharacter.lafayette,
  ///   groupValue: _character,
  ///   onChanged: (SingingCharacter? newValue) {
  ///     setState(() {
  ///       _character = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<T>? onChanged;

  /// The widget that be displayed alongside the radio button.
  final Widget? label;

  /// The active color for the radio button.
  final Color? activeColor;

  /// The color to inactiveColor when the radio button is inactive or disabled.
  final Color? inactiveColor;

  /// The color of the radio button's [label].
  final Color? foregroundColor;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// The color for the radio's border when it has the input focus.
  ///
  /// If null, then a paler form of the [activeColor] will be used.
  final Color? focusColor;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// Checks whether the radio button is enabled or disabled based,
  /// on the presence of the [onChanged] callback.
  bool get _enabled => onChanged != null;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    final labelStyle = Theme.of(context).textTheme.labelLarge!;
    return Radio<T>(
      value: value,
      groupValue: groupValue,
      autofocus: autofocus,
      focusNode: focusNode,
      focusColor: focusColor,
      fillColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return inactiveColor;
          }
          if (!states.contains(MaterialState.selected)) {
            return inactiveColor;
          }
          if (states.contains(MaterialState.selected)) {
            return activeColor;
          }
          return null;
        },
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      overlayColor: MaterialStateProperty.all(activeColor?.withOpacity(0.5)),
      onChanged: _enabled ? (value) => onChanged?.call(value as T) : null,
    ).margeWith(_buildLabelWidget(context, labelStyle), 2.0);
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    final labelStyle = CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 13.5);
    return CupertinoRadio<T>(
      value: value,
      groupValue: groupValue,
      autofocus: autofocus,
      focusNode: focusNode,
      fillColor: activeColor,
      focusColor: focusColor,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      onChanged: _enabled ? (value) => onChanged?.call(value as T) : null,
    ).margeWith(_buildLabelWidget(context, labelStyle));
  }

  Widget? _buildLabelWidget(BuildContext context, [TextStyle? style]) {
    if (label != null) {
      return GestureDetector(
        onTap: _enabled ? () => onChanged?.call(value) : null,
        child: IconTheme.merge(
          data: IconTheme.of(context).copyWith(color: foregroundColor),
          child: DefaultTextStyle.merge(
            style: style?.copyWith(color: foregroundColor),
            child: label!,
          ),
        ),
      );
    }
    return null;
  }
}
