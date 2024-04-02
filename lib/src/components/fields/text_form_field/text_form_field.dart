import 'package:flutter/widgets.dart';

import '../base_text_field.dart';
import '../text_field/text_field.dart';
import 'platforms/platforms.dart';

/// A custom text form field widget that adapts its appearance based on the platform.
///
/// Use this widget to create text form field with platform-specific
/// styling and behavior:
/// - On IOS, specific form field used.
/// - On Android, [TextFormField] is used.
class AdaptiveTextFormField
    extends BaseTextField<FormFieldAndroidProperty, FormFieldIOSProperty> {
  /// Creates a [FormField] that contains a [AdaptiveTextField].
  ///
  /// A [Form] ancestor is not required. The [Form] simply makes it easier to
  /// save, reset, or validate multiple fields at once. To use without a [Form],
  /// pass a `GlobalKey<FormFieldState>` (see [GlobalKey]) to the constructor and use
  /// [GlobalKey.currentState] to save or reset the form field.
  ///
  /// When a [controller] is specified, its [TextEditingController.text]
  /// defines the [initialValue]. If this [FormField] is part of a scrolling
  /// container that lazily constructs its children, like a [ListView] or a
  /// [CustomScrollView], then a [controller] should be specified.
  /// The controller's lifetime should be managed by a stateful widget ancestor
  /// of the scrolling container.
  ///
  /// When a [controller] is specified, [initialValue] must be null (the
  /// default). If [controller] is null, then a [TextEditingController]
  /// will be constructed automatically and its `text` will be initialized
  /// to [initialValue] or the empty string.
  ///
  /// {@macro flutter.material.textfield.wantKeepAlive}
  ///
  /// Remember to call [TextEditingController.dispose] of the [TextEditingController]
  /// when it is no longer needed. This will ensure any resources used by the object
  /// are discarded.
  ///
  /// See also:
  ///
  ///   * [AdaptiveTextField],
  ///   * [AdaptiveTextSearchField],
  const AdaptiveTextFormField({
    super.key,
    super.builders,
    super.properties,
    super.textDirection,
    super.scribbleEnabled = true,
    super.spellCheckConfiguration,
    super.clipBehavior = Clip.hardEdge,
    super.contentInsertionConfiguration,
    super.cursorOpacityAnimates,
    super.enableIMEPersonalizedLearning = true,
    super.magnifierConfiguration,
    super.onSubmitted,
    super.undoController,
    super.autocorrect,
    super.autofillHints,
    super.autofocus,
    super.contextMenuBuilder,
    super.controller,
    super.cursorColor,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorWidth,
    super.dragStartBehavior,
    super.enabled,
    super.enableInteractiveSelection,
    super.enableSuggestions,
    super.expands,
    super.focusNode,
    super.inputFormatters,
    super.keyboardAppearance,
    super.keyboardType,
    super.maxLength,
    super.maxLengthEnforcement,
    super.maxLines,
    super.minLines,
    super.obscureText,
    super.obscuringCharacter,
    super.onChanged,
    super.onEditingComplete,
    super.onTap,
    super.onTapOutside,
    super.padding,
    super.placeholder,
    super.placeholderStyle,
    super.prefix,
    super.readOnly,
    super.restorationId,
    super.scrollController,
    super.scrollPadding,
    super.scrollPhysics,
    super.selectionControls,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.showCursor,
    super.smartDashesType,
    super.smartQuotesType,
    super.strutStyle,
    super.style,
    super.suffix,
    super.textAlign,
    super.textAlignVertical,
    super.textCapitalization,
    super.textInputAction,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.autovalidateMode,
    super.onFieldSubmitted,
    super.errorHighlightColor,
  }) : assert(
          initialValue == null || controller == null,
          'Cannot provide both initialValue and controller.',
        );

  @override
  Widget android(BuildContext context, [FormFieldAndroidProperty? property]) {
    return TextFormFieldAndroid(
      property: property,
      fieldProperties: formFieldProperties,
    );
  }

  @override
  Widget iOS(BuildContext context, [FormFieldIOSProperty? property]) {
    return TextFormFieldIOS(
      property: property,
      formFieldProperties: formFieldProperties,
    );
  }
}
