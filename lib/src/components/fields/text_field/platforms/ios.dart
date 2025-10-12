import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../../../core/common/construct/property.dart';
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

class TextFieldIOS extends StatelessWidget {
  const TextFieldIOS({super.key, this.property, this.fieldProperties});

  final FieldIOSProperty? property;
  final FieldProperties? fieldProperties;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: fieldProperties?.padding ?? const EdgeInsets.all(4.0),
      child: TextFieldTapRegion(
        onTapOutside: fieldProperties?.onTapOutside,
        child: CupertinoTextField(
          key: key,
          onTap: fieldProperties?.onTap,
          onChanged: fieldProperties?.onChanged,
          onSubmitted: fieldProperties?.onSubmitted,
          onEditingComplete: fieldProperties?.onEditingComplete,
          placeholder: fieldProperties?.placeholder,
          placeholderStyle:
              fieldProperties?.placeholderStyle ?? kDefaultPlaceholderStyle,
          decoration: property?.decoration ?? kDefaultRoundedBorderDecoration,
          clipBehavior: fieldProperties?.clipBehavior ?? Clip.hardEdge,
          textDirection: fieldProperties?.textDirection,
          stylusHandwritingEnabled: fieldProperties?.stylusHandwritingEnabled ?? true,
          spellCheckConfiguration: fieldProperties?.spellCheckConfiguration,
          enableIMEPersonalizedLearning:
              fieldProperties?.enableIMEPersonalizedLearning ?? true,
          cursorOpacityAnimates: fieldProperties?.cursorOpacityAnimates ?? true,
          contentInsertionConfiguration:
              fieldProperties?.contentInsertionConfiguration,
          magnifierConfiguration: fieldProperties?.magnifierConfiguration,
          style: fieldProperties?.style,
          suffixMode: property?.suffixMode ?? OverlayVisibilityMode.always,
          prefixMode: property?.suffixMode ?? OverlayVisibilityMode.always,
          clearButtonMode:
              property?.clearButtonMode ?? OverlayVisibilityMode.never,
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: fieldProperties?.prefix,
          ),
          suffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: fieldProperties?.suffix,
          ),
          enabled: fieldProperties?.enabled ?? true,
          maxLines: fieldProperties?.maxLines ?? 1,
          minLines: fieldProperties?.minLines,
          focusNode: fieldProperties?.focusNode,
          maxLength: fieldProperties?.maxLength,
          strutStyle: fieldProperties?.strutStyle,
          showCursor: fieldProperties?.showCursor,
          controller: fieldProperties?.controller,
          undoController: fieldProperties?.undoController,
          cursorColor: fieldProperties?.cursorColor,
          expands: fieldProperties?.expands ?? false,
          cursorHeight: fieldProperties?.cursorHeight,
          keyboardType: fieldProperties?.keyboardType,
          readOnly: fieldProperties?.readOnly ?? false,
          restorationId: fieldProperties?.restorationId,
          scrollPhysics: fieldProperties?.scrollPhysics,
          autofillHints: fieldProperties?.autofillHints,
          autofocus: fieldProperties?.autofocus ?? false,
          cursorWidth: fieldProperties?.cursorWidth ?? 2.0,
          smartDashesType: fieldProperties?.smartDashesType,
          smartQuotesType: fieldProperties?.smartQuotesType,
          autocorrect: fieldProperties?.autocorrect ?? true,
          textInputAction: fieldProperties?.textInputAction,
          inputFormatters: fieldProperties?.inputFormatters,
          obscureText: fieldProperties?.obscureText ?? false,
          scrollController: fieldProperties?.scrollController,
          selectionControls: fieldProperties?.selectionControls,
          textAlignVertical: fieldProperties?.textAlignVertical,
          obscuringCharacter: fieldProperties?.obscuringCharacter ?? '•',
          keyboardAppearance: fieldProperties?.keyboardAppearance,
          contextMenuBuilder:
              fieldProperties?.contextMenuBuilder ?? kDefaultContextMenuBuilder,
          textAlign: fieldProperties?.textAlign ?? TextAlign.start,
          maxLengthEnforcement: fieldProperties?.maxLengthEnforcement,
          enableSuggestions: fieldProperties?.enableSuggestions ?? true,
          cursorRadius:
              fieldProperties?.cursorRadius ?? const Radius.circular(2.0),
          scrollPadding:
              fieldProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
          enableInteractiveSelection:
              fieldProperties?.enableInteractiveSelection ?? true,
          selectionWidthStyle:
              fieldProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
          dragStartBehavior:
              fieldProperties?.dragStartBehavior ?? DragStartBehavior.start,
          selectionHeightStyle:
              fieldProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
          textCapitalization:
              fieldProperties?.textCapitalization ?? TextCapitalization.none,
        ),
      ),
    );
  }

  static Widget kDefaultContextMenuBuilder(
      BuildContext context, EditableTextState editableTextState) {
    return CupertinoAdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }
}

class FieldIOSProperty extends CoreIOSProperty {
  const FieldIOSProperty({
    this.decoration = kDefaultRoundedBorderDecoration,
    this.prefixMode = OverlayVisibilityMode.always,
    this.suffixMode = OverlayVisibilityMode.always,
    this.clearButtonMode = OverlayVisibilityMode.never,
  });

  /// Controls the [BoxDecoration] of the box behind the text input.
  ///
  /// Defaults to having a rounded rectangle grey border and can be null to have
  /// no box decoration.
  final BoxDecoration? decoration;

  /// Controls the visibility of the [prefix] widget based on the state of
  /// text entry when the [prefix] argument is not null.
  ///
  /// Defaults to [OverlayVisibilityMode.always].
  ///
  /// Has no effect when [prefix] is null.
  final OverlayVisibilityMode prefixMode;

  /// Controls the visibility of the [suffix] widget based on the state of
  /// text entry when the [suffix] argument is not null.
  ///
  /// Defaults to [OverlayVisibilityMode.always].
  ///
  /// Has no effect when [suffix] is null.
  final OverlayVisibilityMode suffixMode;

  /// Show an iOS-style clear button to clear the current text entry.
  ///
  /// Can be made to appear depending on various text states of the
  /// [TextEditingController].
  ///
  /// Will only appear if no [suffix] widget is appearing.
  ///
  /// Defaults to [OverlayVisibilityMode.never].
  final OverlayVisibilityMode clearButtonMode;
}
