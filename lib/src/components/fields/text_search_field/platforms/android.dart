import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';
import '../base_properties.dart';

class TextSearchFieldAndroid extends StatefulWidget
    implements BaseSearchFieldProperties {
  const TextSearchFieldAndroid({
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
  final OverlayVisibilityMode? suffixMode;
  @override
  final EdgeInsetsGeometry? suffixInsets;

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

  final SearchFieldAndroidProperty? property;

  @override
  State<TextSearchFieldAndroid> createState() => _TextSearchFieldAndroidState();
}

class _TextSearchFieldAndroidState extends State<TextSearchFieldAndroid> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller.addListener(_listener);
    super.initState();
  }

  void _listener() {
    setState(() {
      // Rebuild the widget on text change to show/hide the clear icon
      // button.
    });
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.decoration?.color != null
        ? const WidgetStatePropertyAll(Colors.transparent)
        : null;

    // The icon size will be scaled by a factor of the accessibility text scale.
    final double scaledIconSize = MediaQuery.textScalerOf(context).scale(
      widget.itemSize ?? IconTheme.of(context).size ?? 21.0,
    );

    final IconThemeData iconThemeData = IconThemeData(
      color: widget.itemColor ?? IconTheme.of(context).color,
      size: scaledIconSize,
    );

    final leading = Padding(
      padding: widget.prefixInsets ?? EdgeInsets.zero,
      child: IconTheme.merge(
        data: iconThemeData,
        child: widget.prefixIcon ?? const Icon(Icons.search),
      ),
    );

    final trailing = showClearButton
        ? Padding(
            padding: widget.prefixInsets ?? EdgeInsets.zero,
            child: IconTheme.merge(
              data: iconThemeData,
              child: IconButton(
                padding: widget.prefixInsets,
                onPressed: widget.onSuffixTap ?? controller.clear,
                icon: widget.suffixIcon ?? const Icon(Icons.clear),
              ),
            ),
          )
        : null;

    RoundedRectangleBorder? effectiveBorder;
    if (widget.decoration != null) {
      effectiveBorder = const RoundedRectangleBorder();
      if (widget.decoration!.borderRadius != null) {
        effectiveBorder = RoundedRectangleBorder(
          borderRadius: widget.decoration!.borderRadius!,
        );
      }
    }

    return DecoratedBox(
      decoration: widget.decoration ?? const BoxDecoration(),
      child: SearchBar(
        controller: controller,
        constraints: widget.constraints,
        shape: WidgetStatePropertyAll(effectiveBorder),
        padding: WidgetStatePropertyAll(widget.padding),
        textStyle: WidgetStatePropertyAll(widget.style),
        hintStyle: WidgetStatePropertyAll(widget.placeholderStyle),
        hintText: widget.placeholder ??
            MaterialLocalizations.of(context).searchFieldLabel,
        leading: leading,
        trailing: [if (trailing != null) trailing],
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        // constraints: const BoxConstraints.tightFor(height: 45.0),
        shadowColor: color,
        backgroundColor: color,
        surfaceTintColor: color,
        focusNode: widget.focusNode,
        elevation: widget.property?.elevation,
        overlayColor: widget.property?.overlayColor,
        textCapitalization: widget.property?.textCapitalization,
      ),
    );
  }

  bool get showClearButton {
    return _shouldShowAttachment(
      hasText: controller.text.isNotEmpty,
      attachment: widget.suffixMode ?? OverlayVisibilityMode.editing,
    );
  }

  static bool _shouldShowAttachment({
    required bool hasText,
    required OverlayVisibilityMode attachment,
  }) {
    return switch (attachment) {
      OverlayVisibilityMode.never => false,
      OverlayVisibilityMode.always => true,
      OverlayVisibilityMode.editing => hasText,
      OverlayVisibilityMode.notEditing => !hasText,
    };
  }
}

class SearchFieldAndroidProperty extends CoreAndroidProperty {
  const SearchFieldAndroidProperty({
    this.elevation,
    this.overlayColor,
    this.textCapitalization,
  });

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization? textCapitalization;

  /// {@macro flutter.widgets.Focus.focusNode}
  /// final FocusNode? focusNode;

  /// The elevation of the search bar's [Material].
  ///
  /// If null, the value of [SearchBarThemeData.elevation] will be used. If this
  /// is also null, then default value is 6.0.
  final WidgetStateProperty<double?>? elevation;

  /// The highlight color that's typically used to indicate that
  /// the search bar is focused, hovered, or pressed.
  final WidgetStateProperty<Color?>? overlayColor;
}
