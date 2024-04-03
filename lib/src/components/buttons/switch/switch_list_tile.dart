import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Creates a Material [ListTile] with an adaptive [Switch], following
/// Material design's
/// [Cross-platform guidelines](https://material.io/design/platform-guidance/cross-platform-adaptation.html).
///
/// This widget uses [Switch.adaptive] to change the graphics of the switch
/// component.
///
/// On IOS [CupertinoSwitch] will be used. On Android a Material design
/// [Switch] will be used.
///
/// If a [CupertinoSwitch] is created (on iOS), the following parameters are
/// ignored: [activeTrackColor], [inactiveThumbColor], [inactiveTrackColor],
/// [activeThumbImage], [inactiveThumbImage].
class AdaptiveSwitchListTile extends SwitchListTile {
  const AdaptiveSwitchListTile({
    super.key,
    super.activeColor,
    super.activeTrackColor,
    super.inactiveThumbColor,
    super.inactiveTrackColor,
    super.activeThumbImage,
    super.onActiveThumbImageError,
    super.inactiveThumbImage,
    super.onInactiveThumbImageError,
    super.thumbColor,
    super.trackColor,
    super.trackOutlineColor,
    super.thumbIcon,
    super.materialTapTargetSize,
    super.dragStartBehavior = DragStartBehavior.start,
    super.mouseCursor,
    super.overlayColor,
    super.splashRadius,
    super.focusNode,
    super.onFocusChange,
    super.autofocus = false,
    super.applyCupertinoTheme,
    super.tileColor,
    super.title,
    super.subtitle,
    super.isThreeLine = false,
    super.dense,
    super.contentPadding,
    super.secondary,
    super.selected = false,
    super.controlAffinity = ListTileControlAffinity.platform,
    super.shape,
    super.selectedTileColor,
    super.visualDensity,
    super.enableFeedback,
    super.hoverColor,
    required super.value,
    required super.onChanged,
  }) : super.adaptive();
}
