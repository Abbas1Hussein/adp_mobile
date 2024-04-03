import 'package:flutter/cupertino.dart';

import '../../../core/core.dart';
import 'autocomplete_item.dart';
import 'base_autocomplete/decorations.dart';
import 'base_autocomplete/empty_widget.dart';
import 'base_autocomplete/field_properties.dart';
import 'platform/platform.dart';

/// A custom autocomplete field widget that adapts its appearance based on the platform.
///
/// On iOS, [CupertinoAutocomplete] will be used.
/// On Android, [MaterialAutocomplete] will be used.
///
/// Use this widget to create text search field  with platform-specific
/// styling and behavior.
class AdaptiveAutocompleteField<T> extends CoreAdaptiveComponent {
  /// An AdaptiveTextSearchField provides a list of suggestions for a user to select from
  /// as they type.
  ///
  /// See also:
  ///
  ///  * [Overlay], which is used to show the suggestion popup
  ///  * [AdaptiveTextField], which provides a versatile text input field.
  ///  * [AdaptiveTextFormField], a form field that wraps around AdaptiveTextField, enhancing it for form validation.
  ///  * [AdaptiveTextSearchField], which creates a similar adaptive search field without autocomplete functionality.
  const AdaptiveAutocompleteField({
    super.key,
    super.builders,
    this.onSelected,
    this.emptyBuilder,
    this.fieldViewBuilder,
    this.autocompleteFieldProperties,
    this.displayStringForOption,
    this.optionsBuilder,
    this.optionsMaxHeight = 200,
    this.optionInitialValue,
    this.optionsViewBuilder,
    this.optionsDecoration,
    required this.options,
  });

  /// A list of suggestions for the SearchFieldAutoComplete.
  ///
  /// Each suggestion should have a unique searchKey.
  final List<AdaptiveAutoCompleteItem<T>> options;

  /// Callback function called when the user selects a value from the search results.
  final ValueChanged<AdaptiveAutoCompleteItem<T>>? onSelected;

  /// {@macro flutter.widgets.RawAutocomplete.displayStringForOption}
  final AutocompleteOptionToString<AdaptiveAutoCompleteItem<T>>?
      displayStringForOption;

  /// {@macro flutter.widgets.RawAutocomplete.optionsBuilder}
  final AutocompleteOptionsBuilder<AdaptiveAutoCompleteItem<T>>? optionsBuilder;

  /// {@macro flutter.widgets.RawAutocomplete.optionsViewBuilder}
  ///
  /// If not provided, will build a standard Material-style list of results by
  /// default.
  final AutocompleteOptionsViewBuilder<AdaptiveAutoCompleteItem<T>>?
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

  /// {@macro flutter.widgets.RawAutocomplete.fieldViewBuilder}
  ///
  /// If not provided, will build a standard Material-style text field by
  /// default.
  final AutocompleteFieldViewBuilder? fieldViewBuilder;

  /// A builder function that defines the widget displayed when there are no options available in the dropdown list.
  ///
  /// This is useful for providing feedback to the user about the lack of suggestions or offering alternative actions.
  final EmptyBuilder? emptyBuilder;

  /// A decoration object that allows customization of the visual appearance of the options list in the dropdown.
  ///
  /// This can include properties like background color, shapeBorder, padding, etc.
  final OptionsDecoration? optionsDecoration;

  /// Properties for the search-field widget.
  final AutocompleteFieldProperties? autocompleteFieldProperties;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return MaterialAutocomplete<T>(
      options: options,
      onSelected: onSelected,
      emptyBuilder: emptyBuilder,
      optionsBuilder: optionsBuilder,
      initialValue: optionInitialValue,
      fieldViewBuilder: fieldViewBuilder,
      optionsMaxHeight: optionsMaxHeight,
      optionsDecoration: optionsDecoration,
      optionsViewBuilder: optionsViewBuilder,
      displayStringForOption: displayStringForOption,
      autocompleteField: autocompleteFieldProperties,
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoAutocomplete<T>(
      options: options,
      onSelected: onSelected,
      emptyBuilder: emptyBuilder,
      optionsBuilder: optionsBuilder,
      initialValue: optionInitialValue,
      fieldViewBuilder: fieldViewBuilder,
      optionsMaxHeight: optionsMaxHeight,
      optionsDecoration: optionsDecoration,
      optionsViewBuilder: optionsViewBuilder,
      displayStringForOption: displayStringForOption,
      autocompleteField: autocompleteFieldProperties,
    );
  }
}
