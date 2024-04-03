import '../../../../core/common/construct/properties.dart';
import '../../text_search_field/base_properties.dart';
import '../../text_search_field/platforms/platforms.dart';

class AutocompleteFieldProperties extends BaseSearchFieldProperties {
  const AutocompleteFieldProperties({
    super.style,
    super.placeholder,
    super.placeholderStyle,
    super.onTap,
    super.onChanged,
    super.onSubmitted,
    super.decoration,
    super.controller,
    super.constraints,
    super.prefixIcon,
    super.prefixInsets,
    super.padding,
    super.focusNode,
    super.itemColor,
    super.itemSize,
    super.suffixIcon,
    super.suffixInsets,
    super.onSuffixTap,
    super.suffixMode,
    this.properties,
  });

  /// Platform-specific properties for the SearchField in AdaptiveAutocomplete widget.
  ///
  /// This allows you to configure specific behavior or styling for Material and Cupertino implementations of the widget.
  final CoreProperties<SearchFieldAndroidProperty, SearchFieldIOSProperty>?
      properties;
}
