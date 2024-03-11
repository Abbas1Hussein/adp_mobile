import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../buttons/menu/cupertino_menu_action.dart';
import '../date_picker_formatter.dart';
import 'button_constraints.dart';

abstract class IOSPickerButton extends BaseDateFormatter {
  const IOSPickerButton({
    super.key,
    required this.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.pickerTextStyle;

    return ConstrainedBox(
      constraints: kPickerButtonConstraints,
      child: CupertinoMenuAction(
        onPressed: onPressed,
        child: DefaultTextStyle(
            maxLines: 1, style: textStyle, child: child(context)),
      ),
    );
  }

  Widget child(BuildContext context);

  Widget get verticalDivider {
    return const SizedBox(height: 13.0, child: VerticalDivider());
  }
}
