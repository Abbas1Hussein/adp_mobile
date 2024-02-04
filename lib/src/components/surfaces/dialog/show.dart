import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/adaptive.dart';

/// Shows an adaptive platform-specific dialog and returns a future that resolves to a value.
///
/// Use this function to display a dialog with platform-specific styling and behavior.
/// The appearance and behavior of the dialog adapt to the current platform (iOS, Android).
///
/// see also:
/// * [DialogPresenter]: A utility class for presenting different types of adaptive dialogs.
/// * [AdaptiveDialog]: A custom dialog widget that adapts its appearance based on the platform.
Future<T?>? showAdpDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
}) {
  return adaptiveValue<Future<T?>>(
    android: () => showDialog<T>(
      context: context,
      builder: builder,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
    ),
    ios: () {
      return showCupertinoDialog<T>(
        context: context,
        builder: (context) {
          final result = builder(context);
          return barrierColor != null
              ? ColoredBox(color: barrierColor, child: result)
              : result;
        },
        useRootNavigator: useRootNavigator,
        routeSettings: routeSettings,
        barrierLabel: barrierLabel,
        barrierDismissible: barrierDismissible,
      );
    },
  );
}
