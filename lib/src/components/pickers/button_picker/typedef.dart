import 'package:flutter/material.dart';

/// A typedef for a function that builds a custom date picker button widget.
///
/// This allows for flexible customization of the button's appearance and behavior.
typedef DatePickerButtonBuilder = Widget Function(
  BuildContext context,

  /// The currently selected date to display.
  DateTime selectedDate,

  /// A callback to show the platform-specific date picker dialog.
  VoidCallback showPlatformDataPickerDialog,
);

/// A typedef for a function that builds a custom time picker button widget.
///
/// This allows for flexible customization of the button's appearance and behavior.
typedef TimePickerButtonBuilder = Widget Function(
  BuildContext context,

  /// The currently selected time to display.
  TimeOfDay selectedTime,

  /// A callback to show the platform-specific time picker dialog.
  VoidCallback showPlatformTimePickerDialog,
);
