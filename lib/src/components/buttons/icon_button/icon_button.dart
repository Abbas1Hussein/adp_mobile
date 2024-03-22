import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import '../button/iOS.dart';

const _kAdpIconConstraints = BoxConstraints(minHeight: 20, minWidth: 30);

/// A custom icon button widget that adapts its appearance based on the platform.
///
/// Use this widget to create icon buttons with platform-specific:
class AdaptiveIconButton extends CoreAdaptiveComponent {
  /// Creates an instance of [AdaptiveIconButton].
  ///
  /// The [icon] is required and it specifies the widget to be used as the icon,
  /// typically an [AdaptiveIcon] widget.
  const AdaptiveIconButton({
    super.key,
    super.builders,
    this.onPressed,
    this.color,
    this.hoverColor,
    this.borderRadius,
    this.disabledColor,
    this.mouseCursor = MouseCursor.defer,
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
    this.color,
    this.hoverColor,
    this.borderRadius,
    this.disabledColor,
    this.mouseCursor = MouseCursor.defer,
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

  /// Defines the mouse cursor to be displayed when hovering over the icon button.
  final MouseCursor mouseCursor;

  /// The border radius to apply to the icon button. This defines the roundness of the corners
  /// of the button's background.
  ///
  /// if null, default radius is 4px.
  final BorderRadius? borderRadius;

  /// The additional constraints to impose on the child.
  ///
  /// if null, default [_kAdpIconConstraints] will be used.
  final BoxConstraints constraints;

  /// The background color of the icon button.
  ///
  /// If null, the default platform-specific background color will be used.
  final Color? color;

  /// The color of the button's background when the mouse hovers over it.
  final Color? hoverColor;

  /// The color to be used when the icon button is in a disabled state.
  ///
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    final buildLabel = label != null ? DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
            child: label!,
          ) : null;

    return IconButton(
      color: color,
      onPressed: onPressed,
      hoverColor: hoverColor,
      mouseCursor: mouseCursor,
      constraints: constraints,
      disabledColor: disabledColor,
      icon: icon.margeWith(buildLabel),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    final buildLabel = label != null ? DefaultTextStyle.merge(
            style: CupertinoTheme.of(context).textTheme.textStyle,
            child: label!,
          ) : null;

    return IOSButton(
      pressedOpacity: 0.45,
      padding: const EdgeInsets.all(4.0),
      onPressed: onPressed,
      constraints: constraints,
      mouseCursor: mouseCursor,
      hoverColor: hoverColor ?? Colors.transparent,
      pressedColor: hoverColor ?? Colors.transparent,
      child: Align(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: IconTheme.merge(
            data: CupertinoIconThemeData(
              color: onPressed != null ? color : (disabledColor ?? CupertinoColors.systemGrey),
            ).resolve(context),
            child: icon.margeWith(buildLabel, 6.0),
          ),
        ),
      ),
    );
  }
}
