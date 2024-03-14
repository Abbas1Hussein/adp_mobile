import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';

/// A scrollbar is a crucial interaction element in user interfaces, facilitating the navigation of content within a limited viewport.
/// It allows users to access all the content, even if it exceeds the available screen space,
/// by scrolling in various directions such as up, down, left, or right.
///
/// Use this widget to create scrollbar buttons with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoScrollbar] is utilized.
/// - On Android, [Scrollbar] is used.
class AdaptiveScrollbar extends CoreAdaptiveComponent {
  /// Creates an adaptive style scrollbar that wraps the given [child].
  ///
  /// The [child] should be a source of [ScrollNotification] notifications,
  /// typically a [Scrollable] widget.
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