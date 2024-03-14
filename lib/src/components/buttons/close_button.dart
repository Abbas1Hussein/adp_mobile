import 'package:flutter/material.dart';

import '../icon/icon.dart';
import '../icon/icons.dart';
import 'icon_button/icon_button.dart';

/// An adaptive close button widget that provides platform-specific styling and behavior.
class AdaptiveCloseButton extends StatelessWidget {
  const AdaptiveCloseButton({
    super.key,
    this.color,
    this.tooltip,
    this.hoverColor,
    this.afterClose,
    this.onPressed,
    this.mouseCursor = MouseCursor.defer,
  });

  /// The color of the back button.
  final Color? color;

  /// The color of the button's background when the mouse hovers over it.
  final Color? hoverColor;

  /// Callback function triggered when the back button is pressed.
  final VoidCallback? onPressed;

  /// Callback function to be executed after navigating close.
  final VoidCallback? afterClose;

  /// The mouse cursor to be displayed when hovering over the back button.
  final MouseCursor mouseCursor;

  /// A message for the Tooltip widget and a semantic label providing accessibility information
  /// for the close button.
  ///
  /// By Default is [MaterialLocalizations.of(context).closeButtonLabel].
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final closeLabel =
        tooltip ?? MaterialLocalizations.of(context).closeButtonLabel;

    return Semantics(
      button: true,
      label: closeLabel,
      child: Tooltip(
        message: closeLabel,
        child: AdaptiveIconButton(
          color: color,
          mouseCursor: mouseCursor,
          onPressed: () => _onTap(context),
          icon: const AdaptiveIcon(AdpIcons.clear),
        ),
      ),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    onPressed?.call();

    final canPop = await Navigator.maybePop(context);
    if (canPop) afterClose?.call();
  }
}
