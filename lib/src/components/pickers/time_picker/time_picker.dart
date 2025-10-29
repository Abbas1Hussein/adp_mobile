import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../button_picker/typedef.dart';
import 'platforms/platforms.dart';

/// A time picker is a user interface component that allows users to select a specific time of day, typically in hours and minutes.
/// It provides a graphical interface for users to adjust the hour and minute values using sliders or input fields.
/// Time pickers are commonly used in applications that require scheduling or setting reminders,
/// enabling users to choose precise times for events or tasks.
///
/// Use this widget to create time picker with platform-specific
/// styling and behavior:
/// - On macOS, [MacosTimePicker],[CupertinoTimerPicker] is utilized.
/// - On Windows, [TimePicker] is used.
class AdaptiveTimePicker extends CoreAdaptiveComponent<
    TimePickerAndroidProperty, TimePickerIOSProperty> {
  /// Creates an instance of [AdaptiveTimePicker].
  ///
  /// The [AdaptiveTimePicker] invokes the callback with the new selected value and
  /// automatically manages state updates until the parent widget rebuilds the
  /// time picker with the updated value.
  ///
  /// You do not need to manually update the state; the [AdaptiveTimePicker] handles
  /// state changes directly.
  ///
  /// The [properties] parameter allows you to customize the visual and functional aspects
  /// of the tab view separately for Android and IOS platforms.
  /// You can provide specific [properties] for each platform using `TimePickerAndroidProperty`
  /// and `TimePickerIOSProperty` respectively.
  ///
  /// See also:
  ///
  ///  * [DatePicker], which gives you a standardized way to let users pick a
  ///    localized date value
  const AdaptiveTimePicker({
    super.key,
    super.builders,
    super.properties,
    this.onCancel,
    this.onSelected,
    this.initialTime,
    this.buttonBuilder,
  });

  /// The initial time displayed when the time picker is first shown.
  ///
  /// Default to `TimeOfDay.now()`.
  final TimeOfDay? initialTime;

  /// A callback function to be called when the user cancels the time picker.
  ///
  /// It can be null if no action is needed on cancellation.
  final VoidCallback? onCancel;

  /// A callback function called when the user selects a time in the picker.
  ///
  /// It provides the selected [TimeOfDay] as an argument.
  final ValueChanged<TimeOfDay>? onSelected;

  /// An optional function that allows customization of the time picker button.
  ///
  /// This builder function provides flexibility in defining the button's appearance and behavior.
  /// You can customize aspects like the button text, icon, styling, and triggering logic for the time picker dialog.
  ///
  /// If not provided, a default button will be used based on the target platform.
  final TimePickerButtonBuilder? buttonBuilder;

  @override
  Widget android(BuildContext context, [TimePickerAndroidProperty? property]) {
    return TimePickerAndroid(
      property: property,
      onCancel: onCancel,
      initialTime: initialTime,
      onTimeChanged: onSelected,
      timePickerButtonBuilder: buttonBuilder,
    );
  }

  @override
  Widget iOS(BuildContext context, [TimePickerIOSProperty? property]) {
    return TimePickerIOS(
      property: property,
      onCancel: onCancel,
      initialTime: initialTime,
      onTimeChanged: onSelected,
      timePickerButtonBuilder: buttonBuilder,
    );
  }
}
