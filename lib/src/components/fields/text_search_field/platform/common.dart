import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../fields_properties.dart';
import '../search_item.dart';
import 'empty_widget.dart';
import 'model.dart';

/// See also:
///
///  * [RawAutocomplete], which is what Autocomplete is built upon, and which
///    contains more detailed examples.
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
    this.onSuffixTap,
    this.suffixMode,
    this.decoration,
    this.emptyBuilder,
    this.fieldProperties,
    this.optionsDecoration,
    required this.options,
  });

  /// A list of suggestions for the SearchFieldAutoComplete.
  ///
  /// Each suggestion should have a unique searchKey.
  final List<AdaptiveSearchItem<T>> options;

  /// {@macro flutter.widgets.RawAutocomplete.displayStringForOption}
  final AutocompleteOptionToString<AdaptiveSearchItem<T>>?
      displayStringForOption;

  /// {@macro flutter.widgets.RawAutocomplete.fieldViewBuilder}
  ///
  /// If not provided, will build a standard Material-style text field by
  /// default.
  final AutocompleteFieldViewBuilder? fieldViewBuilder;

  /// {@macro flutter.widgets.RawAutocomplete.onSelected}
  final AutocompleteOnSelected<AdaptiveSearchItem<T>>? onSelected;

  /// {@macro flutter.widgets.RawAutocomplete.optionsBuilder}
  final AutocompleteOptionsBuilder<AdaptiveSearchItem<T>>? optionsBuilder;

  /// {@macro flutter.widgets.RawAutocomplete.optionsViewBuilder}
  ///
  /// If not provided, will build a standard Material-style list of results by
  /// default.
  final AutocompleteOptionsViewBuilder<AdaptiveSearchItem<T>>?
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
  static String defaultStringForOption(AdaptiveSearchItem option) {
    return option.searchKey;
  }

  final BoxDecoration? decoration;
  final VoidCallback? onSuffixTap;
  final OverlayVisibilityMode? suffixMode;

  final EmptyBuilder? emptyBuilder;
  final FieldProperties? fieldProperties;
  final OptionsDecoration? optionsDecoration;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<AdaptiveSearchItem<T>>(
      onSelected: onSelected,
      initialValue: initialValue,
      optionsBuilder: _optionsBuilder,
      focusNode: fieldProperties?.focusNode,
      textEditingController: fieldProperties?.controller,
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
    AutocompleteOnSelected<AdaptiveSearchItem<T>> onSelected,
    Iterable<AdaptiveSearchItem<T>> options,
  );

  FutureOr<Iterable<AdaptiveSearchItem<T>>> _optionsBuilder(
    TextEditingValue textEditingValue,
  ) {
    if (textEditingValue.text.trim().isEmpty) {
      return Iterable<AdaptiveSearchItem<T>>.empty();
    }

    final Iterable<AdaptiveSearchItem<T>> filteredOptions =
        (optionsBuilder?.call(textEditingValue) ??
            options.where((AdaptiveSearchItem<T> option) {
              return option.searchKey
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            })) as Iterable<AdaptiveSearchItem<T>>;

    if (filteredOptions.isEmpty) {
      return [
        AdaptiveSearchItem<T>(
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

abstract class BaseAutocompleteField<T> extends StatelessWidget {
  const BaseAutocompleteField({
    super.key,
    this.decoration,
    this.suffixMode,
    this.onSuffixTap,
    this.fieldProperties,
    required this.options,
    required this.focusNode,
    required this.onFieldSubmitted,
    required this.textEditingController,
  });

  final FocusNode focusNode;
  final VoidCallback onFieldSubmitted;
  final TextEditingController textEditingController;

  final BoxDecoration? decoration;
  final VoidCallback? onSuffixTap;
  final OverlayVisibilityMode? suffixMode;
  final FieldProperties? fieldProperties;
  final Iterable<AdaptiveSearchItem<T>> options;
}

abstract class BaseAutocompleteFulField<T> extends StatefulWidget {
  const BaseAutocompleteFulField({
    super.key,
    this.decoration,
    this.suffixMode,
    this.onSuffixTap,
    this.fieldProperties,
    required this.options,
    required this.focusNode,
    required this.onFieldSubmitted,
    required this.textEditingController,
  });

  final FocusNode focusNode;
  final VoidCallback onFieldSubmitted;
  final TextEditingController textEditingController;

  final BoxDecoration? decoration;
  final VoidCallback? onSuffixTap;
  final OverlayVisibilityMode? suffixMode;
  final FieldProperties? fieldProperties;
  final Iterable<AdaptiveSearchItem<T>> options;

  Widget build(BuildContext context) => const SizedBox.shrink();

  @override
  State<BaseAutocompleteFulField> createState() =>
      _BaseAutocompleteFulFieldState();
}

class _BaseAutocompleteFulFieldState extends State<BaseAutocompleteFulField> {
  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(_listener);
  }

  void _listener() => setState(() {});

  @override
  Widget build(BuildContext context) => widget.build(context);

  @override
  void dispose() {
    widget.textEditingController.removeListener(_listener);
    super.dispose();
  }
}

abstract class BaseAutocompleteOptions<T> extends StatelessWidget {
  const BaseAutocompleteOptions({
    super.key,
    this.decoration,
    this.displayStringForOption,
    required this.options,
    required this.onSelected,
    required this.maxOptionsHeight,
  });

  final double maxOptionsHeight;
  final OptionsDecoration? decoration;
  final Iterable<AdaptiveSearchItem<T>> options;
  final AutocompleteOnSelected<AdaptiveSearchItem<T>> onSelected;
  final AutocompleteOptionToString<AdaptiveSearchItem<T>>?
      displayStringForOption;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
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
                  final AdaptiveSearchItem<T> option = options.elementAt(index);

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
      orElse: () => const AdaptiveSearchItem(searchKey: ''),
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
