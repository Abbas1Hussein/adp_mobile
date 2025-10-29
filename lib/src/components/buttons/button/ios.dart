import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/widget.dart';

const EdgeInsets _kButtonPadding = EdgeInsets.all(16.0);
const EdgeInsets _kBackgroundButtonPadding = EdgeInsets.symmetric(
  vertical: 14.0,
  horizontal: 64.0,
);

/// A iOS style button.
class IOSButton extends StatefulWidget {
  const IOSButton({
    super.key,
    this.shape,
    this.onPressed,
    this.onLongPress,
    this.hoverColor,
    this.pressedColor,
    this.backgroundColor,
    this.disabledColor,
    this.padding,
    this.pressedOpacity = 0.90,
    this.mouseCursor = SystemMouseCursors.basic,
    this.constraints,
    required this.child,
  });

  final Widget child;
  final Color? hoverColor;
  final Color? pressedColor;
  final Color? backgroundColor;
  final Color? disabledColor;
  final double pressedOpacity;

  final MouseCursor mouseCursor;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  final ShapeBorder? shape;
  final EdgeInsetsGeometry? padding;

  final BoxConstraints? constraints;

  bool get enabled => onPressed != null || onLongPress != null;

  @override
  IOSButtonState createState() => IOSButtonState();
}

class IOSButtonState extends State<IOSButton>
    with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);

  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);

    _setTween();
  }

  @override
  void didUpdateWidget(IOSButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setTween();
  }

  void _setTween() => _opacityTween.end = widget.pressedOpacity;

  @visibleForTesting
  bool buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!buttonHeldDown) {
      buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (buttonHeldDown) {
      buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (buttonHeldDown) {
      buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) return;

    final bool wasHeldDown = buttonHeldDown;

    final TickerFuture ticker = wasHeldDown
        ? _animationController.animateTo(1.0,
            duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
        : _animationController.animateTo(0.0,
            duration: kFadeInDuration, curve: Curves.easeOutCubic);

    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != buttonHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;
    final theme = CupertinoTheme.of(context);

    final disableBackgroundColor =
        widget.disabledColor ?? CupertinoColors.quaternarySystemFill;

    final backgroundColor =
        CupertinoDynamicColor.maybeResolve(widget.backgroundColor, context);

    final fillColor = enabled ? backgroundColor : disableBackgroundColor;

    Color hoverColor = CupertinoDynamicColor.resolve(
      widget.backgroundColor != null &&
              widget.backgroundColor != Colors.transparent
          ? widget.backgroundColor!.withValues(alpha: 0.7)
          : widget.hoverColor ?? Colors.transparent,
      context,
    );

    Color pressedColor = CupertinoDynamicColor.resolve(
      widget.backgroundColor != null &&
              widget.backgroundColor != Colors.transparent
          ? widget.backgroundColor!.withValues(alpha: 0.7)
          : widget.pressedColor ?? Colors.transparent,
      context,
    );

    final foregroundColor = widget.backgroundColor != null
        ? theme.primaryContrastingColor
        : enabled
            ? theme.primaryColor
            : CupertinoDynamicColor.resolve(
                CupertinoColors.placeholderText, context);

    final textStyle =
        theme.textTheme.textStyle.copyWith(color: foregroundColor);

    return MouseRegion(
      cursor: enabled ? widget.mouseCursor : SystemMouseCursors.forbidden,
      onEnter: (e) {
        if (enabled) setState(() => _isHovered = true);
      },
      onExit: (e) {
        if (enabled) setState(() => _isHovered = false);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapCancel: enabled ? _handleTapCancel : null,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTap: widget.onPressed,
        onLongPress: widget.onLongPress,
        child: Semantics(
          button: true,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context, _) {
                return Container(
                  constraints: widget.constraints ??
                      const BoxConstraints(
                        minWidth: kMinInteractiveDimensionCupertino,
                        minHeight: kMinInteractiveDimensionCupertino,
                      ),
                  decoration: ShapeDecoration(
                    shape: widget.shape ??
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                    color: buttonHeldDown
                        ? pressedColor
                        : (_isHovered ? hoverColor : fillColor),
                  ),
                  child: Padding(
                    padding: widget.padding ??
                        (widget.backgroundColor != null
                            ? _kBackgroundButtonPadding
                            : _kButtonPadding),
                    child: Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      alignment: Alignment.center,
                      child: DefaultTextStyle(
                          style: textStyle, child: widget.child),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ).applyDisabledEffect(!enabled, 0.65),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
