import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../fields_properties.dart';
import '../search_item.dart';
import 'model.dart';

/// See also:
///
///  * [RawAutocomplete], which is what Autocomplete is built upon, and which
///    contains more detailed examples.
abstract class CustomAutocomplete<T> extends StatelessWidget {
  /// Creates an instance of [CustomAutocomplete].
  const CustomAutocomplete({
    super.key,
    this.onSelected,
    this.initialValue,
    this.optionsMaxHeight = 200.0,
    this.optionsViewOpenDirection = OptionsViewOpenDirection.down,
    this.displayStringForOption = defaultStringForOption,
    this.optionsViewBuilder,
    this.fieldViewBuilder,
    this.optionsBuilder,
    this.suffixMode,
    this.onSuffixTap,
    this.decoration,
    this.fieldProperties,
    required this.options,
  });

  /// A list of suggestions for the SearchFieldAutoComplete.
  ///
  /// Each suggestion should have a unique searchKey.
  final List<AdaptiveSearchItem<T>> options;

  /// {@macro flutter.widgets.RawAutocomplete.displayStringForOption}
  final AutocompleteOptionToString<AdaptiveSearchItem<T>>
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

  /// {@macro flutter.widgets.RawAutocomplete.optionsViewOpenDirection}
  final OptionsViewOpenDirection optionsViewOpenDirection;

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
  static String defaultStringForOption(AdaptiveSearchItem option) =>
      option.searchKey;


  final BoxDecoration? decoration;
  final VoidCallback? onSuffixTap;
  final OverlayVisibilityMode? suffixMode;
  final FieldProperties? fieldProperties;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<AdaptiveSearchItem<T>>(
      onSelected: onSelected,
      initialValue: initialValue,
      displayStringForOption: displayStringForOption,
      optionsViewOpenDirection: optionsViewOpenDirection,
      optionsBuilder: optionsBuilder ?? _optionsBuilder,
      fieldViewBuilder: fieldViewBuilder ?? defaultFieldViewBuilder,
      optionsViewBuilder: optionsViewBuilder ?? defaultAutoCompleteOptions,
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
    if (textEditingValue.text == '') {
      return Iterable<AdaptiveSearchItem<T>>.empty();
    }

    return options.where(
      (AdaptiveSearchItem<T> option) {
        return option.searchKey.contains(
          textEditingValue.text.toLowerCase(),
        );
      },
    );
  }
}

abstract class CustomAutocompleteField extends StatelessWidget {
  const CustomAutocompleteField({
    super.key,
    this.decoration,
    this.suffixMode,
    this.onSuffixTap,
    this.fieldProperties,
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
}

abstract class CustomAutocompleteFulField extends StatefulWidget {
  const CustomAutocompleteFulField({
    super.key,
    this.decoration,
    this.suffixMode,
    this.onSuffixTap,
    this.fieldProperties,
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

  Widget build(BuildContext context) => const SizedBox.shrink();

  @override
  State<CustomAutocompleteFulField> createState() =>
      _CustomAutocompleteFulFieldState();
}

class _CustomAutocompleteFulFieldState
    extends State<CustomAutocompleteFulField> {

  @override
  void initState() {
    super.initState();
    if (widget.fieldProperties?.controller == null){
      widget.textEditingController.addListener(_listener);

    }
  }

  void _listener() => setState(() {});

  @override
  Widget build(BuildContext context) => widget.build(context);

  @override
  void dispose() {
    if (widget.fieldProperties?.controller == null){
      widget.textEditingController.removeListener(_listener);
    }
    super.dispose();
  }
}

abstract class CustomAutocompleteOptions<T> extends StatelessWidget {
  const CustomAutocompleteOptions({
    super.key,
    this.decoration,
    required this.options,
    required this.onSelected,
    required this.maxOptionsHeight,
    required this.displayStringForOption,
  });

  final double maxOptionsHeight;
  final Iterable<AdaptiveSearchItem<T>> options;
  final OptionsDecoration? decoration;
  final AutocompleteOnSelected<AdaptiveSearchItem<T>> onSelected;
  final AutocompleteOptionToString<AdaptiveSearchItem<T>>
      displayStringForOption;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxOptionsHeight),
        child: backgroundWrapper(
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
                return option.builder!(isHighlight, () => onSelected(option));
              }

              return optionBuilder(
                context,
                isHighlight,
                () => onSelected(option),
                displayStringForOption(option),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget backgroundWrapper(BuildContext context, Widget child);

  Widget optionBuilder(BuildContext context, bool isHighlight,
      VoidCallback onTap, String searchKey);
}
