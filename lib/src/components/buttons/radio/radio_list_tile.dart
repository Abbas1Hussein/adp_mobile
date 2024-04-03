import 'package:flutter/material.dart';

/// Creates a combination of a list tile and a platform adaptive radio.
///
/// The checkbox uses [Radio.adaptive] to show a [CupertinoRadio] for
/// iOS platforms, or [Radio] for Android.
class AdaptiveRadioListTile<T> extends RadioListTile<T> {
  const AdaptiveRadioListTile({
    super.key,
    super.mouseCursor,
    super.toggleable = false,
    super.activeColor,
    super.fillColor,
    super.hoverColor,
    super.overlayColor,
    super.splashRadius,
    super.materialTapTargetSize,
    super.title,
    super.subtitle,
    super.isThreeLine = false,
    super.dense,
    super.secondary,
    super.selected = false,
    super.controlAffinity = ListTileControlAffinity.platform,
    super.autofocus = false,
    super.contentPadding,
    super.shape,
    super.tileColor,
    super.selectedTileColor,
    super.visualDensity,
    super.focusNode,
    super.onFocusChange,
    super.enableFeedback,
    super.useCupertinoCheckmarkStyle = false,
    required super.value,
    required super.groupValue,
    required super.onChanged,
  }) : super.adaptive();
}
