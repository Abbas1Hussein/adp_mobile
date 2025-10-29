import 'package:flutter/widgets.dart';

import '../../../core/common/platform_ruining.dart';
import '../surfaces.dart';

/// A utility class for presenting different types of adaptive dialogs.
abstract final class DialogPresenter {
  const DialogPresenter._();

  /// Example of usage [showConfirmationDialog].
  ///
  /// ```dart
  /// final result = await DialogPresenter.showConfirmationDialog(
  ///   context,
  ///   title: 'Are you sure you want to proceed?',
  ///   message: 'There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...',
  ///   confirmLabel: 'Yes',
  ///   cancelLabel: "No",
  /// );
  ///
  /// if (result != null && result) {
  ///   // User confirmed
  /// } else {
  ///   // User canceled
  /// }
  /// ```
  static Future<bool> showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
    String cancelLabel = 'Cancel',
  }) async {
    final result = await showAdpDialog<bool?>(
      context: context,
      builder: (context) => AdaptiveDialog(
        title: Text(title),
        content: Text(message),
        actions: <AdaptiveDialogAction>[
          AdaptiveDialogAction(
            child: Text(confirmLabel),
            onPressed: () => Navigator.pop(context, true),
          ),
          AdaptiveDialogAction(
            child: Text(cancelLabel),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Example of usage [showInformationDialog].
  ///
  /// ```dart
  /// await DialogPresenter.showInformationDialog(
  ///   context,
  ///   title: 'Information Dialog',
  ///   message: 'This is an example of an information dialog.',
  /// );
  /// ```
  static Future<void> showInformationDialog(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'OK',
  }) async {
    await showAdpDialog<void>(
      context: context,
      builder: (context) => AdaptiveDialog(
        title: Text(title),
        content: Text(message),
        contentPadding:
            PlatformRuining.isIOS ? const EdgeInsets.only(top: 12.0) : null,
        actions: [
          AdaptiveDialogAction(
            child: Text(confirmLabel),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  /// Example of usage [showCustomDialog].
  ///
  /// ```dart
  /// await DialogPresenter.showCustomDialog(
  ///   context,
  ///   dialog: AdaptiveDialog(
  ///     title: Text('Custom Dialog'),
  ///     content: Text('This is an example of a custom dialog.'),
  ///     properties: Properties(
  ///       android: DialogAndroidProperty(),
  ///       iOS: DialogIOSProperty(),
  ///     ),
  ///   ),
  /// );
  /// ```
  ///
  /// Parameters:
  /// - [dialog]: An instance of [AdaptiveDialog] representing the platform dialog.
  /// - [barrierDismissible]: Whether the dialog can be dismissed by tapping the barrier. (Default is true)
  static Future<T?> showCustomDialog<T>(
    BuildContext context, {
    bool barrierDismissible = true,
    required AdaptiveDialog child,
  }) async {
    return await showAdpDialog<T?>(
      context: context,
      builder: (context) => child,
      barrierDismissible: barrierDismissible,
    );
  }
}
