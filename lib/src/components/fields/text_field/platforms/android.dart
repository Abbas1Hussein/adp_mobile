import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';
import '../../fields_properties.dart';

class TextFieldAndroid extends StatelessWidget {
  const TextFieldAndroid({super.key, this.property, this.fieldProperties});

  final FieldAndroidProperty? property;
  final FieldProperties? fieldProperties;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: fieldProperties?.padding ?? const EdgeInsets.all(4.0),
      child: TextFieldTapRegion(
        onTapOutside: fieldProperties?.onTapOutside,
        child: TextField(
          key: key,
          onTap: fieldProperties?.onTap,
          onChanged: fieldProperties?.onChanged,
          onSubmitted: fieldProperties?.onSubmitted,
          onEditingComplete: fieldProperties?.onEditingComplete,
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
          enabled: fieldProperties?.enabled,
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
          contextMenuBuilder:
              fieldProperties?.contextMenuBuilder ?? kDefaultContextMenuBuilder,
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

  static Widget kDefaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }
}

class FieldAndroidProperty extends CoreAndroidProperty {
  const FieldAndroidProperty({
    this.label,
    this.filled = false,
    this.isDense = false,
    this.alignLabelWithHint = false,
    this.border,
    this.disabledBorder,
    this.floatingLabelAlignment,
    this.floatingLabelBehavior,
    this.floatingLabelStyle,
  });

  /// If true the decoration's container is filled with [fillColor].
  ///
  /// Typically this field set to true if [border] is an [UnderlineInputBorder].
  ///
  /// The decoration's container is the area which is filled if [filled] is true
  /// and bordered per the [border].
  ///
  /// This property is false by default.
  final bool? filled;

  /// Whether the [InputDecorator.child] is part of a dense form (i.e., uses less vertical
  /// space).
  ///
  /// Defaults to false.
  final bool? isDense;

  /// Typically set to true when the [InputDecorator] contains a multiline
  /// [TextField] ([TextField.maxLines] is null or > 1) to override the default
  /// behavior of aligning the label with the center of the [TextField].
  ///
  /// Defaults to false.
  final bool? alignLabelWithHint;

  /// When the input field is empty and unfocused, the label is displayed on
  /// top of the input field (i.e., at the same location on the screen where
  /// text may be entered in the input field). When the input field receives
  /// focus (or if the field is non-empty), depending on [floatingLabelAlignment],
  /// the label moves above, either vertically adjacent to, or to the center of
  /// the input field.
  final Widget? label;

  /// The shape of the border to draw around the decoration's container.
  ///
  /// If [border] is a [WidgetStateInputBorder]
  /// or [WidgetStateProperty], then the effective border can depend on
  /// the [WidgetState.focused] state, i.e. if the [TextField] is focused or not.
  ///
  /// If [border] derives from [InputBorder] the border's [InputBorder.borderSide],
  /// i.e. the border's color and width, will be overridden to reflect the input
  /// decorator's state. Only the border's shape is used. If custom  [BorderSide]
  /// values are desired for a given state, all four borders – [errorBorder],
  /// [focusedBorder], [enabledBorder], [disabledBorder] – must be set.
  ///
  /// The decoration's container is the area which is filled if [filled] is
  /// true and bordered per the [border]. It's the area adjacent to
  /// [InputDecoration.icon] and above the widgets that contain
  /// [InputDecoration.helperText], [InputDecoration.errorText], and
  /// [InputDecoration.counterText].
  ///
  /// The border's bounds, i.e. the value of `border.getOuterPath()`, define
  /// the area to be filled.
  ///
  /// This property is only used when the appropriate one of [errorBorder],
  /// [focusedBorder], [focusedErrorBorder], [disabledBorder], or [enabledBorder]
  /// is not specified. This border's [InputBorder.borderSide] property is
  /// configured by the InputDecorator, depending on the values of
  /// [InputDecoration.errorText], [InputDecoration.enabled],
  /// [InputDecorator.isFocused] and the current [Theme].
  ///
  /// Typically one of [UnderlineInputBorder] or [OutlineInputBorder].
  /// If null, InputDecorator's default is `const UnderlineInputBorder()`.
  ///
  /// See also:
  ///
  ///  * [InputBorder.none], which doesn't draw a border.
  ///  * [UnderlineInputBorder], which draws a horizontal line at the
  ///    bottom of the input decorator's container.
  ///  * [OutlineInputBorder], an [InputDecorator] border which draws a
  ///    rounded rectangle around the input decorator's container.
  final InputBorder? border;

  /// The border to display when the [InputDecorator] is disabled and is not
  /// showing an error.
  ///
  /// See also:
  ///
  ///  * [InputBorder.none], which doesn't draw a border.
  ///  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
  ///    line at the bottom of the input decorator's container.
  ///  * [OutlineInputBorder], an [InputDecorator] border which draws a
  ///    rounded rectangle around the input decorator's container.
  final InputBorder? disabledBorder;

  /// {@template flutter.material.inputDecoration.floatingLabelStyle}
  /// The style to use for [InputDecoration.labelText] when the label is
  /// above (i.e., vertically adjacent to) the input field.
  ///
  /// When the [InputDecoration.labelText] is on top of the input field, the
  /// text uses the [labelStyle] instead.
  ///
  /// If [floatingLabelStyle] is a [WidgetStateTextStyle], then the effective
  /// text style can depend on the [WidgetState.focused] state, i.e.
  /// if the [TextField] is focused or not.
  ///
  /// If null, defaults to [labelStyle].
  ///
  /// Specifying this style will override the default behavior
  /// of [InputDecoration] that changes the color of the label to the
  /// [InputDecoration.errorStyle] color or [ColorScheme.error].
  ///
  /// {@tool dartpad}
  /// It's possible to override the label style for just the error state, or
  /// just the default state, or both.
  ///
  /// In this example the [floatingLabelStyle] is specified with a
  /// [WidgetStateProperty] which resolves to a text style whose color depends
  /// on the decorator's error state.
  ///
  /// ** See code in examples/api/lib/material/input_decorator/input_decoration.floating_label_style_error.0.dart **
  /// {@end-tool}
  /// {@endtemplate}
  final TextStyle? floatingLabelStyle;

  /// {@template flutter.material.inputDecoration.floatingLabelBehavior}
  /// Defines **how** the floating label should behave.
  ///
  /// When [FloatingLabelBehavior.auto] the label will float to the top only when
  /// the field is focused or has some text content, otherwise it will appear
  /// in the field in place of the content.
  ///
  /// When [FloatingLabelBehavior.always] the label will always float at the top
  /// of the field above the content.
  ///
  /// When [FloatingLabelBehavior.never] the label will always appear in an empty
  /// field in place of the content.
  /// {@endtemplate}
  ///
  /// If null, [InputDecorationTheme.floatingLabelBehavior] will be used.
  ///
  /// See also:
  ///
  ///  * [floatingLabelAlignment] which defines **where** the floating label
  ///    should be displayed.
  final FloatingLabelBehavior? floatingLabelBehavior;

  /// {@template flutter.material.inputDecoration.floatingLabelAlignment}
  /// Defines **where** the floating label should be displayed.
  ///
  /// [FloatingLabelAlignment.start] aligns the floating label to the leftmost
  /// (when [TextDirection.ltr]) or rightmost (when [TextDirection.rtl]),
  /// possible position, which is vertically adjacent to the label, on top of
  /// the field.
  ///
  /// [FloatingLabelAlignment.center] aligns the floating label to the center on
  /// top of the field.
  /// {@endtemplate}
  ///
  /// If null, [InputDecorationTheme.floatingLabelAlignment] will be used.
  ///
  /// See also:
  ///
  ///  * [floatingLabelBehavior] which defines **how** the floating label should
  ///    behave.
  final FloatingLabelAlignment? floatingLabelAlignment;
}
