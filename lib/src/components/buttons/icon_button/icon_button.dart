import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import '../button/iOS.dart';

const _kAdpIconConstraints = BoxConstraints(minHeight: 20, minWidth: 30);

/// A custom icon button widget that adapts its appearance based on the platform.
///
/// Use this widget to create flat buttons with platform-specific
/// styling and behavior:
/// - On macOS, [MacosIconButton] is utilized.
/// - On Windows, [IconButton] is used.
class AdaptiveIconButton extends CoreAdaptiveComponent {
  /// Creates an instance of [AdaptiveIconButton].
  ///
  /// The [icon] is required and it specifies the widget to be used as the icon,
  /// typically an [AdaptiveIcon] widget.
  const AdaptiveIconButton({
    super.key,
    super.builders,
    this.onPressed,
    this.hoverColor,
    this.borderRadius,
    this.disabledColor,
    this.backgroundColor,
    this.constraints = _kAdpIconConstraints,
    required this.icon,
  }) : label = null;

  /// Creates an instance of [AdaptiveIconButton.label].
  ///
  /// The [icon] is required and it specifies the widget to be used as the icon,
  /// typically an [AdaptiveIcon] widget.
  ///
  /// The [label] is required and it specifies the widget to used within the [icon],
  /// typically an [Text] widget.
  const AdaptiveIconButton.label({
    super.key,
    super.builders,
    this.onPressed,
    this.hoverColor,
    this.borderRadius,
    this.disabledColor,
    this.backgroundColor,
    this.constraints = _kAdpIconConstraints,
    required Widget this.label,
    required this.icon,
  });

  /// The widget to use as the icon, typically an [AdaptiveIcon] widget.
  final Widget icon;

  /// The widget to use within the icon, typically an [Text] widget.
  final Widget? label;

  /// The callback that is called when the button is tapped.
  ///
  /// If this is set to null, the button will be disabled and [disabledColor] will used.
  final VoidCallback? onPressed;

  /// The additional constraints to impose on the child.
  ///
  /// if null, default [_kAdpIconConstraints] will be used.
  final BoxConstraints constraints;

  /// The border radius to apply to the icon button. This defines the roundness of the corners
  /// of the button's background.
  ///
  /// if null, default radius is 4px.
  final BorderRadius? borderRadius;

  /// The background color of the icon button.
  ///
  /// If null, the default platform-specific background color will be used.
  final Color? backgroundColor;

  /// The color to be used when the icon button is in a disabled state.
  ///
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  /// The color of the button's background when the mouse hovers over it.
  ///
  /// if null, [backgroundColor].withOpacity(0.8) will be used.
  final Color? hoverColor;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    final buildLabel = label != null ? DefaultTextStyle.merge(
            style: Theme.of(context).typography.dense.labelMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
            child: label!,
          ) : null;
    return IconButton(
      onPressed: onPressed,
      color: backgroundColor,
      hoverColor: hoverColor,
      constraints: constraints,
      disabledColor: disabledColor,
      icon: icon.margeWith(buildLabel),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    final buildLabel = label != null ? DefaultTextStyle.merge(
            style: Theme.of(context).typography.tall.labelLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
            child: label!,
          ) : null;
    return ConstrainedBox(
      constraints: constraints,
      child: IOSButton(
        onPressed: onPressed,
        hoverColor: hoverColor ?? backgroundColor?.withOpacity(0.8),
        disabledColor: disabledColor,
        backgroundColor: backgroundColor ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(7)),
        ),
        child: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: icon.margeWith(buildLabel),
          ),
        ),
      ),
    );
  }
}
