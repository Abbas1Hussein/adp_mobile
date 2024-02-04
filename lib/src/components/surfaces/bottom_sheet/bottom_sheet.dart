import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';

/// A modal dialog that’s attached to a particular window and prevents further
/// interaction with the window until the sheet is dismissed,
/// can be displayed on both iOS and android.
///
/// See also:
///
/// * [showAdpBottomSheet] A function to display an adaptive platform-specific bottom sheet.
class AdaptiveBottomSheet extends CoreAdaptiveComponent {
  /// Creates an adaptive bottom sheet.
  ///
  /// The [content] parameter is required and represents the main content of the bottom sheet.
  const AdaptiveBottomSheet({
    super.key,
    this.title,
    this.actions,
    required this.content,
  });
  final Widget? title;

  /// The main content of the bottom sheet.
  final Widget content;

  /// The set of actions that are displayed for the user to select.
  ///
  /// Typically this is a list of [CupertinoActionSheetAction] widgets.
  final List<Widget>? actions;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle.merge(
                style: Theme.of(context).typography.dense.titleSmall,
                child: title!,
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle.merge(
                style: Theme.of(context).typography.dense.bodySmall,
                child: SingleChildScrollView(child: content),
              ),
            ),
          ),
          const Divider(thickness: 0.3),
          if (actions != null) Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
              child: Row(
                textDirection: TextDirection.rtl,
                children: actions!,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoActionSheet(
      title: title,
      message: content,
      actions: actions,
    );
  }
}
