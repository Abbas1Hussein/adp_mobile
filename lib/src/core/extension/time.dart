import 'package:flutter/material.dart';

extension TimeOfDayEx on TimeOfDay {
  DateTime get _dateTime => DateTime.now();

  /// to convert TimeOfDay to DateTime
  DateTime toDateTime() {
    return DateTime(
        _dateTime.year, _dateTime.month, _dateTime.day, hour, minute);
  }

  ///  to convert Duration to TimeOfDay
  Duration convertTimeOfDayToDuration() {
    return Duration(hours: hour, minutes: minute, seconds: _dateTime.second);
  }
}

extension DurationEx on Duration {
  ///  to convert Duration to TimeOfDay
  TimeOfDay convertDurationToTimeOfDay() {
    return TimeOfDay(hour: inHours, minute: inMinutes % 60);
  }

  DateTime convertDurationToDateTime() {
    return DateTime(
      0,
      1,
      1,
      inHours,
      inMinutes % 60,
      inSeconds % 60,
    );
  }
}
