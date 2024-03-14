import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/common/construct/component.dart';

/// An adaptive back button widget that provides platform-specific styling and behavior.
class AdaptiveBackButton extends CoreAdaptiveComponent {
  const AdaptiveBackButton({
    super.key,
    this.color,
    this.afterBack,
    this.onPressed,
    this.tooltip,
    this.mouseCursor = MouseCursor.defer,
  });

  /// The color of the back button.
  final Color? color;

  /// Callback function triggered when the back button is pressed.
  final VoidCallback? onPressed;

  /// Callback function to be executed after navigating back.
  final VoidCallback? afterBack;

  /// The mouse cursor to be displayed when hovering over the back button.
  final MouseCursor mouseCursor;

  /// A message for the Tooltip widget and a semantic label providing accessibility information
  /// for the back button.
  ///
  /// By Default is [MaterialLocalizations.of(context).backButtonTooltip].
  final String? tooltip;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return _buildBackButton(
      context,
      BackButton(color: color, onPressed: () => _onTap(context)),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return _buildBackButton(
      context,
      CupertinoNavigationBarBackButton(
        color: color,
        onPressed: () => _onTap(context),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context, Widget child) {
    final label =
        tooltip ?? MaterialLocalizations.of(context).backButtonTooltip;

    return Semantics(
      label: label,
      button: true,
      child: Tooltip(
        message: label,
        child: MouseRegion(cursor: mouseCursor, child: child),
      ),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    onPressed?.call();

    final canPop = await Navigator.maybePop(context);
    if (canPop) afterBack?.call();
  }
}
