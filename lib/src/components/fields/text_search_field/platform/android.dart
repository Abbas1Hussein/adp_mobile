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
      maxOptionsHeight: optionsMaxHeight,
      decoration: const OptionsDecoration(
        optionDecoration: OptionDecoration(),
      ),
      displayStringForOption: displayStringForOption,
    );
  }
}

class _MaterialAutocompleteField extends CustomAutocompleteFulField {
  const _MaterialAutocompleteField({
    required super.focusNode,
    required super.onFieldSubmitted,
    required super.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,

      /// borderRadius: BorderRadius.zero,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: MaterialLocalizations.of(context).searchFieldLabel,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: textEditingController.text.isNotEmpty
            ? IconButton(
                onPressed: textEditingController.clear,
                icon: const Icon(Icons.clear),
              )
            : null,
      ),
      onSubmitted: (String value) => onFieldSubmitted(),
    );
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
      padding: decoration?.margin ?? const EdgeInsets.only(right: 7.5),
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
