import 'package:flutter/material.dart';

/// Creates a combination of a list tile and a platform adaptive checkbox.
///
/// The checkbox uses [Checkbox.adaptive] to show a [CupertinoCheckbox] for
/// iOS platforms, or [Checkbox] for android.
class AdaptiveCheckboxListTile extends CheckboxListTile {
  const AdaptiveCheckboxListTile({
    super.key,
    super.activeColor,
    super.autofocus,
    super.checkboxSemanticLabel,
    super.checkboxShape,
    super.checkColor,
    super.contentPadding,
    super.controlAffinity,
    super.dense,
    super.enabled,
    super.enableFeedback,
    super.fillColor,
    super.focusNode,
    super.hoverColor,
    super.isError,
    super.isThreeLine,
    super.materialTapTargetSize,
    super.mouseCursor,
    super.onFocusChange,
    super.overlayColor,
    super.secondary,
    super.selected,
    super.selectedTileColor,
    super.shape,
    super.side,
    super.splashRadius,
    super.subtitle,
    super.tileColor,
    super.title,
    super.tristate,
    super.visualDensity,
    required super.value,
    required super.onChanged,
  }) : super.adaptive();
}
