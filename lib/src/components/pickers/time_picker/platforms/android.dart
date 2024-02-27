import '../../../../core/extension/time.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';
import '../../button_picker/android.dart';

class MaterialTimePickerButton extends AndroidPickerButton {
  const MaterialTimePickerButton({
    super.key,
    required super.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  @override
  Widget child(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(timeOfDay.hourOfPeriod.toString()),
        verticalDivider,
        Text(timeOfDay.minute.toString()),
        verticalDivider,
        Text(amPm),
      ],
    );
  }
}

class TimePickerAndroid extends StatefulWidget {
  const TimePickerAndroid({
    super.key,
    this.property,
    this.onCancel,
    this.initialTime,
    this.onTimeChanged,
  });

  final TimeOfDay? initialTime;
  final VoidCallback? onCancel;

  final TimePickerAndroidProperty? property;
  final ValueChanged<TimeOfDay>? onTimeChanged;

  @override
  State<TimePickerAndroid> createState() => _TimePickerAndroidState();
}

class _TimePickerAndroidState extends State<TimePickerAndroid> {
  late TimeOfDay selectedTime;
  late MaterialLocalizations localizations;

  @override
  void initState() {
    selectedTime = widget.initialTime ?? TimeOfDay.now();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizations = MaterialLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialTimePickerButton(
      initialDate: selectedTime.toDateTime(),
      localizations: localizations,
      onPressed: _showTimePickerDialog,
    );
  }

  void _showTimePickerDialog() async {
    final time = await showDialog<TimeOfDay>(
      context: context,
      barrierDismissible: widget.property?.isDismissible ?? true,
      builder: (context) => TimePickerDialog(
        initialTime: selectedTime,
        helpText: widget.property?.helpText,
        cancelText: widget.property?.cancelText,
        confirmText: widget.property?.confirmText,
        hourLabelText: widget.property?.hourLabelText,
        minuteLabelText: widget.property?.minuteLabelText,
        orientation: widget.property?.orientation,
        restorationId: widget.property?.restorationId,
        errorInvalidText: widget.property?.errorInvalidText,
        onEntryModeChanged: widget.property?.onEntryModeChanged,
        initialEntryMode:
            widget.property?.initialEntryMode ?? TimePickerEntryMode.dial,
      ),
    );
    if (time != null) {
      _onTimeChanged(time);
    } else {
      widget.onCancel?.call();
    }
  }

  void _onTimeChanged(TimeOfDay timeOfDay) {
    setState(() {
      selectedTime = timeOfDay;
    });
    widget.onTimeChanged?.call(
      TimeOfDay(hour: timeOfDay.hourOfPeriod, minute: timeOfDay.minute),
    );
  }
}

class TimePickerAndroidProperty extends CoreAndroidProperty {
  const TimePickerAndroidProperty({
    this.hourLabelText,
    this.initialEntryMode = TimePickerEntryMode.dial,
    this.minuteLabelText,
    this.onEntryModeChanged,
    this.orientation,
    this.cancelText,
    this.confirmText,
    this.helpText,
    this.errorInvalidText,
    this.restorationId,
    this.isDismissible = true,
  });

  /// Optionally provide your own text for the cancel button.
  ///
  /// If null, the button uses [MaterialLocalizations.cancelButtonLabel].
  final String? cancelText;

  /// Optionally provide your own text for the confirm button.
  ///
  /// If null, the button uses [MaterialLocalizations.okButtonLabel].
  final String? confirmText;

  /// Optionally provide your own help text to the header of the time picker.
  final String? helpText;

  /// Optionally provide your own validation error text.
  final String? errorInvalidText;

  /// Optionally provide your own hour label text.
  final String? hourLabelText;

  /// Optionally provide your own minute label text.
  final String? minuteLabelText;

  /// Determines whether the TimePicker can be dismissed by tapping outside of it.
  ///
  /// If set to true, the TimePicker can be dismissed by tapping outside its bounds.
  /// If set to false, the TimePicker will remain open until a selection is made or the cancel action is triggered.
  /// Defaults to `true`.
  final bool isDismissible;

  /// Restoration ID to save and restore the state of the [TimePickerDialog].
  ///
  /// If it is non-null, the time picker will persist and restore the
  /// dialog's state.
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  /// The entry mode for the picker. Whether it's text input or a dial.
  final TimePickerEntryMode initialEntryMode;

  /// The optional [orientation] parameter sets the [Orientation] to use when
  /// displaying the dialog.
  ///
  /// By default, the orientation is derived from the [MediaQueryData.size] of
  /// the ambient [MediaQuery]. If the aspect of the size is tall, then
  /// [Orientation.portrait] is used, if the size is wide, then
  /// [Orientation.landscape] is used.
  ///
  /// Use this parameter to override the default and force the dialog to appear
  /// in either portrait or landscape mode regardless of the aspect of the
  /// [MediaQueryData.size].
  final Orientation? orientation;

  /// Callback called when the selected entry mode is changed.
  final EntryModeChangeCallback? onEntryModeChanged;
}
