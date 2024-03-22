import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import '../../../buttons/menu/cupertino_menu_action.dart';
import '../../../icon/icon.dart';
import '../search_item.dart';
import 'common.dart';
import 'model.dart';

class CupertinoAutocomplete<T> extends BaseAutocomplete<T> {
  const CupertinoAutocomplete({
    super.key,
    super.onSelected,
    super.initialValue,
    super.optionsMaxHeight,
    super.displayStringForOption,
    super.optionsBuilder,
    super.fieldViewBuilder,
    super.optionsViewBuilder,
    super.fieldProperties,
    super.onSuffixTap,
    super.suffixMode,
    super.decoration,
    super.emptyBuilder,
    super.optionsDecoration,
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
      options: options,
      focusNode: focusNode,
      decoration: decoration,
      suffixMode: suffixMode,
      onSuffixTap: onSuffixTap,
      fieldProperties: fieldProperties,
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
      decoration: optionsDecoration,
      maxOptionsHeight: optionsMaxHeight,
      displayStringForOption: displayStringForOption,
    );
  }
}

class _CupertinoAutocompleteField extends BaseAutocompleteField {
  const _CupertinoAutocompleteField({
    super.suffixMode,
    super.onSuffixTap,
    super.decoration,
    super.fieldProperties,
    required super.options,
    required super.focusNode,
    required super.onFieldSubmitted,
    required super.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final Icon? suffixIcon =
        (fieldProperties?.suffix as AdaptiveIcon?)?.iOS(context);

    final placeholderStyle =
        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              color: CupertinoDynamicColor.resolve(
                  CupertinoColors.secondaryLabel, context),
            );

    return CupertinoSearchTextField(
      decoration: decoration,
      focusNode: focusNode,
      controller: textEditingController,
      enabled: fieldProperties?.enabled,
      onTap: fieldProperties?.onTap,
      onChanged: fieldProperties?.onChanged,
      style: fieldProperties?.style,
      placeholder: fieldProperties?.placeholder,
      placeholderStyle: fieldProperties?.placeholderStyle ?? placeholderStyle,
      restorationId: fieldProperties?.restorationId,
      autofocus: fieldProperties?.autofocus ?? false,
      autocorrect: fieldProperties?.autocorrect ?? true,
      smartDashesType: fieldProperties?.smartDashesType,
      smartQuotesType: fieldProperties?.smartQuotesType,
      keyboardType: fieldProperties?.keyboardType,
      prefixIcon: fieldProperties?.prefix ?? const Icon(CupertinoIcons.search),
      onSuffixTap: onSuffixTap,
      suffixIcon: suffixIcon ?? const Icon(CupertinoIcons.xmark_circle_fill),
      suffixMode: suffixMode ?? OverlayVisibilityMode.editing,
      enableIMEPersonalizedLearning:
          fieldProperties?.enableIMEPersonalizedLearning ?? true,
      onSubmitted: (String value) => onFieldSubmitted(),
    );
  }
}

class _CupertinoAutocompleteOptions<T> extends BaseAutocompleteOptions<T> {
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
    const effectedPadding = EdgeInsets.only(right: 8.0);

    return Padding(
      padding: decoration?.margin?.add(effectedPadding) ?? effectedPadding,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          color: CupertinoDynamicColor.resolve(
            decoration?.color ?? kCupertinoMenuActionBackgroundColor,
            context,
          ),
          shape: decoration?.shape ??
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              ),
        ),
        child: Padding(
          padding: decoration?.padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget emptyBuilder(BuildContext context, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, right: 8.0),
      child: CupertinoPopupSurface(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: kDefaultOptionPadding,
            child: Align(
              alignment: Alignment.center,
              widthFactor: 1,
              heightFactor: 1,
              child: Text(
                'No matches found: $value',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget optionBuilder(BuildContext context, int index, bool isHighlight,
      VoidCallback onTap, String searchKey) {
    final OptionDecoration? option = decoration?.optionDecoration;

    return Padding(
      padding: option?.margin ?? kDefaultOptionMargin,
      child: ClipRRect(
        borderRadius: option?.borderRadius ??
            (index == 0
                ? const BorderRadius.vertical(top: Radius.circular(8.0))
                : BorderRadius.zero),
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
      ),
    );
  }
}
