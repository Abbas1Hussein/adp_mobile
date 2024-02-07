import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:search_field_autocomplete/search_field_autocomplete.dart';

/// A custom text search field widget that adapts its appearance based on the platform.
///
/// Use this widget to create text search field  with platform-specific
/// styling and behavior:
/// - On macOS, [MacosSearchField] is utilized.
/// - On Windows, [AutoSuggestBox] is used.
class AdaptiveTextSearchField<T> extends StatelessWidget {
  /// An AdaptiveTextSearchField provides a list of suggestions for a user to select from
  /// as they type.
  ///
  /// See also:
  ///
  ///  * [AdaptiveTextField], which provides a versatile text input field.
  ///  * [AdaptiveTextFormField], a form field that wraps around AdaptiveTextField, enhancing it for form validation.
  ///  * [Overlay], which is used to show the suggestion popup
  const AdaptiveTextSearchField({super.key, required this.suggestions});

  /// A list of suggestions for the SearchFieldAutoComplete.
  ///
  /// Each suggestion should have a unique searchKey.
  final List<SearchFieldAutoCompleteItem<T>> suggestions;

  @override
  Widget build(BuildContext context) {
    return SearchFieldAutoComplete(
      suggestions: suggestions,
      appearance: Appearance.material,
    );
  }
}
