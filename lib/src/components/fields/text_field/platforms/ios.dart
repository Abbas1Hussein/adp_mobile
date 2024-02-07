import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../fields_properties.dart';

const TextStyle kDefaultPlaceholderStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: CupertinoColors.placeholderText,
);

// Value inspected from Xcode 11 & iOS 13.0 Simulator.
const BorderSide kDefaultRoundedBorderSide = BorderSide(
  color: CupertinoDynamicColor.withBrightness(
    color: Color(0x33000000),
    darkColor: Color(0x33FFFFFF),
  ),
  width: 0.0,
);
const Border kDefaultRoundedBorder = Border(
  top: kDefaultRoundedBorderSide,
  bottom: kDefaultRoundedBorderSide,
  left: kDefaultRoundedBorderSide,
  right: kDefaultRoundedBorderSide,
);

const BoxDecoration kDefaultRoundedBorderDecoration = BoxDecoration(
  color: CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.white,
    darkColor: CupertinoColors.black,
  ),
  border: kDefaultRoundedBorder,
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
);

const Color _kDisabledBackground = CupertinoDynamicColor.withBrightness(
  color: Color(0xFFFAFAFA),
  darkColor: Color(0xFF050505),
);

// Value inspected from Xcode 12 & iOS 14.0 Simulator.
// Note it may not be consistent with https://developer.apple.com/design/resources/.
const CupertinoDynamicColor _kClearButtonColor =
    CupertinoDynamicColor.withBrightness(
  color: Color(0x33000000),
  darkColor: Color(0x33FFFFFF),
);

Widget kDefaultContextMenuBuilder(
  BuildContext context,
  EditableTextState editableTextState,
) {
  return CupertinoAdaptiveTextSelectionToolbar.editableText(
    editableTextState: editableTextState,
  );
}

class TextFieldMacos extends StatelessWidget {
  const TextFieldMacos({super.key, this.adpProperties});

  final AdaptiveFieldProperties? adpProperties;

  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      onTapOutside: adpProperties?.onTapOutside,
      child: DecoratedBox(
        decoration: adpProperties?.decoration?.copyWith(
              color: adpProperties?.decoration?.color?.withOpacity(0.7),
            ) ??
            const BoxDecoration(),
        child: CupertinoTextField(
          key: key,
          onTap: adpProperties?.onTap,
          onChanged: adpProperties?.onChanged,
          onSubmitted: adpProperties?.onSubmitted,
          onEditingComplete: adpProperties?.onEditingComplete,
          placeholder: adpProperties?.placeholder,
          placeholderStyle: adpProperties?.placeholderStyle ?? kDefaultPlaceholderStyle,
          clearButtonMode: OverlayVisibilityMode.editing,
          padding: adpProperties?.padding ?? const EdgeInsets.all(4.0),
          decoration: adpProperties?.decoration != null ? null : kDefaultRoundedBorderDecoration,
          prefix: adpProperties?.prefix,
          style: adpProperties?.style,
          suffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: adpProperties?.suffix,
          ),
          enabled: adpProperties?.enabled ?? true,
          maxLines: adpProperties?.maxLines ?? 1,
          minLines: adpProperties?.minLines,
          focusNode: adpProperties?.focusNode,
          maxLength: adpProperties?.maxLength,
          strutStyle: adpProperties?.strutStyle,
          showCursor: adpProperties?.showCursor,
          controller: adpProperties?.controller,
          cursorColor: adpProperties?.cursorColor,
          expands: adpProperties?.expands ?? false,
          cursorHeight: adpProperties?.cursorHeight,
          keyboardType: adpProperties?.keyboardType,
          readOnly: adpProperties?.readOnly ?? false,
          restorationId: adpProperties?.restorationId,
          scrollPhysics: adpProperties?.scrollPhysics,
          autofillHints: adpProperties?.autofillHints,
          autofocus: adpProperties?.autofocus ?? false,
          cursorWidth: adpProperties?.cursorWidth ?? 2.0,
          smartDashesType: adpProperties?.smartDashesType,
          smartQuotesType: adpProperties?.smartQuotesType,
          autocorrect: adpProperties?.autocorrect ?? true,
          textInputAction: adpProperties?.textInputAction,
          inputFormatters: adpProperties?.inputFormatters,
          obscureText: adpProperties?.obscureText ?? false,
          scrollController: adpProperties?.scrollController,
          selectionControls: adpProperties?.selectionControls,
          textAlignVertical: adpProperties?.textAlignVertical,
          obscuringCharacter: adpProperties?.obscuringCharacter ?? '•',
          keyboardAppearance: adpProperties?.keyboardAppearance,
          contextMenuBuilder:
              adpProperties?.contextMenuBuilder ?? kDefaultContextMenuBuilder,
          textAlign: adpProperties?.textAlign ?? TextAlign.start,
          maxLengthEnforcement: adpProperties?.maxLengthEnforcement,
          enableSuggestions: adpProperties?.enableSuggestions ?? true,
          cursorRadius:
              adpProperties?.cursorRadius ?? const Radius.circular(2.0),
          scrollPadding:
              adpProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
          enableInteractiveSelection:
              adpProperties?.enableInteractiveSelection ?? true,
          selectionWidthStyle:
              adpProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
          dragStartBehavior:
              adpProperties?.dragStartBehavior ?? DragStartBehavior.start,
          selectionHeightStyle:
              adpProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
          textCapitalization:
              adpProperties?.textCapitalization ?? TextCapitalization.none,
        ),
      ),
    );
  }
}
