import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../fields_properties.dart';
import '../../text_field/platforms/android.dart';

class TextFormFieldAndroid extends StatelessWidget {
  const TextFormFieldAndroid({super.key, this.property, this.fieldProperties});

  final FormFieldAndroidProperty? property;
  final FormFieldProperties? fieldProperties;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: fieldProperties?.padding ?? const EdgeInsets.all(4.0),
      child: TextFieldTapRegion(
        onTapOutside: fieldProperties?.onTapOutside,
        child: TextFormField(
          onTap: fieldProperties?.onTap,
          onSaved: fieldProperties?.onSaved,
          validator: fieldProperties?.validator,
          onChanged: fieldProperties?.onChanged,
          onFieldSubmitted: fieldProperties?.onFieldSubmitted,
          onEditingComplete: fieldProperties?.onEditingComplete,
          clipBehavior: fieldProperties?.clipBehavior ?? Clip.hardEdge,
          textDirection: fieldProperties?.textDirection,
          scribbleEnabled: fieldProperties?.scribbleEnabled ?? true,
          spellCheckConfiguration: fieldProperties?.spellCheckConfiguration,
          enableIMEPersonalizedLearning:
              fieldProperties?.enableIMEPersonalizedLearning ?? true,
          cursorOpacityAnimates: fieldProperties?.cursorOpacityAnimates ?? true,
          contentInsertionConfiguration:
              fieldProperties?.contentInsertionConfiguration,
          magnifierConfiguration: fieldProperties?.magnifierConfiguration,
          style: fieldProperties?.style,
          enabled: fieldProperties?.enabled ?? true,
          contextMenuBuilder: fieldProperties?.contextMenuBuilder ??
              TextFieldAndroid.kDefaultContextMenuBuilder,
          initialValue: fieldProperties?.initialValue,
          autovalidateMode: fieldProperties?.autovalidateMode,
          maxLines: fieldProperties?.maxLines ?? 1,
          minLines: fieldProperties?.minLines,
          focusNode: fieldProperties?.focusNode,
          maxLength: fieldProperties?.maxLength,
          decoration: InputDecoration(
            label: property?.label,
            filled: property?.filled,
            isDense: property?.isDense,
            alignLabelWithHint: property?.alignLabelWithHint,
            border: property?.border,
            disabledBorder: property?.disabledBorder,
            floatingLabelStyle: property?.floatingLabelStyle,
            floatingLabelAlignment: property?.floatingLabelAlignment,
            floatingLabelBehavior: property?.floatingLabelBehavior,
            error: property?.error,
            errorBorder: property?.errorBorder,
            prefixIcon: fieldProperties?.prefix,
            suffixIcon: fieldProperties?.suffix,
            hintText: fieldProperties?.placeholder,
            hintStyle: fieldProperties?.placeholderStyle,
          ),
          strutStyle: fieldProperties?.strutStyle,
          showCursor: fieldProperties?.showCursor,
          controller: fieldProperties?.controller,
          undoController: fieldProperties?.undoController,
          cursorColor: fieldProperties?.cursorColor,
          expands: fieldProperties?.expands ?? false,
          cursorHeight: fieldProperties?.cursorHeight,
          keyboardType: fieldProperties?.keyboardType,
          restorationId: fieldProperties?.restorationId,
          readOnly: fieldProperties?.readOnly ?? false,
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
          keyboardAppearance: fieldProperties?.keyboardAppearance,
          textAlign: fieldProperties?.textAlign ?? TextAlign.start,
          maxLengthEnforcement: fieldProperties?.maxLengthEnforcement,
          enableSuggestions: fieldProperties?.enableSuggestions ?? true,
          obscuringCharacter: fieldProperties?.obscuringCharacter ?? '•',
          enableInteractiveSelection:
              fieldProperties?.enableInteractiveSelection,
          cursorRadius:
              fieldProperties?.cursorRadius ?? const Radius.circular(2.0),
          scrollPadding:
              fieldProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
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
}

class FormFieldAndroidProperty extends FieldAndroidProperty {
  const FormFieldAndroidProperty({
    super.label,
    super.filled = false,
    super.isDense = false,
    super.alignLabelWithHint = false,
    super.border,
    super.disabledBorder,
    super.floatingLabelAlignment,
    super.floatingLabelBehavior,
    super.floatingLabelStyle,
    this.error,
    this.errorBorder,
  });

  /// Optional widget that appears below the [InputDecorator.child] and the border.
  ///
  /// If non-null, the border's color animates to red and the [helperText] is not shown.
  ///
  /// Only one of [error] and [errorText] can be specified.
  final Widget? error;

  /// The border to display when the [InputDecorator] does not have the focus and
  /// is showing an error.
  ///
  /// See also:
  ///
  ///  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
  ///    line at the bottom of the input decorator's container.
  ///  * [OutlineInputBorder], an [InputDecorator] border which draws a
  ///    rounded rectangle around the input decorator's container.
  final InputBorder? errorBorder;
}
