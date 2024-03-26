import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';

/// A slider is a control that lets the user select from a range of values by
/// moving a thumb control along a track.
///
/// A slider is a good choice when you know that users think of the value as a
/// relative quantity, not a numeric value. For example, users think about
/// setting their audio volume to low or medium — not about setting the value to
/// 2 or 5.
///
/// Use this widget to create sliders with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoSlider] is utilized.
/// - On Android, [Slider] is used.
class AdaptiveSlider extends CoreAdaptiveComponent {
  /// The slider passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the slider with the new
  /// value.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// AdaptiveSlider(
  ///   value: _currentValue,
  ///   onChanged: (newValue) {
  ///     setState(() {
  ///       _currentValue = newValue;
  ///     });
  ///   },
  /// );
  ///  ```
  /// {@end-tool}
  const AdaptiveSlider({
    super.key,
    super.builders,
    this.thumbColor,
    this.activeColor,
    this.inactiveColor,
    this.divisions,
    this.vertical = false,
    this.size = double.infinity,
    this.min = 0.0,
    this.max = 100.0,
    this.onChangeEnd,
    this.onChangeStart,
    required this.value,
    required this.onChanged,
  })  : assert(min < max, "min must be less than max"),
        assert(
          value >= min && value <= max,
          'Value $value is not between minimum $min and maximum $max',
        );

  /// The value of this slider.
  ///
  /// This value must be between [min] and [max], inclusive.
  final double value;

  /// Called during a drag when the user is selecting a new value for the slider
  /// by dragging.
  ///
  /// The slider passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the slider with the new
  /// value.
  ///
  /// If null, the slider will be displayed as disabled.
  ///
  /// The callback provided to onChanged should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// Slider(
  ///   value: _duelCommandment.toDouble(),
  ///   min: 1.0,
  ///   max: 10.0,
  ///   divisions: 10,
  ///   onChanged: (double newValue) {
  ///     setState(() {
  ///       _duelCommandment = newValue.round();
  ///     });
  ///   },
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [onChangeStart] for a callback that is called when the user starts
  ///    changing the value.
  ///  * [onChangeEnd] for a callback that is called when the user stops
  ///    changing the value.
  final ValueChanged<double>? onChanged;

  /// Called when the user starts selecting a new value for the slider.
  ///
  /// This callback shouldn't be used to update the slider [value] (use
  /// [onChanged] for that), but rather to be notified when the user has started
  /// selecting a new value by starting a drag or with a tap.
  ///
  /// The value passed will be the last [value] that the slider had before the
  /// change began.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// Slider(
  ///   value: _duelCommandment.toDouble(),
  ///   min: 1.0,
  ///   max: 10.0,
  ///   divisions: 10,
  ///   onChanged: (double newValue) {
  ///     setState(() {
  ///       _duelCommandment = newValue.round();
  ///     });
  ///   },
  ///   onChangeStart: (double startValue) {
  ///     print('Started change at $startValue');
  ///   },
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [onChangeEnd] for a callback that is called when the value change is
  ///    complete.
  final ValueChanged<double>? onChangeStart;

  /// Called when the user is done selecting a new value for the slider.
  ///
  /// This callback shouldn't be used to update the slider [value] (use
  /// [onChanged] for that), but rather to know when the user has completed
  /// selecting a new [value] by ending a drag or a click.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// Slider(
  ///   value: _duelCommandment.toDouble(),
  ///   min: 1.0,
  ///   max: 10.0,
  ///   divisions: 10,
  ///   onChanged: (double newValue) {
  ///     setState(() {
  ///       _duelCommandment = newValue.round();
  ///     });
  ///   },
  ///   onChangeEnd: (double newValue) {
  ///     print('Ended change on $newValue');
  ///   },
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [onChangeStart] for a callback that is called when a value change
  ///    begins.
  final ValueChanged<double>? onChangeEnd;

  /// The maximum value the user can select.
  ///
  /// Defaults to 0.0. Must be greater than or equal to [min].
  ///
  /// If the [max] is equal to the [min], then the slider is disabled.
  final double min;

  /// The minimum value the user can select.
  ///
  /// Defaults to 100.0. Must be less than or equal to [max].
  ///
  /// If the [max] is equal to the [min], then the slider is disabled.
  final double max;

  /// The maximum width of the slider.
  ///
  /// If not specified, it will default to [double.infinity].
  final double size;

  /// The number of discrete divisions in the slider.
  ///
  /// If null, the slider is continuous.
  final int? divisions;

  /// Determines the orientation of the slider.
  ///
  /// If set to `true`, the slider is displayed vertically,
  /// making it useful for representing real-world values traditionally visualized in a
  /// vertical orientation, such as temperature levels or audio volume.
  ///
  /// Defaults to `false` for horizontal orientation.
  final bool vertical;

  /// The color of the slider thumb.
  final Color? thumbColor;

  /// The color of the active portion of the slider.
  final Color? activeColor;

  /// Color for the inactive portion of the slider.
  ///
  /// if platform is IOS will Ignored.
  final Color? inactiveColor;

  bool get enabled => onChanged != null;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return IntrinsicHeight(
      child: Slider(
        max: max,
        min: min,
        value: value,
        divisions: divisions,
        onChanged: onChanged,
        onChangeEnd: onChangeEnd,
        onChangeStart: onChangeStart,
        thumbColor: thumbColor,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        label: value.toStringAsFixed(0),
      ),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlider(
        max: max,
        min: min,
        value: value,
        divisions: divisions,
        onChanged: onChanged,
        onChangeEnd: onChangeEnd,
        onChangeStart: onChangeStart,
        activeColor: activeColor,
        thumbColor: thumbColor ?? CupertinoColors.white,
      ),
    );
  }
}
