import 'package:flutter/cupertino.dart';

import '../../../core/core.dart';
import '../../icon/icon.dart';
import '../base_text_field.dart';
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
    this.decoration,
    this.emptyBuilder,
    this.onSelected,
    this.suffixMode,
    this.onSuffixTap,
    required this.suggestions,
  });

  /// A list of suggestions for the SearchFieldAutoComplete.
  ///
  /// Each suggestion should have a unique searchKey.
  final List<AdaptiveSearchItem<T>> suggestions;

  /// Callback function called when the user selects a value from the search results.
  final ValueChanged<AdaptiveSearchItem<T>>? onSelected;

  final BoxDecoration? decoration;
  final VoidCallback? onSuffixTap;
  final OverlayVisibilityMode? suffixMode;

  /// Callback widget to show when the search returns no results.
  final Widget? Function(String)? emptyBuilder;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return MaterialAutocomplete<T>(
      decoration: decoration,
      suffixMode: suffixMode,
      options: suggestions,
      onSuffixTap: onSuffixTap,
      onSelected: onSelected,
      fieldProperties: fieldProperties,
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoAutocomplete<T>(
      decoration: decoration,
      suffixMode: suffixMode,
      onSuffixTap: onSuffixTap,
      options: suggestions,
      onSelected: onSelected,
      fieldProperties: fieldProperties,
    );
  }
}
