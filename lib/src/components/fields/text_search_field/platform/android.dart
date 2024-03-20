import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../search_item.dart';
import 'common.dart';
import 'model.dart';

class MaterialAutocomplete<T> extends BaseAutocomplete<T> {
  const MaterialAutocomplete({
    super.key,
    super.onSelected,
    super.initialValue,
    super.emptyBuilder,
    super.optionsMaxHeight,
    super.displayStringForOption,
    super.optionsBuilder,
    super.fieldViewBuilder,
    super.optionsViewBuilder,
    super.fieldProperties,
    super.onSuffixTap,
    super.suffixMode,
    super.decoration,
    super.optionsDecoration,
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
      options: options,
      focusNode: focusNode,
      decoration: decoration,
      suffixMode: suffixMode,
      onSuffixTap: onSuffixTap,
      fieldProperties: fieldProperties,
      onFieldSubmitted: onFieldSubmitted,
      textEditingController: textEditingController,
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
      decoration: optionsDecoration,
      maxOptionsHeight: optionsMaxHeight,
      displayStringForOption: displayStringForOption,
    );
  }
}

class _MaterialAutocompleteField extends BaseAutocompleteFulField {
  const _MaterialAutocompleteField({
    super.suffixMode,
    super.onSuffixTap,
    super.decoration,
    super.fieldProperties,
    required super.options,
    required super.focusNode,
    required super.onFieldSubmitted,
    required super.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final showClearButton = _shouldShowAttachment(
      hasText: textEditingController.text.isNotEmpty,
      attachment: suffixMode ?? OverlayVisibilityMode.editing,
    );

    final suffix = showClearButton
        ? IconButton(
            icon: fieldProperties?.suffix ?? const Icon(Icons.clear),
            onPressed: onSuffixTap ?? textEditingController.clear,
          )
        : null;

    return DecoratedBox(
      decoration: decoration ?? const BoxDecoration(),
      child: TextField(
        maxLines: 1,
        focusNode: focusNode,
        controller: textEditingController,
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
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          suffixIcon: showClearButton ? suffix : null,
          prefixIcon: fieldProperties?.prefix ?? const Icon(Icons.search),
          hintText: fieldProperties?.placeholder ??
              MaterialLocalizations.of(context).searchFieldLabel,
          hintStyle: fieldProperties?.placeholderStyle,
          border: decoration != null ? InputBorder.none : null,
        ),
        onSubmitted: (String value) {
          if (options.where((element) => element.searchKey == value).length ==
              1) {
            onFieldSubmitted();
          }
        },
      ),
    );
  }

  static bool _shouldShowAttachment({
    required bool hasText,
    required OverlayVisibilityMode attachment,
  }) {
    return switch (attachment) {
      OverlayVisibilityMode.never => false,
      OverlayVisibilityMode.always => true,
      OverlayVisibilityMode.editing => hasText,
      OverlayVisibilityMode.notEditing => !hasText,
    };
  }
}

class _MaterialAutocompleteOptions<T> extends BaseAutocompleteOptions<T> {
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
    const effectedPadding = EdgeInsets.only(right: 8.0);

    return Padding(
      padding: decoration?.margin?.add(effectedPadding) ?? effectedPadding,
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
  Widget emptyBuilder(BuildContext context, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, right: 8.0),
      child: Material(
        shape: const UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: kDefaultOptionPadding,
            child: Text(
              'No matches found: $value',
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget optionBuilder(BuildContext context, int index, bool isHighlight,
      VoidCallback onTap, String searchKey) {
    final OptionDecoration? option = decoration?.optionDecoration;

    return Padding(
      padding: option?.margin ?? kDefaultOptionMargin,
      child: InkWell(
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
                  borderRadius: option?.borderRadius
                          ?.resolve(Directionality.of(context)) ??
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
      ),
    );
  }
}
