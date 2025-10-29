import 'package:flutter/cupertino.dart';

abstract class BaseSearchFieldProperties {
  const BaseSearchFieldProperties({
    this.style,
    this.placeholder,
    this.placeholderStyle,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.decoration,
    this.controller,
    this.constraints,
    this.prefixIcon,
    this.prefixInsets,
    this.padding,
    this.focusNode,
    this.itemColor,
    this.itemSize,
    this.suffixIcon,
    this.suffixInsets,
    this.onSuffixTap,
    this.suffixMode,
  });

  /// Callback that will be invoked when the user taps on the text search field.
  ///
  /// This can be useful for initiating actions without necessarily editing the text.
  final VoidCallback? onTap;

  /// Callback that will be invoked whenever the text in the text search field changes.
  ///
  /// This allows you to react to the user's input in real-time and potentially update the
  /// UI or perform other actions based on the new value.
  final ValueChanged<String>? onChanged;

  /// Callback that will be invoked when the user submits the text in the field.
  ///
  /// This typically happens when the user presses the "Enter" key or a platform-specific "Done" button.
  final ValueChanged<String>? onSubmitted;

  /// A widget that will be displayed at the beginning of the text search field.
  /// This is commonly used for icons such as search or user profiles.
  ///
  /// Defaults to displaying a platform-specific 'search' icon data.
  final Widget? prefixIcon;

  /// Additional insets specifically for the prefix icon,
  /// allowing for fine-tuned positioning within the text field.
  final EdgeInsetsGeometry? prefixInsets;

  /// The padding between the search bar's boundary and its contents.
  final EdgeInsetsGeometry? padding;

  /// An icon that will be displayed at the end of the text search field.
  /// This is often used for icons like clear, or visibility toggles.
  ///
  /// Defaults to displaying a platform-specific 'clear' icon data.
  final Icon? suffixIcon;

  /// Similar to prefixInsets, but for the suffix icon, adjusting its positioning within the text search field.
  final EdgeInsetsGeometry? suffixInsets;

  /// Callback that will be invoked when the user taps on the suffix icon.
  ///
  /// This allows you to define custom actions specific to interacting with the suffix icon.
  /// Default to erase the user entered text.
  final VoidCallback? onSuffixTap;

  /// Controls the visibility of the suffix icon. You can choose from options like:
  ///
  ///  * [OverlayVisibilityMode.always], The suffix icon will always be displayed.
  ///  * [OverlayVisibilityMode.editing], The suffix icon will only be displayed when the text field is being edited.
  ///  * [OverlayVisibilityMode.notEditing], The suffix icon will only be displayed when the text field is not being edited.
  ///  * [OverlayVisibilityMode.never], The suffix icon will not be displayed.
  final OverlayVisibilityMode? suffixMode;

  /// The text style for the text entered in the field.
  ///
  /// This affects the font, size, color, and decoration of the text.
  final TextStyle? style;

  /// Placeholder text that is displayed when the text search field is empty.
  ///
  /// This provides guidance for the user on what kind of input is expected.
  /// Default to platform Localizations search.
  final String? placeholder;

  /// The text style for the placeholder text.
  ///
  /// This allows you to visually differentiate the placeholder text from the actual user input.
  final TextStyle? placeholderStyle;

  /// The color of the prefix and suffix icons (if used).
  ///
  /// This ensures a cohesive look for the entire text field component.
  final Color? itemColor;

  /// The size of the prefix and suffix icons (if used).
  ///
  /// This maintains consistency in visual proportions for a better user experience.
  final double? itemSize;

  /// A focus node that manages the focus state of the text search field.
  ///
  /// This allows you to programmatically control when and how the field receives focus.
  final FocusNode? focusNode;

  /// The decoration applied to the text search field, such as borders, backgrounds, and shadows.
  final BoxDecoration? decoration;

  /// The constraints that apply to the search field's size and layout.
  final BoxConstraints? constraints;

  /// A TextEditingController that provides a handle for retrieving and modifying the text search field's value.
  ///
  /// It also allows for managing the selection of text within the field.
  final TextEditingController? controller;
}
