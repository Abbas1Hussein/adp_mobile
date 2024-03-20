import 'package:flutter/cupertino.dart';

import '../../../core/core.dart';
import '../../icon/icon.dart';
import '../base_text_field.dart';
import 'platform/empty_widget.dart';
import 'platform/model.dart';
import 'platform/platform.dart';
import 'search_item.dart';

/// A custom text search field widget that adapts its appearance based on the platform.
///
/// Use this widget to create text search field  with platform-specific
/// styling and behavior.
final class AdaptiveTextSearchField<T> extends BaseTextField {
  /// An AdaptiveTextSearchField provides a list of suggestions for a user to select from
  /// as they type.
  ///
  /// See also:
  ///
  ///  * [AdaptiveTextField], which provides a versatile text input field.
  ///  * [AdaptiveTextFormField], a form field that wraps around AdaptiveTextField, enhancing it for form validation.
  ///  * [Overlay], which is used to show the suggestion popup
  const AdaptiveTextSearchField({
    super.key,
    super.builders,
    super.style,
    super.enabled,
    super.controller,
    super.autofocus,
    super.focusNode,
    super.placeholder,
    super.placeholderStyle,
    super.prefix,
    AdaptiveIcon? super.suffix,
    this.fieldViewBuilder,
    this.optionsBuilder,
    this.optionsMaxHeight = 200,
    this.optionInitialValue,
    this.optionsViewBuilder,
    this.displayStringForOption,
    this.emptyBuilder,
    this.onSelected,
    this.suffixMode,
    this.onSuffixTap,
    this.decoration,
    this.optionsDecoration,
    required this.options,
  });

  /// A list of suggestions for the SearchFieldAutoComplete.
  ///
  /// Each suggestion should have a unique searchKey.
  final List<AdaptiveSearchItem<T>> options;

  /// Callback function called when the user selects a value from the search results.
  final ValueChanged<AdaptiveSearchItem<T>>? onSelected;

  /// {@macro flutter.widgets.RawAutocomplete.displayStringForOption}
  final AutocompleteOptionToString<AdaptiveSearchItem<T>>?
      displayStringForOption;

  /// {@macro flutter.widgets.RawAutocomplete.fieldViewBuilder}
  ///
  /// If not provided, will build a standard Material-style text field by
  /// default.
  final AutocompleteFieldViewBuilder? fieldViewBuilder;

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
  final TextEditingValue? optionInitialValue;

  final VoidCallback? onSuffixTap;
  final OverlayVisibilityMode? suffixMode;

  final BoxDecoration? decoration;
  final OptionsDecoration? optionsDecoration;

  final EmptyBuilder? emptyBuilder;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return MaterialAutocomplete<T>(
      options: options,
      suffixMode: suffixMode,
      onSelected: onSelected,
      decoration: decoration,
      onSuffixTap: onSuffixTap,
      emptyBuilder: emptyBuilder,
      optionsBuilder: optionsBuilder,
      initialValue: optionInitialValue,
      fieldProperties: fieldProperties,
      fieldViewBuilder: fieldViewBuilder,
      optionsMaxHeight: optionsMaxHeight,
      optionsDecoration: optionsDecoration,
      optionsViewBuilder: optionsViewBuilder,
      displayStringForOption: displayStringForOption,
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoAutocomplete<T>(
      options: options,
      suffixMode: suffixMode,
      onSelected: onSelected,
      decoration: decoration,
      onSuffixTap: onSuffixTap,
      emptyBuilder: emptyBuilder,
      optionsBuilder: optionsBuilder,
      initialValue: optionInitialValue,
      fieldProperties: fieldProperties,
      fieldViewBuilder: fieldViewBuilder,
      optionsMaxHeight: optionsMaxHeight,
      optionsDecoration: optionsDecoration,
      optionsViewBuilder: optionsViewBuilder,
      displayStringForOption: displayStringForOption,
    );
  }
}
