import 'package:flutter/material.dart';

/// Creates an adaptive [RefreshIndicator] based on whether the target
/// platform is iOS or Android.
///
/// When the descendant overscroll, a different spinning progress indicator
/// is shown depending on platform.
///
/// On IOS [CupertinoActivityIndicator] will be used. On Android a Material design
/// [CircularProgressIndicator] will be used.
///
/// If a [CupertinoActivityIndicator] is shown (on iOS), the following parameters are ignored:
/// [backgroundColor], [semanticsLabel], [semanticsValue], [strokeWidth].
///
/// Notably the scrollable widget itself will have slightly different behavior
/// from [CupertinoSliverRefreshControl], due to a difference in structure.
class AdaptiveRefreshIndicator extends RefreshIndicator {
  const AdaptiveRefreshIndicator({
    super.key,
    super.color,
    super.displacement = 40.0,
    super.edgeOffset = 0.0,
    super.backgroundColor,
    super.semanticsLabel,
    super.semanticsValue,
    super.notificationPredicate = defaultScrollNotificationPredicate,
    super.strokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    super.triggerMode = RefreshIndicatorTriggerMode.onEdge,
    required super.child,
    required super.onRefresh,
  }) : super.adaptive();
}
