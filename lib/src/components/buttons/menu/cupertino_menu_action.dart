import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

const Color _kBackgroundColor = CupertinoDynamicColor.withBrightness(
  color: Color(0xFFF1F1F1),
  darkColor: Color(0xFF212122),
);
const Color _kBackgroundColorPressed = CupertinoDynamicColor.withBrightness(
  color: Color(0xFFDDDDDD),
  darkColor: Color(0xFF3F3F40),
);
const double _kButtonMinHeight = 43;

const TextStyle _kActionSheetActionStyle = TextStyle(
  fontFamily: '.SF UI Text',
  inherit: false,
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  color: CupertinoColors.black,
  textBaseline: TextBaseline.alphabetic,
);

/// A button in a [PopupMenuIOS] and [PulldownMenuIOS] used.
///
/// A typical use case is to pass a [Text] as the [child] here, but be sure to
/// use [TextOverflow.ellipsis] for the [Text.overflow] field if the text may be
/// long, as without it the text will wrap to the next line.
class CupertinoMenuAction extends StatefulWidget {
  const CupertinoMenuAction({
    super.key,
    this.padding,
    this.trailing,
    this.textStyle,
    this.pressedColor,
    this.backgroundColor,
    this.onPressed,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.child,
  });

  /// The widget that will be placed inside the action.
  final Widget? child;

  /// An optional icon to display to the right of the child.
  ///
  /// Will be colored in the same way as the [TextStyle] used for [child].
  final Widget? trailing;

  /// Called when the action is pressed.
  final VoidCallback? onPressed;

  /// The text style to apply to the child widget.
  final TextStyle? textStyle;

  /// The background color of the action.
  final Color? backgroundColor;

  /// The color of the action when pressed.
  final Color? pressedColor;

  /// The padding around the content of the action.
  final EdgeInsetsGeometry? padding;

  final MainAxisAlignment mainAxisAlignment;

  @override
  State<CupertinoMenuAction> createState() => _CupertinoMenuActionState();
}

class _CupertinoMenuActionState extends State<CupertinoMenuAction> {
  bool _isPressed = false;

  void onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  void onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onPressed != null && kIsWeb
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      child: GestureDetector(
        onTapUp: onTapUp,
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        onTap: widget.onPressed,
        behavior: HitTestBehavior.opaque,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: _kButtonMinHeight),
          child: Semantics(
            button: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: _isPressed
                    ? CupertinoDynamicColor.resolve(pressedColor, context)
                    : CupertinoDynamicColor.resolve(backgroundColor, context),
              ),
              padding: widget.padding ??
                  const EdgeInsets.only(
                      top: 8, bottom: 8, left: 15.5, right: 17.5),
              child: DefaultTextStyle(
                style: _textStyle,
                child: Row(
                  mainAxisAlignment: widget.mainAxisAlignment,
                  children: <Widget>[
                    if (widget.child != null) Flexible(child: widget.child!),
                    if (widget.trailing != null)
                      IconTheme.merge(
                        data: CupertinoIconThemeData(
                          color: _textStyle.color,
                          size: 21,
                        ),
                        child: widget.trailing!,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color get backgroundColor => widget.backgroundColor ?? _kBackgroundColor;

  Color get pressedColor => widget.pressedColor ?? _kBackgroundColorPressed;

  TextStyle get _textStyle {
    return widget.textStyle ??
        _kActionSheetActionStyle.copyWith(
          color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
        );
  }
}
