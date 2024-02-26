import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../buttons/button/iOS.dart';
import '../date_picker_formatter.dart';
import 'picker_button_constraints.dart';


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

    final Color? resolvedBackgroundColor = CupertinoDynamicColor.maybeResolve(
        CupertinoColors.quaternarySystemFill, context);

    return ConstrainedBox(
      constraints: kPickerButtonConstraints,
      child: IOSButton(
        mouseCursor: SystemMouseCursors.click,
        onPressed: onPressed,
        backgroundColor: resolvedBackgroundColor,
        child: DefaultTextStyle(
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
