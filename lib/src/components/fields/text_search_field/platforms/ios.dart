import 'package:flutter/cupertino.dart';

import '../../../../core/common/construct/property.dart';
import '../base_properties.dart';

class TextSearchFieldIOS extends StatelessWidget
    implements BaseSearchFieldProperties {
  const TextSearchFieldIOS({
    super.key,
    this.style,
    this.padding,
    this.property,
    this.placeholder,
    this.placeholderStyle,
    this.onTap,
    this.onChanged,
    this.onSuffixTap,
    this.onSubmitted,
    this.controller,
    this.constraints,
    this.prefixIcon,
    this.prefixInsets,
    this.itemColor,
    this.itemSize,
    this.focusNode,
    this.suffixIcon,
    this.suffixInsets,
    this.suffixMode,
    this.decoration,
  });

  @override
  final VoidCallback? onTap;
  @override
  final ValueChanged<String>? onChanged;
  @override
  final ValueChanged<String>? onSubmitted;

  @override
  final Widget? prefixIcon;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  final EdgeInsetsGeometry? prefixInsets;

  @override
  final Icon? suffixIcon;
  @override
  final VoidCallback? onSuffixTap;
  @override
  final EdgeInsetsGeometry? suffixInsets;
  @override
  final OverlayVisibilityMode? suffixMode;

  @override
  final TextStyle? style;
  @override
  final String? placeholder;
  @override
  final TextStyle? placeholderStyle;

  @override
  final Color? itemColor;
  @override
  final double? itemSize;
  @override
  final BoxDecoration? decoration;

  @override
  final FocusNode? focusNode;

  @override
  final BoxConstraints? constraints;

  @override
  final TextEditingController? controller;


  final SearchFieldIOSProperty? property;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints ?? const BoxConstraints(minWidth: 360.0, maxWidth: 800.0),
      child: CupertinoSearchTextField(
        style: style,
        decoration: decoration?.copyWith(
          color: decoration?.color ?? CupertinoColors.tertiarySystemFill,
          borderRadius: decoration?.borderRadius ??
              const BorderRadius.all(Radius.circular(9.0)),
        ),
        controller: controller,
        focusNode: focusNode,
        padding:
            padding ?? const EdgeInsetsDirectional.fromSTEB(5.5, 8, 5.5, 8),
        prefixIcon: prefixIcon ?? const Icon(CupertinoIcons.search),
        prefixInsets:
            prefixInsets ?? const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 3),
        suffixIcon: suffixIcon ?? const Icon(CupertinoIcons.xmark_circle_fill),
        suffixInsets:
            suffixInsets ?? const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 2),
        suffixMode: suffixMode ?? OverlayVisibilityMode.editing,
        onSuffixTap: onSuffixTap,
        itemSize: itemSize ?? 20.0,
        itemColor: itemColor ?? CupertinoColors.secondaryLabel,
        smartQuotesType: property?.smartQuotesType,
        smartDashesType: property?.smartDashesType,
        enableIMEPersonalizedLearning:
            property?.enableIMEPersonalizedLearning ?? true,
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        placeholder: placeholder,
        placeholderStyle: placeholderStyle,
      ),
    );
  }
}

class SearchFieldIOSProperty extends CoreIOSProperty {
  const SearchFieldIOSProperty({
    this.smartQuotesType,
    this.smartDashesType,
    this.enableIMEPersonalizedLearning = true,
  });

  /// Whether to allow the platform to automatically format quotes.
  ///
  /// This flag only affects iOS, where it is equivalent to [`UITextSmartQuotesType`](https://developer.apple.com/documentation/uikit/uitextsmartquotestype?language=objc).
  ///
  /// When set to [SmartQuotesType.enabled], it passes
  /// [`UITextSmartQuotesTypeYes`](https://developer.apple.com/documentation/uikit/uitextsmartquotestype/uitextsmartquotestypeyes?language=objc),
  /// and when set to [SmartQuotesType.disabled], it passes
  /// [`UITextSmartQuotesTypeNo`](https://developer.apple.com/documentation/uikit/uitextsmartquotestype/uitextsmartquotestypeno?language=objc).
  ///
  /// If set to null, [SmartQuotesType.enabled] will be used.
  ///
  /// As an example of what this does, a standard vertical double quote
  /// character will be automatically replaced by a left or right double quote
  /// depending on its position in a word.
  ///
  /// Defaults to null.
  ///
  /// See also:
  ///
  ///  * [smartDashesType]
  ///  * <https://developer.apple.com/documentation/uikit/uitextinputtraits>
  final SmartQuotesType? smartQuotesType;

  /// Whether to allow the platform to automatically format dashes.
  ///
  /// This flag only affects iOS versions 11 and above, where it is equivalent to [`UITextSmartDashesType`](https://developer.apple.com/documentation/uikit/uitextsmartdashestype?language=objc).
  ///
  /// When set to [SmartDashesType.enabled], it passes
  /// [`UITextSmartDashesTypeYes`](https://developer.apple.com/documentation/uikit/uitextsmartdashestype/uitextsmartdashestypeyes?language=objc),
  /// and when set to [SmartDashesType.disabled], it passes
  /// [`UITextSmartDashesTypeNo`](https://developer.apple.com/documentation/uikit/uitextsmartdashestype/uitextsmartdashestypeno?language=objc).
  ///
  /// If set to null, [SmartDashesType.enabled] will be used.
  ///
  /// As an example of what this does, two consecutive hyphen characters will be
  /// automatically replaced with one en dash, and three consecutive hyphens
  /// will become one em dash.
  ///
  /// Defaults to null.
  ///
  /// See also:
  ///
  ///  * [smartQuotesType]
  ///  * <https://developer.apple.com/documentation/uikit/uitextinputtraits>
  final SmartDashesType? smartDashesType;

  /// {@macro flutter.services.TextInputConfiguration.enableIMEPersonalizedLearning}
  final bool enableIMEPersonalizedLearning;
}
