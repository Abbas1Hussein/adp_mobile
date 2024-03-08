import 'package:flutter/material.dart';

import '../icon/icon.dart';
import '../icon/icons.dart';
import 'icon_button/icon_button.dart';

class AdaptiveCloseButton extends StatelessWidget {
  const AdaptiveCloseButton({
    super.key,
    this.color,
    this.hoverColor,
    this.afterClose,
    this.onPressed,
    this.mouseCursor = MouseCursor.defer,
  });

  /// The color of the close button.
  final Color? color;

  /// The color of the button's background when the mouse hovers over it.
  final Color? hoverColor;

  /// The mouse cursor to be displayed when hovering over the close button.
  final MouseCursor mouseCursor;

  /// Callback function to be executed after navigating close.
  final VoidCallback? afterClose;

  /// Callback function triggered when the close button is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final closeLabel = MaterialLocalizations.of(context).closeButtonLabel;

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

