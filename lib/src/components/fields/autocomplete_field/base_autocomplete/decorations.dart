import 'package:flutter/material.dart';

/// A class to customize the appearance of autocomplete options.
class OptionsDecoration {
  const OptionsDecoration({
    this.color,
    this.shape,
    this.margin,
    this.padding,
    this.optionDecoration,
  });

  /// The background color of the autocomplete options.
  final Color? color;

  /// The shape of the autocomplete options.
  final ShapeBorder? shape;

  /// The margin around the autocomplete options.
  final EdgeInsetsGeometry? margin;

  /// The padding within the autocomplete options.
  final EdgeInsetsGeometry? padding;

  /// Decoration options for individual options within the autocomplete.
  final OptionDecoration? optionDecoration;
}

const kDefaultOptionsPadding = EdgeInsets.all(16.0);

const kDefaultOptionsMargin = EdgeInsets.fromLTRB(0, 2.0, 8, 0);

/// A class to customize the appearance of individual autocomplete options.
class OptionDecoration {
  const OptionDecoration({
    this.margin = kDefaultOptionsMargin,
    this.padding = kDefaultOptionsPadding,
    this.textStyle,
    this.borderRadius,
    this.pressColor,
    this.highlightColor,
  });

  /// The press color of the autocomplete option when pressed.
  final Color? pressColor;

  /// The background color of the autocomplete option when highlighted.
  final Color? highlightColor;

  /// The text style of the autocomplete option.
  final TextStyle? textStyle;

  /// The margin within the autocomplete option.
  final EdgeInsetsGeometry? margin;

  /// The padding within the autocomplete option.
  final EdgeInsetsGeometry? padding;

  /// The border radius of the autocomplete option.
  final BorderRadiusGeometry? borderRadius;
}
