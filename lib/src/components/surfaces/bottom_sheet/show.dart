import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/adaptive.dart';
import '../../../core/common/construct/properties.dart';
import 'bottom_sheet.dart';
import 'platforms/platforms.dart';

/// Shows an adaptive platform-specific bottom sheet and returns a future that resolves to a value.
///
/// Use this function to display a bottom sheet with platform-specific styling and behavior.
/// The appearance and behavior of the bottom sheet adapt to the current platform (macOS, Windows).
Future<T?>? showAdpBottomSheet<T>({
  Offset? anchorPoint,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  /// properties applied only if [builder] using AdaptiveBottomSheet.
  CoreProperties<BottomSheetAndroidProperty, BottomSheetIOSProperty>?
      properties;

  if (builder(context) is AdaptiveBottomSheet) {
    properties = (builder(context) as AdaptiveBottomSheet).properties;
  }

  return adaptiveValue<Future<T?>?>(
    ios: () {
      final iOSProperty = properties?.ios;
      return showCupertinoModalPopup<T>(
        context: context,
        builder: builder,
        anchorPoint: anchorPoint,
        filter: iOSProperty?.filter,
        routeSettings: routeSettings,
        useRootNavigator: useRootNavigator,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor ?? kCupertinoModalBarrierColor,
      );
    },
    android: () {
      final androidProperty = properties?.android;

      return showModalBottomSheet<T>(
        context: context,
        builder: builder,
        useSafeArea: true,
        barrierLabel: barrierLabel,
        barrierColor: barrierColor,
        routeSettings: routeSettings,
        isDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator,
        shape: androidProperty?.shape,
        elevation: androidProperty?.elevation,
        constraints: androidProperty?.constraints,
        backgroundColor: androidProperty?.backgroundColor,
        enableDrag: androidProperty?.enableDrag ?? true,
        showDragHandle: androidProperty?.showDragHandle ?? true,
        isScrollControlled: androidProperty?.isScrollControlled ?? true,
        anchorPoint: anchorPoint,
      );
    },
  );
}
