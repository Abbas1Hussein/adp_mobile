import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/common/construct/component.dart';

class AdaptiveBackButton extends CoreAdaptiveComponent {
  const AdaptiveBackButton({
    super.key,
    this.color,
    this.afterBack,
    this.onPressed,
    this.semanticLabel,
    this.mouseCursor = MouseCursor.defer,
  });

  /// Defines the color of the back button.
  final Color? color;

  /// Callback function triggered when the back button is pressed.
  final VoidCallback? onPressed;

  /// Callback function to be executed after navigating back.
  final VoidCallback? afterBack;

  /// Defines the mouse cursor to be displayed when hovering over the back button.
  final MouseCursor mouseCursor;

  /// A semantic label providing accessibility information for the back button
  /// and also serving as the message for the Tooltip widget.
  final String? semanticLabel;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    final label =
        semanticLabel ?? MaterialLocalizations.of(context).backButtonTooltip;

    return Tooltip(
      message: label,
      child: Semantics(
        label: label,
        child: MouseRegion(
          cursor: mouseCursor,
          child: BackButton(
            color: color,
            onPressed: () => _onTap(context),
          ),
        ),
      ),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    final label =
        semanticLabel ?? MaterialLocalizations.of(context).backButtonTooltip;

    return Tooltip(
      message: label,
      child: Semantics(
        label: label,
        child: MouseRegion(
          cursor: mouseCursor,
          child: CupertinoNavigationBarBackButton(
            color: color,
            onPressed: () => _onTap(context),
          ),
        ),
      ),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    onPressed?.call();

    final canPop = await Navigator.maybePop(context);

    if (canPop) afterBack?.call();
  }
}
