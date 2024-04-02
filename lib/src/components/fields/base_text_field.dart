import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '../../core/common/construct/component.dart';
import 'fields_properties.dart';

abstract class BaseTextField<A extends CoreAndroidProperty, I extends CoreIOSProperty> extends CoreAdaptiveComponent<A, I>
    implements BaseFieldProperties {
  const BaseTextField({
    super.key,
    super.builders,
    super.properties,
    this.focusNode,
    this.contextMenuBuilder,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.suffix,
    this.padding,
    this.keyboardType,
    this.readOnly,
    this.maxLength,
    this.maxLines = 1,
    this.controller,
    this.undoController,
    this.onTap,
    this.onTapOutside,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.obscureText = false,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.minLines,
    this.expands = false,
    this.maxLengthEnforcement,
    this.textCapitalization,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textAlignVertical,
    this.clipBehavior = Clip.hardEdge,
    this.spellCheckConfiguration,
    this.contentInsertionConfiguration,
    this.cursorOpacityAnimates,
    this.enableIMEPersonalizedLearning = true,
    this.magnifierConfiguration,
    this.scribbleEnabled = true,
    this.textDirection,
    this.autofocus = false,
    this.obscuringCharacter,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionControls,
    this.scrollPhysics,
    this.scrollController,
    this.autofillHints,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.restorationId,
    this.keyboardAppearance,
    this.dragStartBehavior,
    this.textInputAction,
    this.showCursor,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.onFieldSubmitted,
    this.errorHighlightColor,
  })  : assert(obscuringCharacter == null || obscuringCharacter.length == 1),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          expands != null && !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(
          obscureText != null && !obscureText || maxLines == 1,
          'Obscured fields cannot be multiline.',
        ),
        assert(maxLength == null || maxLength > 0),
        // Assert the following instead of setting it directly to avoid surprising the user by silently changing the value they set.
        assert(
          !identical(textInputAction, TextInputAction.newline) ||
              maxLines == 1 ||
              !identical(keyboardType, TextInputType.text),
          'Use keyboardType TextInputType.multiline when using TextInputAction.newline on a multiline AdaptiveTextField.',
        );

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge].
  @override
  final Clip clipBehavior;

  /// {@macro flutter.widgets.editableText.textDirection}
  @override
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.editableText.scribbleEnabled}
  @override
  final bool scribbleEnabled;

  /// {@macro flutter.services.TextInputConfiguration.enableIMEPersonalizedLearning}
  @override
  final bool enableIMEPersonalizedLearning;

  /// {@macro flutter.widgets.editableText.cursorOpacityAnimates}
  @override
  final bool? cursorOpacityAnimates;

  /// {@macro flutter.widgets.editableText.contentInsertionConfiguration}
  @override
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// {@macro flutter.widgets.EditableText.spellCheckConfiguration}
  ///
  /// If [SpellCheckConfiguration.misspelledTextStyle] is not specified in this
  /// configuration, then [materialMisspelledTextStyle] is used by default.
  @override
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// {@macro flutter.widgets.magnifier.TextMagnifierConfiguration.intro}
  ///
  /// {@macro flutter.widgets.magnifier.intro}
  ///
  /// {@macro flutter.widgets.magnifier.TextMagnifierConfiguration.details}
  ///
  /// By default, builds a [CupertinoTextMagnifier] on iOS and [TextMagnifier]
  /// on Android, and builds nothing on all other platforms. If it is desired to
  /// suppress the magnifier, consider passing [TextMagnifierConfiguration.disabled].
  ///
  /// {@tool dartpad}
  /// This sample demonstrates how to customize the magnifier that this text field uses.
  ///
  /// ** See code in examples/api/lib/widgets/text_magnifier/text_magnifier.0.dart **
  /// {@end-tool}
  @override
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// Defines the keyboard focus for this widget.
  @override
  final FocusNode? focusNode;

  /// Context menu builder for editable text.
  @override
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// Controls how tall the selection highlight boxes are computed to be.
  @override
  final ui.BoxHeightStyle? selectionHeightStyle;

  /// Controls how wide the selection highlight boxes are computed to be.
  @override
  final ui.BoxWidthStyle? selectionWidthStyle;

  /// A lighter colored placeholder hint that appears on the first line of the
  /// text field when the text entry is empty.
  ///
  /// Defaults to having no placeholder text.
  ///
  /// The text style of the placeholder text matches that of the text field's
  /// main text entry except a lighter font weight and a grey font color.
  @override
  final String? placeholder;

  /// The style to use for the placeholder text.
  ///
  /// The [placeholderStyle] is merged with the [style] [TextStyle] when applied
  /// to the [placeholder] text. To avoid merging with [style], specify
  /// [TextStyle.inherit] as false.
  ///
  /// Defaults to the [style] property with w300 font weight and grey color.
  ///
  /// If specifically set to null, placeholder's style will be the same as [style].
  @override
  final TextStyle? placeholderStyle;

  /// An optional [Widget] to display before the text.
  @override
  final Widget? prefix;

  /// An optional widget to display after the input field.
  @override
  final Widget? suffix;

  /// Padding around the text entry area between the [prefix] and [suffix].
  @override
  final EdgeInsets? padding;

  /// The type of keyboard to display for text input.
  @override
  final TextInputType? keyboardType;

  /// Indicates whether the text field is read-only.
  @override
  final bool? readOnly;

  /// The maximum number of characters the text field can contain.
  @override
  final int? maxLength;

  /// The maximum number of lines for a multi-line text field.
  ///
  /// Defaults to 1px.
  @override
  final int? maxLines;

  /// A controller for manipulating the text field's content.
  @override
  final TextEditingController? controller;

  /// {@macro flutter.widgets.undoHistory.controller}
  @override
  final UndoHistoryController? undoController;

  /// Callback for each distinct tap except for every second tap of a double tap.
  @override
  final GestureTapCallback? onTap;

  /// Callback for taps outside the text field.
  @override
  final TapRegionCallback? onTapOutside;

  /// Callback function for text changes.
  @override
  final ValueChanged<String>? onChanged;

  /// Callback function for submitting the text.
  @override
  final ValueChanged<String>? onSubmitted;

  /// Callback for editing completion.
  @override
  final VoidCallback? onEditingComplete;

  /// Indicates whether the text should be obscured.
  @override
  final bool? obscureText;

  /// Indicates whether autocorrect is enabled.
  @override
  final bool? autocorrect;

  /// Smart dashes type for text input.
  @override
  final SmartDashesType? smartDashesType;

  /// Smart quotes type for text input.
  @override
  final SmartQuotesType? smartQuotesType;

  /// Enable suggestions for text input.
  @override
  final bool? enableSuggestions;

  /// Minimum number of lines for a multi-line text field.
  @override
  final int? minLines;

  /// Determines whether the field should fill the height of its parent.
  ///
  /// If true, minLines and maxLines will ignore,
  @override
  final bool? expands;

  /// Determines how the maxLength limit should be enforced.
  @override
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Text capitalization style.
  @override
  final TextCapitalization? textCapitalization;

  /// Style to use for the text being edited.
  @override
  final TextStyle? style;

  /// Strut style for the text.
  @override
  final StrutStyle? strutStyle;

  /// Text alignment within the text field.
  @override
  final TextAlign? textAlign;

  /// Vertical text alignment within the text field.
  @override
  final TextAlignVertical? textAlignVertical;

  /// Autofocus on the text field.
  @override
  final bool autofocus;

  /// Character to use for obscuring the text.
  @override
  final String? obscuringCharacter;

  /// Input formatters for the text field.
  @override
  final List<TextInputFormatter>? inputFormatters;

  /// Enable or disable the text field.
  @override
  final bool enabled;

  /// Width of the cursor.
  @override
  final double? cursorWidth;

  /// Height of the cursor.
  @override
  final double? cursorHeight;

  /// Radius of the cursor.
  @override
  final Radius? cursorRadius;

  /// Color of the cursor.
  @override
  final Color? cursorColor;

  /// Text selection controls.
  @override
  final TextSelectionControls? selectionControls;

  /// Scroll physics for the text field.
  @override
  final ScrollPhysics? scrollPhysics;

  /// Scroll controller for the text field.
  @override
  final ScrollController? scrollController;

  /// Autofill hints for the text field.
  @override
  final Iterable<String>? autofillHints;

  /// Scroll padding for the text field.
  @override
  final EdgeInsets? scrollPadding;

  /// Enable or disable interactive selection.
  @override
  final bool? enableInteractiveSelection;

  /// Restoration ID for saving and restoring the state of the text field.
  @override
  final String? restorationId;

  /// Appearance of the keyboard.
  @override
  final Brightness? keyboardAppearance;

  /// Drag start behavior for the text field.
  @override
  final DragStartBehavior? dragStartBehavior;

  /// Action button type for the keyboard.
  @override
  final TextInputAction? textInputAction;

  /// Show or hide the cursor.
  @override
  final bool? showCursor;

  /// An optional value to initialize the form field to, or null otherwise.
  final String? initialValue;

  /// An optional method to call with the final value when the form is saved via
  /// [FormState.save].
  final FormFieldSetter<String>? onSaved;

  /// Callback function that is called when the user submits the text field's value.
  ///
  /// The [onFieldSubmitted] function is triggered when the user presses the
  /// "submit" or "done" button on the keyboard after entering text into the
  /// text field. It receives the current text value of the field as a [String]
  /// parameter.
  ///
  /// Example usage:
  /// ```dart
  /// TextField(
  ///   onFieldSubmitted: (value) {
  ///     // Handle the submitted value here
  ///     print("Submitted: $value");
  ///   },
  /// )
  /// ```
  final ValueChanged<String>? onFieldSubmitted;

  /// An optional method that validates an input. Returns an error string to
  /// display if the input is invalid, or null otherwise.
  ///
  /// The returned value is exposed by the [FormFieldState.errorText] property.
  /// The [TextFormField] uses this to override the [InputDecoration.errorText]
  /// value.
  ///
  /// Alternating between error and normal state can cause the height of the
  /// [TextFormField] to change if no other subtext decoration is set on the
  /// field. To create a field whose height is fixed regardless of whether or
  /// not an error is displayed, either wrap the  [TextFormField] in a fixed
  /// height parent like [SizedBox], or set the [InputDecoration.helperText]
  /// parameter to a space.
  final FormFieldValidator<String>? validator;

  /// Used to enable/disable this form field auto validation and update its
  /// error text.
  ///
  /// {@template flutter.widgets.FormField.autovalidateMode}
  /// If [AutovalidateMode.onUserInteraction], this FormField will only
  /// auto-validate after its content changes. If [AutovalidateMode.always], it
  /// will auto-validate even without user interaction. If
  /// [AutovalidateMode.disabled], auto-validation will be disabled.
  ///
  /// Defaults to [AutovalidateMode.disabled], cannot be null.
  /// {@endtemplate}
  final AutovalidateMode? autovalidateMode;

  /// The color used to highlight the field when an error is present.
  ///
  /// If the [errorHighlightColor] is specified, it is used to indicate an error
  /// in the field. When an error occurs, the input field is highlighted with
  /// this color to draw attention to the issue.
  ///
  /// If [errorHighlightColor] is null, the default error highlighting behavior
  /// of the underlying platform's text field implementation is used.
  final Color? errorHighlightColor;
}

extension AdaptiveTextFieldEx on BaseTextField {
  FieldProperties get fieldProperties => FieldProperties.fromBaseTextField(this);

  FormFieldProperties get formFieldProperties => FormFieldProperties.fromBaseTextField(this);
}
