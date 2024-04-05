import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../text_search_field/platforms/android.dart';
import '../autocomplete_item.dart';
import '../base_autocomplete/base_autocomplete.dart';
import '../base_autocomplete/decorations.dart';

class MaterialAutocomplete<T> extends BaseAutocomplete<T> {
  const MaterialAutocomplete({
    super.key,
    super.onSelected,
    super.initialValue,
    super.emptyBuilder,
    super.displayStringForOption,
    super.fieldViewBuilder,
    super.autocompleteField,
    super.optionsMaxHeight,
    super.optionsBuilder,
    super.optionsViewBuilder,
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
    return TextSearchFieldAndroid(
      focusNode: focusNode,
      controller: textEditingController,
      constraints: autocompleteField?.constraints,
      style: autocompleteField?.style,
      onTap: autocompleteField?.onTap,
      padding: autocompleteField?.padding,
      itemSize: autocompleteField?.itemSize,
      itemColor: autocompleteField?.itemColor,
      onChanged: autocompleteField?.onChanged,
      onSuffixTap: autocompleteField?.onSuffixTap,
      decoration: autocompleteField?.decoration,
      prefixIcon: autocompleteField?.prefixIcon,
      suffixIcon: autocompleteField?.suffixIcon,
      suffixMode: autocompleteField?.suffixMode,
      prefixInsets: autocompleteField?.prefixInsets,
      suffixInsets: autocompleteField?.suffixInsets,
      property: autocompleteField?.properties?.android,
      placeholder: autocompleteField?.placeholder,
      placeholderStyle: autocompleteField?.placeholderStyle,
      onSubmitted: (String value) {
        autocompleteField?.onSubmitted?.call(value);
        onFieldSubmitted();
      },
    );
  }

  @override
  Widget defaultAutoCompleteOptions(
    BuildContext context,
    AutocompleteOnSelected<AdaptiveAutocompleteItem<T>> onSelected,
    Iterable<AdaptiveAutocompleteItem<T>> options,
  ) {
    return _MaterialAutocompleteOptions<T>(
      options: options,
      onSelected: onSelected,
      emptyBuilderWidget: emptyBuilder,
      decoration: optionsDecoration,
      maxOptionsHeight: optionsMaxHeight,
      displayStringForOption: displayStringForOption,
    );
  }
}

class _MaterialAutocompleteOptions<T> extends BaseAutocompleteOptions<T> {
  const _MaterialAutocompleteOptions({
    super.key,
    super.decoration,
    super.emptyBuilderWidget,
    required super.options,
    required super.onSelected,
    required super.maxOptionsHeight,
    required super.displayStringForOption,
  });

  @override
  Widget backgroundWrapper(BuildContext context, Widget child) {
    return Padding(
      padding: decoration?.margin ?? kDefaultOptionsMargin,
      child: Material(
        elevation: 4.0,
        color: decoration?.color,
        shape: decoration?.shape ??
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            ),
        textStyle: decoration?.optionDecoration?.textStyle ??
            Theme.of(context).textTheme.bodyMedium,
        child: Padding(
            padding: decoration?.padding ?? EdgeInsets.zero, child: child),
      ),
    );
  }

  @override
  Widget emptyBuilder(BuildContext context, String value) {
    return emptyBuilderWidget?.call(value) ??
        Padding(
          padding: const EdgeInsets.only(top: 2.0, right: 8.0),
          child: Material(
            color: Theme.of(context).colorScheme.onError,
            shape: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: kDefaultOptionsPadding,
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

    final borderRadius =
        option?.borderRadius?.resolve(Directionality.of(context)) ??
            (BorderRadius.zero);

    return Padding(
      padding: option?.margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        highlightColor: option?.pressColor,
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
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
              ),
              child: Padding(
                padding: option?.padding ?? kDefaultOptionsPadding,
                child: Text(searchKey),
              ),
            );
          },
        ),
      ),
    );
  }
}
