import 'package:flutter/cupertino.dart';

import '../../../core/extension/brightness.dart';
import '../../../core/extension/widget.dart';

/// A macOS style button.
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
    this.pressedOpacity = 0.4,
    this.mouseCursor = SystemMouseCursors.basic,
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

    final Brightness brightness = CupertinoTheme.brightnessOf(context);

    final disableBackgroundColor =
        widget.disabledColor ?? CupertinoColors.quaternarySystemFill;

    final backgroundColor =
        widget.backgroundColor ?? CupertinoColors.quaternarySystemFill;

    final fillColor = enabled ? backgroundColor : disableBackgroundColor;

    final hoverColor = widget.hoverColor ??
        brightness.resolve(
          darkColor: const Color(0xff3C383C),
          lightColor: const Color(0xffE5E5E5),
        );

    final pressedColor = widget.pressedColor ??
        brightness.resolve(
          darkColor: const Color(0xe6383438),
          lightColor: const Color(0xe8eae6e6),
        );

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
                  constraints: const BoxConstraints(minHeight: 25),
                  decoration: ShapeDecoration(
                    shape: widget.shape ??
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                    color: buttonHeldDown
                        ? pressedColor
                        : (_isHovered ? hoverColor : fillColor),
                  ),
                  child: Padding(
                    padding: widget.padding ??
                        const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 13.0),
                    child: Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      alignment: Alignment.center,
                      child: widget.child,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ).applyDisabledEffect(!enabled),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
