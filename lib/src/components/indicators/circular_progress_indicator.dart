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
  ///
  /// See also:
  ///
  ///   * [AdaptiveProgressBarIndicator], a progress widget that shows progress in a horizontal bar.
  const AdaptiveCircularProgressIndicator({
    super.key,
    super.builders,
    this.color,
    this.radius = 15,
  });

  /// The border color of the progress circle.
  final Color? color;

  /// The radius of the progress circle, Defaults to 15px.
  final double radius;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return SizedBox(
      height: radius * 2,
      width: radius * 2,
      child: CircularProgressIndicator(color: color),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoActivityIndicator(color: color, radius: radius);
  }
}
