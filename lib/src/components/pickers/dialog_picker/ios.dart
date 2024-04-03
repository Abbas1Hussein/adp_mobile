import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSDialogPicker {
  const IOSDialogPicker(this.context, this.localizations,
      { required this.picker });

  final Widget picker;
  final BuildContext context;
  final MaterialLocalizations localizations;

  Future<bool?> showIOSDatePicker(bool showTitle, bool isDismissible) {
    final size = MediaQuery.sizeOf(context);
    return showCupertinoDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: isDismissible,
      builder: (context) => CupertinoAlertDialog(
        title: showTitle
            ? Text(
                localizations.datePickerHelpText,
                style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
              )
            : const SizedBox.shrink(),
        content: SizedBox(
            height: size.height * 0.3, width: size.width, child: picker),
        actions: [
          _buildOkPickerButton(),
          _buildCancelPickerButton(),
        ],
      ),
    );
  }

  Future<bool?> showIOSTimePicker(bool showTitle, bool isDismissible) {
    final size = MediaQuery.sizeOf(context);
    return showCupertinoDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: isDismissible,
      builder: (context) => CupertinoAlertDialog(
        title: showTitle
            ? Text(
                localizations.timePickerDialHelpText,
                style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
              )
            : const SizedBox.shrink(),
        content: SizedBox(
            height: size.height * 0.2, width: size.width, child: picker),
        actions: [
          _buildOkPickerButton(),
          _buildCancelPickerButton(),
        ],
      ),
    );
  }

  Widget _buildOkPickerButton() {
    return CupertinoDialogAction(
      onPressed: () => Navigator.pop(context, true),
      child: Text(localizations.okButtonLabel),
    );
  }

  Widget _buildCancelPickerButton() {
    return CupertinoDialogAction(
      onPressed: () => Navigator.pop(context, false),
      child: Text(localizations.cancelButtonLabel),
    );
  }
}
