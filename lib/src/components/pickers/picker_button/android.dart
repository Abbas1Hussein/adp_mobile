import 'package:flutter/material.dart';

import '../date_picker_formatter.dart';
import 'picker_button_constraints.dart';

abstract class AndroidPickerButton extends BaseDateFormatter {
  const AndroidPickerButton({
    super.key,
    required this.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;

    return ConstrainedBox(
      constraints: kPickerButtonConstraints,
      child: OutlinedButton(
        onPressed: onPressed,
        child: DefaultTextStyle.merge(
          maxLines: 1,
          style: textStyle,
          child: child(context),
        ),
      ),
    );
  }

  Widget child(BuildContext context);

  Widget get verticalDivider {
    return const SizedBox(height: 15.0, child: VerticalDivider());
  }
}
