import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../autocomplete_item.dart';
import 'decorations.dart';
import 'empty_widget.dart';
import 'field_properties.dart';

abstract class BaseAutocomplete<T> extends StatelessWidget {
  /// Creates an instance of [BaseAutocomplete].
  const BaseAutocomplete({
    super.key,
    this.onSelected,
    this.initialValue,
    this.optionsMaxHeight = 200.0,
    this.displayStringForOption = defaultStringForOption,
    this.optionsViewBuilder,
    this.fieldViewBuilder,
    this.optionsBuilder,
    this.emptyBuilder,
    this.autocompleteField,
    this.optionsDecoration,
    required this.options,
  });

  /// A list of suggestions for the SearchFieldAutoComplete.
  ///
  /// Each suggestion should have a unique searchKey.
  final List<AdaptiveAutocompleteItem<T>> options;

  /// {@macro flutter.widgets.RawAutocomplete.displayStringForOption}
  final AutocompleteOptionToString<AdaptiveAutocompleteItem<T>>?
      displayStringForOption;

  /// {@macro flutter.widgets.RawAutocomplete.fieldViewBuilder}
  ///
  /// If not provided, will build a standard Material-style text field by
  /// default.
  final AutocompleteFieldViewBuilder? fieldViewBuilder;

  /// {@macro flutter.widgets.RawAutocomplete.onSelected}
  final AutocompleteOnSelected<AdaptiveAutocompleteItem<T>>? onSelected;

  /// {@macro flutter.widgets.RawAutocomplete.optionsBuilder}
  final AutocompleteOptionsBuilder<AdaptiveAutocompleteItem<T>>? optionsBuilder;

  /// {@macro flutter.widgets.RawAutocomplete.optionsViewBuilder}
  ///
  /// If not provided, will build a standard Material-style list of results by
  /// default.
  final AutocompleteOptionsViewBuilder<AdaptiveAutocompleteItem<T>>?
      optionsViewBuilder;

  /// The maximum height used for the default Material options list widget.
  ///
  /// When [optionsViewBuilder] is `null`, this property sets the maximum height
  /// that the options widget can occupy.
  ///
  /// The default value is set to 200.
  final double optionsMaxHeight;

  /// {@macro flutter.widgets.RawAutocomplete.initialValue}
  final TextEditingValue? initialValue;

  /// The default way to convert an option to a string in
  /// [displayStringForOption].
  ///
  /// Uses the `toString` method of the given `option`.
  static String defaultStringForOption(AdaptiveAutocompleteItem option) {
    return option.searchKey;
  }

  final EmptyBuilder? emptyBuilder;
  final OptionsDecoration? optionsDecoration;
  final AutocompleteFieldProperties? autocompleteField;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<AdaptiveAutocompleteItem<T>>(
      onSelected: onSelected,
      initialValue: initialValue,
      optionsBuilder: _optionsBuilder,
      focusNode: autocompleteField?.focusNode,
      textEditingController: autocompleteField?.controller,
      fieldViewBuilder: fieldViewBuilder ?? defaultFieldViewBuilder,
      optionsViewBuilder: optionsViewBuilder ?? defaultAutoCompleteOptions,
      displayStringForOption: (option) {
        if (option.searchKey.contains(emptyKey)) return '';

        return (displayStringForOption ?? defaultStringForOption).call(option);
      },
    );
  }

  Widget defaultFieldViewBuilder(
    BuildContext context,
    TextEditingController textEditingController,
    FocusNode focusNode,
    VoidCallback onFieldSubmitted,
  );

  Widget defaultAutoCompleteOptions(
    BuildContext context,
    AutocompleteOnSelected<AdaptiveAutocompleteItem<T>> onSelected,
    Iterable<AdaptiveAutocompleteItem<T>> options,
  );

  FutureOr<Iterable<AdaptiveAutocompleteItem<T>>> _optionsBuilder(
    TextEditingValue textEditingValue,
  ) {
    if (textEditingValue.text.trim().isEmpty) {
      return Iterable<AdaptiveAutocompleteItem<T>>.empty();
    }

    final Iterable<AdaptiveAutocompleteItem<T>> filteredOptions =
        (optionsBuilder?.call(textEditingValue) ??
            options.where((AdaptiveAutocompleteItem<T> option) {
              return option.searchKey
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            })) as Iterable<AdaptiveAutocompleteItem<T>>;

    if (filteredOptions.isEmpty) {
      return [
        AdaptiveAutocompleteItem<T>(
          searchKey: EmptyModel(
            searchKey: emptyKey,
            enteredText: textEditingValue.text,
          ).toString(),
        ),
      ];
    }

    return filteredOptions;
  }
}

abstract class BaseAutocompleteOptions<T> extends StatelessWidget {
  const BaseAutocompleteOptions({
    super.key,
    this.decoration,
    this.displayStringForOption,
    this.emptyBuilderWidget,
    required this.options,
    required this.onSelected,
    required this.maxOptionsHeight,
  });

  final double maxOptionsHeight;
  final OptionsDecoration? decoration;
  final Iterable<AdaptiveAutocompleteItem<T>> options;
  final AutocompleteOnSelected<AdaptiveAutocompleteItem<T>> onSelected;
  final AutocompleteOptionToString<AdaptiveAutocompleteItem<T>>? displayStringForOption;
  final EmptyBuilder? emptyBuilderWidget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxOptionsHeight),
        child: _emptyBuilder ??
            backgroundWrapper(
              context,
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final AdaptiveAutocompleteItem<T> option =
                      options.elementAt(index);

                  final bool isHighlight =
                      AutocompleteHighlightedOption.of(context) == index;

                  if (option.builder != null) {
                    return option.builder!(
                        isHighlight, () => onSelected(option));
                  }

                  final defaultStringForOption =
                      displayStringForOption?.call(option) ??
                          BaseAutocomplete.defaultStringForOption(option);

                  return optionBuilder(
                    context,
                    index,
                    isHighlight,
                    () => onSelected(option),
                    defaultStringForOption,
                  );
                },
              ),
            ),
      ),
    );
  }

  Widget emptyBuilder(BuildContext context, String value);

  Widget? get _emptyBuilder {
    if (options.isEmpty) return null;

    final option = options.firstWhere(
      (element) {
        final key = EmptyModel.from(element.searchKey);
        return key.searchKey == emptyKey;
      },
      orElse: () => const AdaptiveAutocompleteItem(searchKey: ''),
    );

    if (option.searchKey.isNotEmpty) {
      final key = EmptyModel.from(option.searchKey);
      return Builder(builder: (context) {
        return emptyBuilder(context, key.enteredText);
      });
    }
    return null;
  }

  Widget backgroundWrapper(BuildContext context, Widget child);

  Widget optionBuilder(BuildContext context, int index, bool isHighlight,
      VoidCallback onTap, String searchKey);
}
