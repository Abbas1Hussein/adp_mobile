import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';

class AdaptiveScrollbar extends CoreAdaptiveComponent {
  const AdaptiveScrollbar({
    super.key,
    super.builders,
    this.controller,
    this.thumbVisibility,
    this.thickness,
    this.radius,
    this.thumbColor,
    this.notificationPredicate,
    this.scrollbarOrientation,
    required this.child,
  });

  /// {@macro flutter.widgets.Scrollbar.child}
  final Widget child;

  /// The color of the scrollbar when the user is
  /// hovering or pressing it.
  final Color? thumbColor;

  /// {@macro flutter.widgets.Scrollbar.controller}
  final ScrollController? controller;

  /// {@macro flutter.widgets.Scrollbar.thumbVisibility}
  final bool? thumbVisibility;

  /// The thickness of the scrollbar in the cross axis of the scrollable.
  final double? thickness;

  /// The [Radius] of the scrollbar thumb's rounded rectangle corners.
  final Radius? radius;

  /// {@macro flutter.widgets.Scrollbar.notificationPredicate}
  final ScrollNotificationPredicate? notificationPredicate;

  /// {@macro flutter.widgets.Scrollbar.scrollbarOrientation}
  final ScrollbarOrientation? scrollbarOrientation;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return Scrollbar(
      controller: controller,
      radius: radius,
      thickness: thickness,
      notificationPredicate: notificationPredicate,
      scrollbarOrientation: scrollbarOrientation,
      thumbVisibility: thumbVisibility,
      child: child,
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoScrollbar(
      controller: controller,
      radius: radius ?? CupertinoScrollbar.defaultRadius,
      thickness: thickness ?? CupertinoScrollbar.defaultThickness,
      notificationPredicate: notificationPredicate ?? defaultScrollNotificationPredicate,
      scrollbarOrientation: scrollbarOrientation,
      thumbVisibility: thumbVisibility,
      child: child,
    );
  }
}