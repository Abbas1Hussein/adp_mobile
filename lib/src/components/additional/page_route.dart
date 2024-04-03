import 'package:adp_mobile/src/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A modal route that replaces the entire screen with a platform-adaptive
/// transition.
///
/// By default, when a modal route is replaced by another, the previous route
/// remains in memory. To free all the resources when this is not necessary, set
/// [maintainState] to false.
///
/// If `barrierDismissible` is true, then pressing the escape key on the keyboard
/// will cause the current route to be popped with null as the value.
///
/// The type `T` specifies the return type of the route which can be supplied as
/// the route is popped from the stack via [Navigator.pop] by providing the
/// optional `result` argument.
///
/// - [adaptivePageRoute] are usually not used, because [MaterialPageRoute]
/// automatically adaptive based on platform.
PageRoute<T> adaptivePageRoute<T>({
  String? title, // for (IOS).
  bool maintainState = true,
  bool allowSnapshotting = true,
  bool fullscreenDialog = false,
  bool barrierDismissible = false,
  RouteSettings? settings,
  required WidgetBuilder builder,
}) {
  return adaptiveValue<PageRoute<T>>(
    ios: () => CupertinoPageRoute<T>(
      title: title,
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      allowSnapshotting: allowSnapshotting,
      barrierDismissible: barrierDismissible,
    ),
    android: () => MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      allowSnapshotting: allowSnapshotting,
      barrierDismissible: barrierDismissible,
    ),
  );
}
