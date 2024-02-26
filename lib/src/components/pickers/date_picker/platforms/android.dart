import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';
import '../../picker_button/android.dart';

class MaterialDatePickerButton extends AndroidPickerButton {
  const MaterialDatePickerButton({
    super.key,
    this.alwaysUse24HourFormat = false,
    required super.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  final bool alwaysUse24HourFormat;

  @override
  Widget child(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(month.substring(0, 3)),
        verticalDivider,
        Text(day),
        verticalDivider,
        Text(year),
      ],
    );
  }
}

class DatePickerAndroid extends StatefulWidget {
  const DatePickerAndroid({
    super.key,
    this.onCancel,
    this.property,
    this.initialDate,
    this.onDateTimeChanged,
  });

  final DateTime? initialDate;
  final VoidCallback? onCancel;
  final DatePickerAndroidProperty? property;
  final ValueChanged<DateTime>? onDateTimeChanged;

  @override
  State<DatePickerAndroid> createState() => _DatePickerAndroidState();
}

class _DatePickerAndroidState extends State<DatePickerAndroid> {
  late DateTime selectedDate;
  late MaterialLocalizations localizations;

  @override
  void initState() {
    selectedDate = widget.initialDate ?? DateTime.now();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizations = MaterialLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialDatePickerButton(
      initialDate: selectedDate,
      localizations: localizations,
      onPressed: _showDatePickerDialog,
    );
  }

  void _showDatePickerDialog() async {
    final firstDate = selectedDate.subtract(const Duration(days: 1365));
    final lastDate = selectedDate.add(const Duration(days: 1365));

    final dataTime = await showDialog<DateTime>(
      context: context,
      barrierDismissible: widget.property?.isDismissible ?? true,
      builder: (context) => DatePickerDialog(
        initialDate: selectedDate,
        firstDate: widget.property?.firstDate ?? firstDate,
        lastDate: widget.property?.lastDate ?? lastDate,
        cancelText: widget.property?.cancelText,
        confirmText: widget.property?.confirmText,
        errorFormatText: widget.property?.errorFormatText,
        errorInvalidText: widget.property?.errorInvalidText,
        fieldHintText: widget.property?.fieldHintText,
        fieldLabelText: widget.property?.fieldLabelText,
        helpText: widget.property?.helpText,
        switchToInputEntryModeIcon: widget.property?.switchToInputEntryModeIcon,
        switchToCalendarEntryModeIcon: widget.property?.switchToCalendarEntryModeIcon,
        keyboardType: widget.property?.keyboardType,
        initialEntryMode: widget.property?.initialEntryMode ?? DatePickerEntryMode.calendar,
        initialCalendarMode: widget.property?.initialCalendarMode ?? DatePickerMode.year,
        currentDate: widget.property?.currentDate,
        restorationId: widget.property?.restorationId,
        selectableDayPredicate: widget.property?.selectableDayPredicate,
        onDatePickerModeChange: widget.property?.onDatePickerModeChange,
      ),
    );
    if (dataTime != null) {
      _onDateTimeChanged(dataTime);
    } else {
      widget.onCancel?.call();
    }
  }

  void _onDateTimeChanged(DateTime dateTime) {
    setState(() {
      selectedDate = dateTime;
    });
    widget.onDateTimeChanged?.call(dateTime);
  }
}

class DatePickerAndroidProperty extends CoreAndroidProperty {
  const DatePickerAndroidProperty({
    this.firstDate,
    this.lastDate,
    this.currentDate,
    this.initialEntryMode,
    this.selectableDayPredicate,
    this.cancelText,
    this.confirmText,
    this.helpText,
    this.initialCalendarMode,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
    this.keyboardType,
    this.restorationId,
    this.isDismissible = true,
    this.onDatePickerModeChange,
    this.switchToInputEntryModeIcon,
    this.switchToCalendarEntryModeIcon,
  });

  /// The earliest allowable [DateTime] that the user can select.
  /// Default is subtracted by '1365' days from the `initialDate`.
  final DateTime? firstDate;

  /// The latest allowable [DateTime] that the user can select.
  /// Default is subtracted by '365' days from the `initialDate`.
  final DateTime? lastDate;

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime? currentDate;

  /// Determines whether the MaterialDatePicker can be dismissed by tapping outside of it.
  ///
  /// If set to true, the MaterialDatePicker can be dismissed by tapping outside its bounds.
  /// If set to false, the MaterialDatePicker will remain open until a selection is made or the cancel action is triggered.
  /// Defaults to `true`.
  final bool isDismissible;

  /// The initial mode of date entry method for the date picker dialog.
  ///
  /// See [DatePickerEntryMode] for more details on the different data entry
  /// modes available.
  final DatePickerEntryMode? initialEntryMode;

  /// Function to provide full control over which [DateTime] can be selected.
  final SelectableDayPredicate? selectableDayPredicate;

  /// The text that is displayed on the cancel button.
  final String? cancelText;

  /// The text that is displayed on the confirm button.
  final String? confirmText;

  /// The text that is displayed at the top of the header.
  ///
  /// This is used to indicate to the user what they are selecting a date for.
  final String? helpText;

  /// The initial display of the calendar picker.
  final DatePickerMode? initialCalendarMode;

  /// The error text displayed if the entered date is not in the correct format.
  final String? errorFormatText;

  /// The error text displayed if the date is not valid.
  ///
  /// A date is not valid if it is earlier than [firstDate], later than
  /// [lastDate], or doesn't pass the [selectableDayPredicate].
  final String? errorInvalidText;

  /// The hint text displayed in the [TextField].
  ///
  /// If this is null, it will default to the date format string. For example,
  /// 'mm/dd/yyyy' for en_US.
  final String? fieldHintText;

  /// The label text displayed in the [TextField].
  ///
  /// If this is null, it will default to the words representing the date format
  /// string. For example, 'Month, Day, Year' for en_US.
  final String? fieldLabelText;

  /// {@template flutter.material.datePickerDialog}
  /// The keyboard type of the [TextField].
  ///
  /// If this is null, it will default to [TextInputType.datetime]
  /// {@endtemplate}
  final TextInputType? keyboardType;

  /// Restoration ID to save and restore the state of the [DatePickerDialog].
  ///
  /// If it is non-null, the date picker will persist and restore the
  /// date selected on the dialog.
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  /// Called when the [DatePickerDialog] is toggled between
  /// [DatePickerEntryMode.calendar],[DatePickerEntryMode.input].
  ///
  /// An example of how this callback might be used is an app that saves the
  /// user's preferred entry mode and uses it to initialize the
  /// `initialEntryMode` parameter the next time the date picker is shown.
  final ValueChanged<DatePickerEntryMode>? onDatePickerModeChange;

  /// {@macro flutter.material.date_picker.switchToInputEntryModeIcon}
  final Icon? switchToInputEntryModeIcon;

  /// {@macro flutter.material.date_picker.switchToCalendarEntryModeIcon}
  final Icon? switchToCalendarEntryModeIcon;
}
