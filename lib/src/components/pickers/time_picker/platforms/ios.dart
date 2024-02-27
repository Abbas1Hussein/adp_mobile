import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/construct/component.dart';
import '../../../../core/extension/time.dart';
import '../../button_picker/ios.dart';
import '../../dialog_picker/ios.dart';
import '../../button_picker/button_constraints.dart';
import '../../date_picker/platforms/ios.dart';


/// available modes for CupertinoTimePicker
enum CupertinoTimePickerModeStyle {
  /// Displayed CupertinoTimePicker with IOS-Style Dialog.
  cupertino,

  /// Displayed CupertinoTimePicker as a button.
  cupertinoButton,
}

class CupertinoTimePickerButton extends IOSPickerButton {
  const CupertinoTimePickerButton({
    super.key,
    required this.mode,
    required super.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  final CupertinoTimerPickerMode mode;

  @override
  Widget child(BuildContext context) {
    final List<Widget> children = () {
      switch (mode) {
        case CupertinoTimerPickerMode.hms:
          return _buildHourMinutesSecondsWidget(context);
        case CupertinoTimerPickerMode.hm:
          return _buildHourMinutesWidget(context);
        case CupertinoTimerPickerMode.ms:
          return _buildMinutesSecondsWidget(context);
      }
    }();
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  List<Widget> _buildHourMinutesSecondsWidget(BuildContext context) {
    return [
      _buildTextWidget(timeOfDay.hour.toString(), 'hour', context),
      verticalDivider,
      _buildTextWidget(timeOfDay.minute.toString(), 'minutes', context),
      verticalDivider,
      _buildTextWidget(initialDate.second.toString(), 'seconds', context),
    ];
  }

  List<Widget> _buildHourMinutesWidget(BuildContext context) {
    return [
      _buildTextWidget(timeOfDay.hour.toString(), 'hour', context),
      verticalDivider,
      _buildTextWidget(initialDate.minute.toString(), 'minutes', context),
    ];
  }

  List<Widget> _buildMinutesSecondsWidget(BuildContext context) {
    return [
      _buildTextWidget(timeOfDay.minute.toString(), 'minutes', context),
      verticalDivider,
      _buildTextWidget(initialDate.second.toString(), 'seconds', context),
    ];
  }

  Widget _buildTextWidget(String text, String unit, BuildContext context) {
    return Text(text).margeWith(_baselineComponent(context, unit));
  }

  Widget _baselineComponent(BuildContext context, String unit) {
    return Baseline(
      baseline: 25,
      baselineType: TextBaseline.alphabetic,
      child: Text(
        unit,
        style: CupertinoTheme.of(context)
            .textTheme
            .pickerTextStyle
            .copyWith(fontSize: 13.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class TimePickerIOS extends StatefulWidget {
  const TimePickerIOS({
    super.key,
    this.onCancel,
    this.property,
    this.onTimeChanged,
    required this.initialTime,
  });

  final TimePickerIOSProperty? property;
  final VoidCallback? onCancel;
  final ValueChanged<TimeOfDay>? onTimeChanged;

  final TimeOfDay? initialTime;

  @override
  State<TimePickerIOS> createState() => _TimePickerIOSState();
}

class _TimePickerIOSState extends State<TimePickerIOS> {
  late Duration selectedDate;
  late Duration lastSelectedDate;
  late MaterialLocalizations localizations;

  @override
  void initState() {
    selectedDate =
        (widget.initialTime ?? TimeOfDay.now()).convertTimeOfDayToDuration();
    lastSelectedDate =
        (widget.initialTime ?? TimeOfDay.now()).convertTimeOfDayToDuration();
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
    return CupertinoTimePickerButton(
      mode: widget.property?.mode ?? CupertinoTimerPickerMode.hms,
      initialDate: selectedDate.convertDurationToDateTime(),
      localizations: localizations,
      onPressed: _showCupertinoDatePickerDialog,
    );
  }

  Widget _buildCupertinoDatePicker() {
    return CupertinoTimerPicker(
      initialTimerDuration: selectedDate,
      onTimerDurationChanged: _onTimerChanged,
      itemExtent: widget.property?.itemExtent ?? 32.0,
      backgroundColor: widget.property?.backgroundColor,
      minuteInterval: widget.property?.minuteInterval ?? 1,
      secondInterval: widget.property?.secondInterval ?? 1,
      alignment: widget.property?.alignment ?? Alignment.center,
      mode: widget.property?.mode ?? CupertinoTimerPickerMode.hms,
    );
  }

  Future<void> _showCupertinoDatePickerDialog() async {
    final showTitle = widget.property?.showTitle ?? true;
    final isDismissible = widget.property?.isDismissible ?? true;

    final result = await IOSDialogPicker(
      context,
      localizations,
      picker: _buildCupertinoDatePicker(),
    ).showIOSTimePicker(showTitle, isDismissible);

    if (result != null && result) {
      _handleOkClick();
    } else {
      _handleCancelClick();
    }
  }

  void _handleCancelClick() {
    _onTimerChanged(lastSelectedDate);
    widget.onCancel?.call();
  }

  void _handleOkClick() {
    setState(() {
      lastSelectedDate = selectedDate;
    });
    widget.onTimeChanged?.call(selectedDate.convertDurationToTimeOfDay());
  }

  void _onTimerChanged(Duration duration) {
    setState(() {
      selectedDate = duration;
    });
  }
}

class TimePickerIOSProperty extends CoreIOSProperty {
  const TimePickerIOSProperty({
    this.modeStyle = CupertinoDatePickerModeStyle.cupertino,
    this.mode = CupertinoTimerPickerMode.hms,
    this.initialTimerDuration = Duration.zero,
    this.minuteInterval = 1,
    this.secondInterval = 1,
    this.alignment = Alignment.center,
    this.backgroundColor,
    this.itemExtent = 32.0,
    this.showTitle = true,
    this.isDismissible = true,
  });

  /// Represents the display mode of the CupertinoDatePicker.
  ///
  /// Use [CupertinoDatePickerModeStyle] to specify the desired appearance and behavior
  /// of the CupertinoDatePicker.
  ///
  /// Defaults to [CupertinoDatePickerModeStyle.cupertino].
  final CupertinoDatePickerModeStyle? modeStyle;

  /// The mode of the timer picker.
  final CupertinoTimerPickerMode mode;

  /// The initial duration of the countdown timer.
  final Duration initialTimerDuration;

  /// Whether to display the title in [CupertinoDatePickerModeStyle.cupertino].
  ///
  /// When set to true, the title will be shown in the Cupertino-style time picker.
  /// Defaults to `true`.
  final bool showTitle;

  /// Determines whether the TimerPicker can be dismissed by tapping outside of it.
  ///
  /// If set to true, the TimerPicker can be dismissed by tapping outside its bounds.
  /// If set to false, the TimerPicker will remain open until a selection is made or the cancel action is triggered.
  /// Defaults to `true`.
  final bool isDismissible;

  /// The granularity of the minute spinner. Must be a positive integer factor
  /// of 60.
  final int minuteInterval;

  /// The granularity of the second spinner. Must be a positive integer factor
  /// of 60.
  final int secondInterval;

  /// Defines how the timer picker should be positioned within its parent.
  ///
  /// Defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// Background color of timer picker.
  ///
  /// Defaults to null, which disables background painting entirely.
  final Color? backgroundColor;

  /// {@macro flutter.cupertino.picker.itemExtent}
  ///
  /// Defaults to a value that matches the default iOS timer picker wheel.
  final double itemExtent;
}
