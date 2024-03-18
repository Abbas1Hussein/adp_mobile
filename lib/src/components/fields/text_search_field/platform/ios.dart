import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import '../../../buttons/menu/cupertino_menu_action.dart';
import '../../../icon/icon.dart';
import '../../fields_properties.dart';
import '../search_item.dart';
import 'common.dart';
import 'model.dart';

class CupertinoAutocomplete<T> extends CustomAutocomplete<T> {
  const CupertinoAutocomplete({
    super.key,
    super.onSelected,
    super.initialValue,
    super.optionsMaxHeight,
    super.optionsViewOpenDirection,
    super.displayStringForOption,
    super.optionsBuilder,
    super.fieldViewBuilder,
    super.optionsViewBuilder,
    super.decoration,
    super.fieldProperties,
    super.suffixMode,
    super.onSuffixTap,
    required super.options,
  });

  @override
  Widget defaultFieldViewBuilder(
    BuildContext context,
    TextEditingController textEditingController,
    FocusNode focusNode,
    VoidCallback onFieldSubmitted,
  ) {
    return _CupertinoAutocompleteField(
      focusNode: focusNode,
      decoration: decoration,
      suffixMode: suffixMode,
      onSuffixTap: onSuffixTap,
      fieldProperties:fieldProperties,
      onFieldSubmitted: onFieldSubmitted,
      textEditingController: textEditingController,
    );
  }

  @override
  Widget defaultAutoCompleteOptions(
    BuildContext context,
    AutocompleteOnSelected<AdaptiveSearchItem<T>> onSelected,
    Iterable<AdaptiveSearchItem<T>> options,
  ) {
    return _CupertinoAutocompleteOptions<T>(
      options: options,
      onSelected: onSelected,
      maxOptionsHeight: optionsMaxHeight,
      displayStringForOption: displayStringForOption,
    );
  }
}

class _CupertinoAutocompleteField extends CustomAutocompleteField {
  const _CupertinoAutocompleteField({
    super.suffixMode,
    super.onSuffixTap,
    super.decoration,
    super.fieldProperties,
    required super.focusNode,
    required super.onFieldSubmitted,
    required super.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final Icon? suffixIcon = (fieldProperties?.suffix as AdaptiveIcon?)?.iOS(context);
    return CupertinoSearchTextField(
      decoration: decoration,
      controller: fieldProperties?.controller ?? textEditingController,
      enabled: fieldProperties?.enabled,
      onTap: fieldProperties?.onTap,
      onChanged: fieldProperties?.onChanged,
      restorationId: fieldProperties?.restorationId,
      style: fieldProperties?.style,
      placeholder: fieldProperties?.placeholder,
      placeholderStyle: fieldProperties?.placeholderStyle,
      focusNode: fieldProperties?.focusNode ?? focusNode,
      autofocus: fieldProperties?.autofocus ?? false,
      autocorrect: fieldProperties?.autocorrect ?? true,
      smartDashesType: fieldProperties?.smartDashesType,
      smartQuotesType: fieldProperties?.smartQuotesType,
      keyboardType: fieldProperties?.keyboardType,
      onSuffixTap: onSuffixTap,
      prefixIcon: fieldProperties?.prefix ?? const Icon(CupertinoIcons.search),
      suffixIcon: suffixIcon?? const Icon(CupertinoIcons.xmark_circle_fill),
      suffixMode: suffixMode ?? OverlayVisibilityMode.editing,
      enableIMEPersonalizedLearning: fieldProperties?.enableIMEPersonalizedLearning ?? true,
      onSubmitted: (String value) => onFieldSubmitted(),
    );
  }
}

class _CupertinoAutocompleteOptions<T> extends CustomAutocompleteOptions<T> {
  const _CupertinoAutocompleteOptions({
    super.key,
    super.decoration,
    required super.options,
    required super.onSelected,
    required super.maxOptionsHeight,
    required super.displayStringForOption,
  });

  @override
  Widget backgroundWrapper(BuildContext context, Widget child) {
    return Padding(
      padding: decoration?.margin ?? const EdgeInsets.only(right: 8.0),
      child: DecoratedBox(
        decoration: ShapeDecoration(
          color: CupertinoDynamicColor.resolve(
            decoration?.color ?? kCupertinoMenuActionBackgroundColor,
            context,
          ),
          shape: decoration?.shape ?? const RoundedRectangleBorder(),
        ),
        child: Padding(
          padding: decoration?.padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget optionBuilder(BuildContext context, bool isHighlight,
      VoidCallback onTap, String searchKey) {
    final OptionDecoration? option = decoration?.optionDecoration;

    return ClipRRect(
      borderRadius: option?.borderRadius ?? BorderRadius.zero,
      child: CupertinoListTile(
        onTap: onTap,
        padding: option?.padding ?? kDefaultOptionPadding,
        backgroundColorActivated: option?.pressColor,
        backgroundColor: CupertinoDynamicColor.maybeResolve(
            isHighlight
                ? (option?.highlightColor ?? CupertinoColors.quaternaryLabel)
                : null,
            context),
        title: Builder(
          builder: (BuildContext context) {
            if (isHighlight) {
              SchedulerBinding.instance.addPostFrameCallback(
                (Duration timeStamp) {
                  Scrollable.ensureVisible(context, alignment: 0.5);
                },
              );
            }
            return Text(
              searchKey,
              style: option?.textStyle ??
                  CupertinoTheme.of(context).textTheme.textStyle,
            );
          },
        ),
      ),
    );
  }
}
