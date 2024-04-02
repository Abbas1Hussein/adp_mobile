import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';
import '../../button_picker/ios.dart';
import '../../button_picker/typedef.dart';
import '../../dialog_picker/ios.dart';
import '../../button_picker/button_constraints.dart';

/// available modes for CupertinoDatePicker
enum CupertinoDatePickerModeStyle {
  /// Displayed CupertinoDatePicker with IOS-Style Dialog.
  cupertino,

  /// Displayed CupertinoDatePicker as a button.
  cupertinoButton,
}

class CupertinoDatePickerButton extends IOSPickerButton {
  const CupertinoDatePickerButton({
    super.key,
    this.alwaysUse24HourFormat = false,
    required this.pickerMode,
    required super.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  final bool alwaysUse24HourFormat;
  final CupertinoDatePickerMode pickerMode;

  @override
  Widget child(BuildContext context) {
    final List<Widget> children = () {
      switch (pickerMode) {
        case CupertinoDatePickerMode.date:
          return _buildDateWidget();
        case CupertinoDatePickerMode.time:
          return _buildTimeWidget();
        case CupertinoDatePickerMode.monthYear:
          return _buildMonthYearWidget();
        case CupertinoDatePickerMode.dateAndTime:
          return _buildDateAndTimeWidget();
      }
    }();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  /// displaying the date (e.g., 'July 13, 2012').
  List<Widget> _buildDateWidget() {
    return [
      Text(month.substring(0, 3)),
      verticalDivider,
      Text(day),
      verticalDivider,
      Text(year),
    ];
  }

  /// displaying the time (e.g., '4:14 PM').
  List<Widget> _buildTimeWidget() {
    return [
      Text(timeOfDay.hour.toString()),
      verticalDivider,
      Text(initialDate.minute.toString()),
      if (!alwaysUse24HourFormat) verticalDivider,
      if (!alwaysUse24HourFormat) Text(amPm),
    ];
  }

  /// displaying the month and year (e.g., 'July 2012').
  List<Widget> _buildMonthYearWidget() {
    return [Text(month), verticalDivider, Text(year)];
  }

  /// displaying the date and time (e.g., 'Fri Jul 13 | 4:14 PM').
  List<Widget> _buildDateAndTimeWidget() {
    return [
      Text('$weekDay, ${month.substring(0, 3)}'),
      verticalDivider,
      Text('${timeOfDay.hour.toString()}:${initialDate.minute.toString()}'),
      if (!alwaysUse24HourFormat) verticalDivider,
      if (!alwaysUse24HourFormat) Text(amPm),
    ];
  }
}

class DatePickerIOS extends StatefulWidget {
  const DatePickerIOS({
    super.key,
    this.onCancel,
    this.property,
    this.initialDate,
    this.onDateTimeChanged,
    this.datePickerButtonBuilder,
  });

  final DateTime? initialDate;
  final VoidCallback? onCancel;
  final DatePickerIOSProperty? property;
  final ValueChanged<DateTime>? onDateTimeChanged;
  final DatePickerButtonBuilder? datePickerButtonBuilder;

  @override
  State<DatePickerIOS> createState() => _DatePickerIOSState();
}

class _DatePickerIOSState extends State<DatePickerIOS> {
  late DateTime selectedDate;
  late DateTime lastSelectedDate;
  late MaterialLocalizations localizations;

  @override
  void initState() {
    selectedDate = widget.initialDate ?? DateTime.now();
    lastSelectedDate = widget.initialDate ?? DateTime.now();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizations = MaterialLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.property?.modeStyle ==
        CupertinoDatePickerModeStyle.cupertinoButton) {
      return ConstrainedBox(
        constraints: kPickerButtonConstraints,
        child: _buildCupertinoDatePicker(),
      );
    }

    if (widget.datePickerButtonBuilder != null){
      return widget.datePickerButtonBuilder!(
        context,
        selectedDate,
        _showCupertinoDatePickerDialog,
      );
    }

    return CupertinoDatePickerButton(
      pickerMode: widget.property?.mode ?? CupertinoDatePickerMode.date,
      alwaysUse24HourFormat: widget.property?.use24hFormat ?? false,
      initialDate: selectedDate,
      localizations: localizations,
      onPressed: _showCupertinoDatePickerDialog,
    );
  }

  Widget _buildCupertinoDatePicker() {
    return CupertinoDatePicker(
      initialDateTime: selectedDate,
      onDateTimeChanged: _onDateTimeChanged,
      dateOrder: widget.property?.dateOrder,
      backgroundColor: widget.property?.backgroundColor,
      maximumDate: widget.property?.maximumDate,
      minimumDate: widget.property?.minimumDate,
      maximumYear: widget.property?.maximumYear,
      minimumYear: widget.property?.minimumYear ?? 1,
      minuteInterval: widget.property?.minuteInterval ?? 1,
      showDayOfWeek: widget.property?.showDayOfWeek ?? false,
      mode: widget.property?.mode ?? CupertinoDatePickerMode.date,
      use24hFormat: widget.property?.use24hFormat ?? false,
    );
  }

  Future<void> _showCupertinoDatePickerDialog() async {
    final showTitle = widget.property?.showTitle ?? true;
    final isDismissible = widget.property?.isDismissible ?? true;

    final result = await IOSDialogPicker(
      context,
      localizations,
      picker: _buildCupertinoDatePicker(),
    ).showIOSDatePicker(showTitle, isDismissible);

    if (result != null && result) {
      _handleOkClick();
    } else {
      _handleCancelClick();
    }
  }

  void _handleCancelClick() {
    _onDateTimeChanged(lastSelectedDate);
    widget.onCancel?.call();
  }

  void _handleOkClick() {
    setState(() {
      lastSelectedDate = selectedDate;
    });
    widget.onDateTimeChanged?.call(selectedDate);
  }

  void _onDateTimeChanged(DateTime dateTime) {
    setState(() {
      selectedDate = dateTime;
    });
  }
}

class DatePickerIOSProperty extends CoreIOSProperty {
  const DatePickerIOSProperty({
    this.minimumDate,
    this.maximumDate,
    this.minimumYear,
    this.maximumYear,
    this.minuteInterval,
    this.use24hFormat,
    this.dateOrder,
    this.backgroundColor,
    this.showDayOfWeek,
    this.showTitle = true,
    this.isDismissible = true,
    this.mode = CupertinoDatePickerMode.date,
    this.modeStyle = CupertinoDatePickerModeStyle.cupertino,
  });

  /// The mode of the date picker as one of [CupertinoDatePickerMode].
  /// Defaults to [CupertinoDatePickerMode.date]. Cannot be null and
  /// value cannot change after initial build.
  final CupertinoDatePickerMode mode;

  /// Represents the display mode of the CupertinoDatePicker.
  ///
  /// Use [CupertinoDatePickerModeStyle] to specify the desired appearance and behavior
  /// of the CupertinoDatePicker.
  ///
  /// Defaults to [CupertinoDatePickerModeStyle.cupertino].
  final CupertinoDatePickerModeStyle? modeStyle;

  /// Whether to display the title in [CupertinoDatePickerModeStyle.cupertino].
  ///
  /// When set to true, the title will be shown in the Cupertino-style time picker.
  /// Defaults to `true`.
  final bool showTitle;

  /// Determines whether the DatePicker can be dismissed by tapping outside of it.
  ///
  /// If set to true, the DatePicker can be dismissed by tapping outside its bounds.
  /// If set to false, the DatePicker will remain open until a selection is made or the cancel action is triggered.
  /// Defaults to `true`.
  final bool isDismissible;

  /// The minimum selectable date that the picker can settle on.
  ///
  /// When non-null, the user can still scroll the picker to [DateTime]s earlier
  /// than [minimumDate], but the [onDateTimeSelected] will not be called on
  /// these [DateTime]s. Once let go, the picker will scroll back to [minimumDate].
  ///
  /// In [CupertinoDatePickerMode.time] mode, a time becomes unselectable if the
  /// [DateTime] produced by combining that particular time and the date part of
  /// [initialDateTime] is earlier than [minimumDate]. So typically [minimumDate]
  /// needs to be set to a [DateTime] that is on the same date as [initialDateTime].
  ///
  /// Defaults to null. When set to null, the picker does not impose a limit on
  /// the earliest [DateTime] the user can select.
  final DateTime? minimumDate;

  /// The maximum selectable date that the picker can settle on.
  ///
  /// When non-null, the user can still scroll the picker to [DateTime]s later
  /// than [maximumDate], but the [onDateTimeSelected] will not be called on
  /// these [DateTime]s. Once let go, the picker will scroll back to [maximumDate].
  ///
  /// In [CupertinoDatePickerMode.time] mode, a time becomes unselectable if the
  /// [DateTime] produced by combining that particular time and the date part of
  /// [initialDateTime] is later than [maximumDate]. So typically [maximumDate]
  /// needs to be set to a [DateTime] that is on the same date as [initialDateTime].
  ///
  /// Defaults to null. When set to null, the picker does not impose a limit on
  /// the latest [DateTime] the user can select.
  final DateTime? maximumDate;

  /// Minimum year that the picker can be scrolled to in
  /// [CupertinoDatePickerMode.date] mode. Defaults to 1 and must not be null.
  final int? minimumYear;

  /// Maximum year that the picker can be scrolled to in
  /// [CupertinoDatePickerMode.date] mode. Null if there's no limit.
  final int? maximumYear;

  /// The granularity of the minutes spinner, if it is shown in the current mode.
  /// Must be an integer factor of 60.
  final int? minuteInterval;

  /// Whether to use 24 hour format. Defaults to false.
  final bool? use24hFormat;

  /// Determines the order of the columns inside [CupertinoDatePicker] in
  /// [CupertinoDatePickerMode.date] and [CupertinoDatePickerMode.monthYear]
  /// mode. When using monthYear mode, both [DatePickerDateOrder.dmy] and
  /// [DatePickerDateOrder.mdy] will result in the month|year order.
  /// Defaults to the locale's default date format/order.
  final DatePickerDateOrder? dateOrder;

  /// Background color of date picker.
  ///
  /// Defaults to null, which disables background painting entirely.
  final Color? backgroundColor;

  /// Whether to to show day of week alongside day. Defaults to false.
  final bool? showDayOfWeek;
}
