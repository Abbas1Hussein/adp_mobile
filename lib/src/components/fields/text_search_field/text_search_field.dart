import 'package:flutter/cupertino.dart';

import '../../../core/core.dart';
import 'base_properties.dart';
import 'platforms/platforms.dart';

class AdaptiveTextSearchField extends CoreAdaptiveComponent<
    SearchFieldAndroidProperty,
    SearchFieldIOSProperty> implements BaseSearchFieldProperties {
  const AdaptiveTextSearchField({
    super.key,
    super.builders,
    super.properties,
    this.style,
    this.padding,
    this.placeholder,
    this.placeholderStyle,
    this.onTap,
    this.onChanged,
    this.onSuffixTap,
    this.onSubmitted,
    this.controller,
    this.prefixIcon,
    this.prefixInsets,
    this.itemColor,
    this.itemSize,
    this.focusNode,
    this.suffixIcon,
    this.suffixInsets,
    this.suffixMode = OverlayVisibilityMode.editing,
    this.decoration,
  });

  /// Callback that will be invoked when the user taps on the text field.
  ///
  /// This can be useful for initiating actions without necessarily editing the text.
  @override
  final VoidCallback? onTap;

  /// Callback that will be invoked whenever the text in the text field changes.
  ///
  /// This allows you to react to the user's input in real-time and potentially update the
  /// UI or perform other actions based on the new value.
  @override
  final ValueChanged<String>? onChanged;

  /// Callback that will be invoked when the user submits the text in the field.
  ///
  /// This typically happens when the user presses the "Enter" key or a platform-specific "Done" button.
  @override
  final ValueChanged<String>? onSubmitted;

  /// A widget that will be displayed at the beginning of the text field.
  /// This is commonly used for icons such as search or user profiles.
  ///
  /// Defaults to displaying a platform-specific 'search' icon data.
  @override
  final Widget? prefixIcon;

  /// Additional insets specifically for the prefix icon,
  /// allowing for fine-tuned positioning within the text field.
  @override
  final EdgeInsetsGeometry? prefixInsets;

  /// The padding between the search bar's boundary and its contents.
  @override
  final EdgeInsetsGeometry? padding;

  /// An icon that will be displayed at the end of the text field.
  /// This is often used for icons like clear, or visibility toggles.
  ///
  /// Defaults to displaying a platform-specific 'clear' icon data.
  @override
  final Icon? suffixIcon;

  /// Similar to prefixInsets, but for the suffix icon, adjusting its positioning within the text field.
  @override
  final EdgeInsetsGeometry? suffixInsets;

  /// Callback that will be invoked when the user taps on the suffix icon.
  ///
  /// This allows you to define custom actions specific to interacting with the suffix icon.
  /// Default to erase the user entered text.
  @override
  final VoidCallback? onSuffixTap;

  /// Controls the visibility of the suffix icon. You can choose from options like:
  ///
  ///  * [OverlayVisibilityMode.always], The suffix icon will always be displayed.
  ///  * [OverlayVisibilityMode.editing], The suffix icon will only be displayed when the text field is being edited.
  ///  * [OverlayVisibilityMode.notEditing], The suffix icon will only be displayed when the text field is not being edited.
  ///  * [OverlayVisibilityMode.never], The suffix icon will not be displayed.
  @override
  final OverlayVisibilityMode suffixMode;

  /// The text style for the text entered in the field.
  ///
  /// This affects the font, size, color, and decoration of the text.
  @override
  final TextStyle? style;

  /// Placeholder text that is displayed when the text field is empty.
  ///
  /// This provides guidance for the user on what kind of input is expected.
  /// Default to platform Localizations search.
  @override
  final String? placeholder;

  /// The text style for the placeholder text.
  ///
  /// This allows you to visually differentiate the placeholder text from the actual user input.
  @override
  final TextStyle? placeholderStyle;

  /// The color of the prefix and suffix icons (if used).
  ///
  /// This ensures a cohesive look for the entire text field component.
  @override
  final Color? itemColor;

  /// The size of the prefix and suffix icons (if used).
  ///
  /// This maintains consistency in visual proportions for a better user experience.
  @override
  final double? itemSize;

  /// A focus node that manages the focus state of the text field.
  ///
  /// This allows you to programmatically control when and how the field receives focus.
  @override
  final FocusNode? focusNode;

  /// The decoration applied to the text field, such as borders, backgrounds, and shadows.
  @override
  final BoxDecoration? decoration;

  /// A TextEditingController that provides a handle for retrieving and modifying the text field's value.
  ///
  /// It also allows for managing the selection of text within the field.
  @override
  final TextEditingController? controller;

  @override
  Widget android(BuildContext context, [SearchFieldAndroidProperty? property]) {
    return TextSearchFieldAndroid(
      property: property,
      focusNode: focusNode,
      controller: controller,

      // styles
      style: style,
      padding: padding,
      decoration: decoration,

      // void-backs
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSubmitted,

      // icons (suffix && prefix)
      itemSize: itemSize,
      itemColor: itemColor,

      // prefix
      prefixIcon: prefixIcon,
      prefixInsets: prefixInsets,

      // placeholder
      placeholder: placeholder,
      placeholderStyle: placeholderStyle,

      // suffix
      suffixIcon: suffixIcon,
      suffixMode: suffixMode,
      onSuffixTap: onSuffixTap,
      suffixInsets: suffixInsets,
    );
  }

  @override
  Widget iOS(BuildContext context, [SearchFieldIOSProperty? property]) {
    return TextSearchFieldIOS(
      property: property,
      focusNode: focusNode,
      controller: controller,

      // styles
      style: style,
      padding: padding,
      decoration: decoration,

      // void-backs
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSubmitted,

      // icons (suffix && prefix)
      itemSize: itemSize,
      itemColor: itemColor,

      // prefix
      prefixIcon: prefixIcon,
      prefixInsets: prefixInsets,

      // placeholder
      placeholder: placeholder,
      placeholderStyle: placeholderStyle,

      // suffix
      suffixIcon: suffixIcon,
      suffixMode: suffixMode,
      onSuffixTap: onSuffixTap,
      suffixInsets: suffixInsets,
    );
  }
}
