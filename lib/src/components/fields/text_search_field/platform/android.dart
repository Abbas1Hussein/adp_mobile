import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../search_item.dart';
import 'common.dart';
import 'model.dart';

class MaterialAutocomplete<T> extends CustomAutocomplete<T> {
  const MaterialAutocomplete({
    super.key,
    super.onSelected,
    super.initialValue,
    super.optionsMaxHeight,
    super.optionsViewOpenDirection,
    super.displayStringForOption,
    super.optionsBuilder,
    super.fieldViewBuilder,
    super.optionsViewBuilder,
    super.decoration,
    super.fieldProperties,
    super.suffixMode,
    super.onSuffixTap,
    required super.options,
  });

  @override
  Widget defaultFieldViewBuilder(
    BuildContext context,
    TextEditingController textEditingController,
    FocusNode focusNode,
    VoidCallback onFieldSubmitted,
  ) {
    return _MaterialAutocompleteField(
      focusNode: focusNode,
      decoration: decoration,
      suffixMode: suffixMode,
      onSuffixTap: onSuffixTap,
      fieldProperties: fieldProperties,
      onFieldSubmitted: onFieldSubmitted,
      textEditingController:fieldProperties?.controller ?? textEditingController,
    );
  }

  @override
  Widget defaultAutoCompleteOptions(
    BuildContext context,
    AutocompleteOnSelected<AdaptiveSearchItem<T>> onSelected,
    Iterable<AdaptiveSearchItem<T>> options,
  ) {
    return _MaterialAutocompleteOptions<T>(
      options: options,
      onSelected: onSelected,
      maxOptionsHeight: optionsMaxHeight,
      displayStringForOption: displayStringForOption,
    );
  }
}

class _MaterialAutocompleteField extends CustomAutocompleteFulField {
  const _MaterialAutocompleteField({
    super.suffixMode,
    super.onSuffixTap,
    super.decoration,
    super.fieldProperties,
    required super.focusNode,
    required super.onFieldSubmitted,
    required super.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final suffix = IconButton(
      icon: fieldProperties?.suffix ?? const Icon(Icons.clear),
      onPressed: onSuffixTap ?? textEditingController.clear,
    );

    final showClearButton = _shouldShowAttachment(
      hasText: textEditingController.text.isNotEmpty,
      attachment: suffixMode ?? OverlayVisibilityMode.editing,
    );

    return DecoratedBox(
      decoration: decoration ?? const BoxDecoration(),
      child: TextField(
        maxLines: 1,
        controller: textEditingController,
        focusNode: fieldProperties?.focusNode ?? focusNode,
        enabled: fieldProperties?.enabled,
        onTap: fieldProperties?.onTap,
        onChanged: fieldProperties?.onChanged,
        autofocus: fieldProperties?.autofocus ?? false,
        autocorrect: fieldProperties?.autocorrect ?? true,
        restorationId: fieldProperties?.restorationId,
        smartDashesType: fieldProperties?.smartDashesType,
        smartQuotesType: fieldProperties?.smartQuotesType,
        keyboardType: fieldProperties?.keyboardType,
        style: fieldProperties?.style,
        enableIMEPersonalizedLearning:
            fieldProperties?.enableIMEPersonalizedLearning ?? true,
        decoration: InputDecoration(
          suffixIcon: showClearButton ? suffix : null,
          prefixIcon: fieldProperties?.prefix ?? const Icon(Icons.search),
          hintText: fieldProperties?.placeholder ??
              MaterialLocalizations.of(context).searchFieldLabel,
          hintStyle: fieldProperties?.placeholderStyle,
          border: decoration != null ? InputBorder.none : null,
        ),
        onSubmitted: (String value) => onFieldSubmitted(),
      ),
    );
  }

  static bool _shouldShowAttachment(
      {required OverlayVisibilityMode attachment, required bool hasText}) {
    return switch (attachment) {
      OverlayVisibilityMode.never => false,
      OverlayVisibilityMode.always => true,
      OverlayVisibilityMode.editing => hasText,
      OverlayVisibilityMode.notEditing => !hasText,
    };
  }
}

class _MaterialAutocompleteOptions<T> extends CustomAutocompleteOptions<T> {
  const _MaterialAutocompleteOptions({
    super.key,
    super.decoration,
    required super.options,
    required super.onSelected,
    required super.maxOptionsHeight,
    required super.displayStringForOption,
  });

  @override
  Widget backgroundWrapper(BuildContext context, Widget child) {
    return Padding(
      padding:
          decoration?.margin ?? const EdgeInsets.only(top: 6.0, right: 7.5),
      child: Material(
        elevation: 4.0,
        color: decoration?.color,
        shape: decoration?.shape,
        textStyle: decoration?.optionDecoration?.textStyle ??
            Theme.of(context).textTheme.bodyMedium,
        child: Padding(
          padding: decoration?.padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget optionBuilder(BuildContext context, bool isHighlight,
      VoidCallback onTap, String searchKey) {
    final OptionDecoration? option = decoration?.optionDecoration;

    return InkWell(
      onTap: onTap,
      highlightColor: option?.pressColor,
      borderRadius: option?.borderRadius?.resolve(Directionality.of(context)),
      child: Builder(
        builder: (BuildContext context) {
          if (isHighlight) {
            SchedulerBinding.instance.addPostFrameCallback(
              (Duration timeStamp) {
                Scrollable.ensureVisible(context, alignment: 0.5);
              },
            );
          }
          return DecoratedBox(
            decoration: ShapeDecoration(
              color: isHighlight
                  ? (option?.highlightColor ?? Theme.of(context).focusColor)
                  : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius:
                    option?.borderRadius?.resolve(Directionality.of(context)) ??
                        BorderRadius.zero,
              ),
            ),
            child: Padding(
              padding: option?.padding ?? kDefaultOptionPadding,
              child: Text(searchKey),
            ),
          );
        },
      ),
    );
  }
}
