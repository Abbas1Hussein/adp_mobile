import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/adaptive.dart';

/// Shows an adaptive platform-specific bottom sheet and returns a future that resolves to a value.
///
/// Use this function to display a bottom sheet with platform-specific styling and behavior.
/// The appearance and behavior of the bottom sheet adapt to the current platform (macOS, Windows).
///
/// see also:
/// * [BottomSheet] A custom bottom sheets widget that adapts its appearance based on the platform.
Future<T?>? showAdpBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
}) {
  return adaptiveValue<Future<T?>?>(
    android: () => showModalBottomSheet<T>(
      context: context,
      builder: builder,
      useSafeArea: true,
      showDragHandle: true,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      isDismissible: barrierDismissible,
    ),
    ios: () => showCupertinoModalPopup<T>(
      context: context,
      builder: builder,
      barrierColor: barrierColor ?? kCupertinoModalBarrierColor,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
    ),
  );
}
