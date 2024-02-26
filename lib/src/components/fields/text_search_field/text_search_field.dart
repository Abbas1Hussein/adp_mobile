import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_field_autocomplete/search_field_autocomplete.dart';

import '../../../core/core.dart';
import '../base_text_field.dart';
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
    SuggestionDecoration? super.decoration,
    this.emptyBuilder,
    this.onSelected,
    required this.suggestions,
  });

  /// Callback widget to show when the search returns no results.
  final Widget? Function(String)? emptyBuilder;

  /// A list of suggestions for the SearchFieldAutoComplete.
  ///
  /// Each suggestion should have a unique searchKey.
  final List<AdaptiveSearchItem<T>> suggestions;

  /// Callback function called when the user selects a value from the search results.
  final ValueChanged<AdaptiveSearchItem<T>>? onSelected;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return SearchFieldAutoComplete(
      enabled: enabled,
      autofocus: autofocus,
      focusNode: focusNode,
      controller: controller,
      suggestionStyle: style,
      suggestions: suggestions,
      emptyBuilder: emptyBuilder,
      placeholder: placeholder,
      placeholderStyle: placeholderStyle,
      appearance: Appearance.material,
      onSuggestionSelected: (searchFieldItem) {
        onSelected?.call(AdaptiveSearchItem.from(searchFieldItem));
      },
      suggestionsDecoration: suggestionDecoration(Theme.of(context).highlightColor),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return SearchFieldAutoComplete(
      enabled: enabled,
      autofocus: autofocus,
      focusNode: focusNode,
      controller: controller,
      suggestionStyle: style,
      suggestions: suggestions,
      emptyBuilder: emptyBuilder,
      placeholder: placeholder,
      placeholderStyle: placeholderStyle,
      appearance: Appearance.cupertino,
      onSuggestionSelected: (searchFieldItem) {
        onSelected?.call(AdaptiveSearchItem.from(searchFieldItem));
      },
      suggestionsDecoration: suggestionDecoration(CupertinoColors.tertiarySystemFill),
    );
  }

  SuggestionDecoration? suggestionDecoration(Color color) {
    final d = decoration as SuggestionDecoration?;

    return SuggestionDecoration(
      color: d?.color ?? color,
      border: d?.border,
      gradient: d?.gradient,
      boxShadow: d?.boxShadow,
      marginSuggestions: d?.marginSuggestions,
      paddingSuggestions: d?.paddingSuggestions,
      borderRadius: d?.borderRadius ?? BorderRadius.circular(8.0),
    );
  }
}
