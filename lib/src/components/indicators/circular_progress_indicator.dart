import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';

/// A progress control provides feedback to the user that a long-running
/// operation is underway. It can mean that the user cannot interact with the
/// app when the progress indicator is visible, and can also indicate how long
/// the wait time might be.
///
/// It can be determinate or indeterminate.
///
/// Use this widget to create circular progress indicator with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoActivityIndicator] is used.
/// - On Android, [CircularProgressIndicator] is used.
class AdaptiveCircularProgressIndicator extends CoreAdaptiveComponent {
  /// Creates an AdaptiveCircularProgressIndicator.
  ///
  /// [radius] must be non-negative
  const AdaptiveCircularProgressIndicator(
      { super.key, super.builders, this.progress, this.color, this.radius = 15 })
      : assert(radius > 0.0);

  /// The color of the progress circle.
  final Color? color;

  /// The radius of the progress circle, Defaults to 15px.
  final double radius;

  /// If non-null, the value of this progress indicator.
  ///
  /// A value of 0.0 means no progress and 1.0 means that progress is complete.
  /// The value will be clamped to be in the range 0.0-1.0.
  ///
  /// If null, this progress indicator is indeterminate, which means the
  /// indicator displays a predetermined animation that does not indicate how
  /// much actual progress is being made.
  final double? progress;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: CircularProgressIndicator(color: color, value: progress),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    if (progress != null) {
      return CupertinoActivityIndicator.partiallyRevealed(
        color: color,
        radius: radius,
        progress: progress!.clamp(0, 1),
      );
    }
    return CupertinoActivityIndicator(color: color, radius: radius);
  }
}
