import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '../../fields_properties.dart';
import '../../text_field/platforms/ios.dart';

class TextFormFieldIOS extends StatelessWidget {
  const TextFormFieldIOS({super.key, this.property, this.formFieldProperties});

  final FormFieldIOSProperty? property;
  final FormFieldProperties? formFieldProperties;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: formFieldProperties?.padding ?? const EdgeInsets.all(4.0),
      child: TextFieldTapRegion(
        onTapOutside: formFieldProperties?.onTapOutside,
        child: _IOSTextFormField(
          key: key,
          context: context,
          onTap: formFieldProperties?.onTap,
          onSaved: formFieldProperties?.onSaved,
          onChanged: formFieldProperties?.onChanged,
          validator: formFieldProperties?.validator,
          onFieldSubmitted: formFieldProperties?.onFieldSubmitted,
          onEditingComplete: formFieldProperties?.onEditingComplete,
          initialValue: formFieldProperties?.initialValue,
          placeholder: formFieldProperties?.placeholder,
          errorHighlightColor: formFieldProperties?.errorHighlightColor,
          autovalidateMode: formFieldProperties?.autovalidateMode ??
              AutovalidateMode.disabled,
          placeholderStyle:
              formFieldProperties?.placeholderStyle ?? kDefaultPlaceholderStyle,

          /// padding: formFieldProperties?.padding ?? const EdgeInsets.all(4.0),
          decoration: property?.decoration,
          clipBehavior: formFieldProperties?.clipBehavior ?? Clip.hardEdge,
          textDirection: formFieldProperties?.textDirection,
          stylusHandwritingEnabled:
              formFieldProperties?.stylusHandwritingEnabled ?? true,
          spellCheckConfiguration: formFieldProperties?.spellCheckConfiguration,
          enableIMEPersonalizedLearning:
              formFieldProperties?.enableIMEPersonalizedLearning ?? true,
          cursorOpacityAnimates:
              formFieldProperties?.cursorOpacityAnimates ?? true,
          contentInsertionConfiguration:
              formFieldProperties?.contentInsertionConfiguration,
          magnifierConfiguration: formFieldProperties?.magnifierConfiguration,
          style: formFieldProperties?.style,
          suffixMode: property?.suffixMode ?? OverlayVisibilityMode.always,
          prefixMode: property?.suffixMode ?? OverlayVisibilityMode.always,
          clearButtonMode:
              property?.clearButtonMode ?? OverlayVisibilityMode.never,
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: formFieldProperties?.prefix,
          ),
          suffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: formFieldProperties?.suffix,
          ),
          enabled: formFieldProperties?.enabled,
          maxLines: formFieldProperties?.maxLines ?? 1,
          minLines: formFieldProperties?.minLines,
          focusNode: formFieldProperties?.focusNode,
          maxLength: formFieldProperties?.maxLength,
          strutStyle: formFieldProperties?.strutStyle,
          showCursor: formFieldProperties?.showCursor,
          controller: formFieldProperties?.controller,
          undoController: formFieldProperties?.undoController,
          cursorColor: formFieldProperties?.cursorColor,
          expands: formFieldProperties?.expands ?? false,
          cursorHeight: formFieldProperties?.cursorHeight,
          keyboardType: formFieldProperties?.keyboardType,
          readOnly: formFieldProperties?.readOnly ?? false,
          restorationId: formFieldProperties?.restorationId,
          scrollPhysics: formFieldProperties?.scrollPhysics,
          autofillHints: formFieldProperties?.autofillHints,
          autofocus: formFieldProperties?.autofocus ?? false,
          cursorWidth: formFieldProperties?.cursorWidth ?? 2.0,
          smartDashesType: formFieldProperties?.smartDashesType,
          smartQuotesType: formFieldProperties?.smartQuotesType,
          autocorrect: formFieldProperties?.autocorrect ?? true,
          textInputAction: formFieldProperties?.textInputAction,
          inputFormatters: formFieldProperties?.inputFormatters,
          obscureText: formFieldProperties?.obscureText ?? false,
          scrollController: formFieldProperties?.scrollController,
          selectionControls: formFieldProperties?.selectionControls,
          textAlignVertical: formFieldProperties?.textAlignVertical,
          obscuringCharacter: formFieldProperties?.obscuringCharacter ?? '•',
          keyboardAppearance: formFieldProperties?.keyboardAppearance,
          contextMenuBuilder: formFieldProperties?.contextMenuBuilder ??
              TextFieldIOS.kDefaultContextMenuBuilder,
          textAlign: formFieldProperties?.textAlign ?? TextAlign.start,
          maxLengthEnforcement: formFieldProperties?.maxLengthEnforcement,
          enableSuggestions: formFieldProperties?.enableSuggestions ?? true,
          cursorRadius:
              formFieldProperties?.cursorRadius ?? const Radius.circular(2.0),
          scrollPadding:
              formFieldProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
          enableInteractiveSelection:
              formFieldProperties?.enableInteractiveSelection ?? true,
          selectionWidthStyle:
              formFieldProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
          dragStartBehavior:
              formFieldProperties?.dragStartBehavior ?? DragStartBehavior.start,
          selectionHeightStyle:
              formFieldProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
          textCapitalization: formFieldProperties?.textCapitalization ??
              TextCapitalization.none,
        ),
      ),
    );
  }
}

class FormFieldIOSProperty extends FieldIOSProperty {
  const FormFieldIOSProperty({
    super.clearButtonMode,
    super.decoration,
    super.prefixMode,
    super.suffixMode,
  });
}

/// A [FormField] that contains a [_IOSTextFormField].
///
/// This is a convenience widget that wraps a [_IOSTextFormField] widget in a
/// [FormField].
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
/// If a [controller] is not specified, [initialValue] can be used to give
/// the automatically generated controller an initial value.
///
/// {@macro flutter.material.text-field.wantKeepAlive}
///
/// Remember to call [TextEditingController.dispose] of the [TextEditingController]
/// when it is no longer needed. This will ensure any resources used by the object
/// are discarded.
class _IOSTextFormField extends FormField<String> {
  /// Creates a [FormField] that contains a [_IOSTextFormField].
  ///
  /// When a [controller] is specified, [initialValue] must be null (the
  /// default). If [controller] is null, then a [TextEditingController]
  /// will be constructed automatically and its `text` will be initialized
  /// to [initialValue] or the empty string.
  _IOSTextFormField({
    Key? key,
    this.controller,
    required BuildContext context,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    EdgeInsets padding = const EdgeInsets.all(4.0),
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius cursorRadius = const Radius.circular(2.0),
    Color? cursorColor,
    Color? errorHighlightColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    TextSelectionControls? selectionControls,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    String? placeholder,
    TextStyle? placeholderStyle = kDefaultPlaceholderStyle,
    ScrollController? scrollController,
    Widget? prefix,
    OverlayVisibilityMode prefixMode = OverlayVisibilityMode.always,
    Widget? suffix,
    OverlayVisibilityMode suffixMode = OverlayVisibilityMode.always,
    OverlayVisibilityMode clearButtonMode = OverlayVisibilityMode.never,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool enableInteractiveSelection = true,
    String? restorationId,
    MaxLengthEnforcement? maxLengthEnforcement,
    UndoHistoryController? undoController,
    Clip clipBehavior = Clip.hardEdge,
    TextDirection? textDirection,
    bool stylusHandwritingEnabled = true,
    bool enableIMEPersonalizedLearning = true,
    bool? cursorOpacityAnimates = true,
    ContentInsertionConfiguration? contentInsertionConfiguration,
    SpellCheckConfiguration? spellCheckConfiguration,
    TextMagnifierConfiguration? magnifierConfiguration,
    BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight,
    BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight,
    BoxDecoration? decoration,
    EditableTextContextMenuBuilder? contextMenuBuilder,
  })  : assert(initialValue == null || controller == null),
        assert(obscuringCharacter.length == 1),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null || maxLength > 0),
        super(
          key: key,
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          enabled: enabled ?? true,
          builder: (FormFieldState<String> field) {
            final state = field as _IOSTextFormFieldState;
            void onChangedHandler(String value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoTextField(
                    padding: padding,
                    undoController: undoController,
                    clipBehavior: clipBehavior,
                    textDirection: textDirection,
                    stylusHandwritingEnabled: stylusHandwritingEnabled,
                    magnifierConfiguration: magnifierConfiguration,
                    cursorOpacityAnimates: cursorOpacityAnimates ?? true,
                    spellCheckConfiguration: spellCheckConfiguration,
                    contentInsertionConfiguration:
                        contentInsertionConfiguration,
                    enableIMEPersonalizedLearning:
                        enableIMEPersonalizedLearning,
                    enableInteractiveSelection: enableInteractiveSelection,
                    clearButtonMode: clearButtonMode,
                    controller: state._effectiveController,
                    focusNode: focusNode,
                    keyboardType: keyboardType,
                    textInputAction: textInputAction,
                    style: style,
                    strutStyle: strutStyle,
                    textAlign: textAlign,
                    textAlignVertical: textAlignVertical,
                    textCapitalization: textCapitalization,
                    autofocus: autofocus,
                    readOnly: readOnly,
                    showCursor: showCursor,
                    obscuringCharacter: obscuringCharacter,
                    obscureText: obscureText,
                    autocorrect: autocorrect,
                    smartDashesType: smartDashesType ??
                        (obscureText
                            ? SmartDashesType.disabled
                            : SmartDashesType.enabled),
                    smartQuotesType: smartQuotesType ??
                        (obscureText
                            ? SmartQuotesType.disabled
                            : SmartQuotesType.enabled),
                    enableSuggestions: enableSuggestions,
                    maxLines: maxLines,
                    minLines: minLines,
                    expands: expands,
                    maxLength: maxLength,
                    onChanged: onChangedHandler,
                    onTap: onTap,
                    onEditingComplete: onEditingComplete,
                    onSubmitted: onFieldSubmitted,
                    inputFormatters: inputFormatters,
                    enabled: enabled ?? true,
                    cursorWidth: cursorWidth,
                    cursorHeight: cursorHeight,
                    cursorColor: field.errorText != null
                        ? CupertinoColors.systemRed
                        : cursorColor,
                    cursorRadius: cursorRadius,
                    scrollPadding: scrollPadding,
                    scrollPhysics: scrollPhysics,
                    keyboardAppearance: keyboardAppearance,
                    autofillHints: autofillHints,
                    placeholder: placeholder,
                    placeholderStyle: placeholderStyle,
                    scrollController: scrollController,
                    prefix: prefix,
                    prefixMode: prefixMode,
                    suffix: suffix,
                    suffixMode: suffixMode,
                    dragStartBehavior: dragStartBehavior,
                    maxLengthEnforcement: maxLengthEnforcement,
                    restorationId: restorationId,
                    selectionHeightStyle: selectionHeightStyle,
                    selectionWidthStyle: selectionWidthStyle,

                    /// cupertinoMisspelledTextStyle
                    decoration: decoration ??
                        kDefaultRoundedBorderDecoration.copyWith(
                          border: field.errorText != null
                              ? Border.all(
                                  color: errorHighlightColor ??
                                      CupertinoColors.systemRed,
                                  width: 1.5,
                                )
                              : kDefaultRoundedBorderDecoration.border,
                        ),
                    selectionControls: selectionControls,
                    contextMenuBuilder: contextMenuBuilder,
                  ),
                  if (field.errorText != null)
                    _buildDefaultErrorMessage(
                        field.errorText!, errorHighlightColor, context),
                ],
              ),
            );
          },
        );

  static Widget _buildDefaultErrorMessage(
    String errorText,
    Color? errorHighlightColor,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 2.0,
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: DefaultTextStyle(
          style:
              CupertinoTheme.of(context).textTheme.tabLabelTextStyle.copyWith(
                    color: CupertinoColors.destructiveRed,
                  ),
          child: Text(errorText),
        ),
      ),
    );
  }

  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() => _IOSTextFormFieldState();
}

class _IOSTextFormFieldState extends FormFieldState<String> {
  TextEditingController? _controller;

  TextEditingController? get _effectiveController =>
      widget.controller ?? _controller;

  @override
  _IOSTextFormField get widget => super.widget as _IOSTextFormField;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(_IOSTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _controller =
            TextEditingController.fromValue(oldWidget.controller!.value);
      }

      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) {
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (value != null && _effectiveController!.text != value) {
      _effectiveController!.text = value;
    }
  }

  @override
  void reset() {
    super.reset();

    if (widget.initialValue != null) {
      setState(() {
        _effectiveController!.text = widget.initialValue!;
      });
    }
  }

  void _handleControllerChanged() {
    if (_effectiveController!.text != value) {
      didChange(_effectiveController!.text);
    }
  }
}
