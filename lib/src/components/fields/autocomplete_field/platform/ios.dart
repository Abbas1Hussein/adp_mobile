import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import '../../../buttons/menu/cupertino_menu_action.dart';
import '../../text_search_field/platforms/ios.dart';
import '../autocomplete_item.dart';
import '../base_autocomplete/base_autocomplete.dart';
import '../base_autocomplete/decorations.dart';

class CupertinoAutocomplete<T> extends BaseAutocomplete<T> {
  const CupertinoAutocomplete({
    super.key,
    super.onSelected,
    super.initialValue,
    super.emptyBuilder,
    super.displayStringForOption,
    super.fieldViewBuilder,
    super.autocompleteField,
    super.optionsMaxHeight,
    super.optionsBuilder,
    super.optionsViewBuilder,
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
    return TextSearchFieldIOS(
      focusNode: focusNode,
      controller: textEditingController,
      constraints: autocompleteField?.constraints,
      style: autocompleteField?.style,
      onTap: autocompleteField?.onTap,
      padding: autocompleteField?.padding,
      itemSize: autocompleteField?.itemSize,
      itemColor: autocompleteField?.itemColor,
      onChanged: autocompleteField?.onChanged,
      onSuffixTap: autocompleteField?.onSuffixTap,
      decoration: autocompleteField?.decoration,
      prefixIcon: autocompleteField?.prefixIcon,
      suffixIcon: autocompleteField?.suffixIcon,
      suffixMode: autocompleteField?.suffixMode,
      prefixInsets: autocompleteField?.prefixInsets,
      suffixInsets: autocompleteField?.suffixInsets,
      property: autocompleteField?.properties?.iOS,
      placeholder: autocompleteField?.placeholder,
      placeholderStyle: autocompleteField?.placeholderStyle,
      onSubmitted: (String value) {
        autocompleteField?.onSubmitted?.call(value);
        onFieldSubmitted();
      },
    );
  }

  @override
  Widget defaultAutoCompleteOptions(
    BuildContext context,
    AutocompleteOnSelected<AdaptiveAutocompleteItem<T>> onSelected,
    Iterable<AdaptiveAutocompleteItem<T>> options,
  ) {
    return _CupertinoAutocompleteOptions<T>(
      options: options,
      onSelected: onSelected,
      emptyBuilderWidget: emptyBuilder,
      decoration: optionsDecoration,
      maxOptionsHeight: optionsMaxHeight,
      displayStringForOption: displayStringForOption,
    );
  }
}

class _CupertinoAutocompleteOptions<T> extends BaseAutocompleteOptions<T> {
  const _CupertinoAutocompleteOptions({
    super.key,
    super.decoration,
    super.emptyBuilderWidget,
    required super.options,
    required super.onSelected,
    required super.maxOptionsHeight,
    required super.displayStringForOption,
  });

  @override
  Widget backgroundWrapper(BuildContext context, Widget child) {
    return Padding(
      padding: decoration?.margin ?? kDefaultOptionsMargin,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          color: CupertinoDynamicColor.resolve(
            decoration?.color ?? kCupertinoMenuActionBackgroundColor,
            context,
          ),
          shape: decoration?.shape ??
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
              ),
        ),
        child: Padding(
            padding: decoration?.padding ?? EdgeInsets.zero, child: child),
      ),
    );
  }

  @override
  Widget emptyBuilder(BuildContext context, String value) {
    return emptyBuilderWidget?.call(value) ??
        Padding(
          padding: const EdgeInsets.only(top: 2.0, right: 8.0),
          child: CupertinoPopupSurface(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: kDefaultOptionsPadding,
                child: Align(
                  alignment: Alignment.center,
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Text(
                    'No matches found: $value',
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
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
      padding: option?.margin ?? const EdgeInsets.symmetric(vertical: 1.0),
      child: ClipRRect(
        borderRadius: option?.borderRadius ??
            (index == 0
                ? const BorderRadius.vertical(top: Radius.circular(4.0))
                : BorderRadius.zero),
        child: CupertinoListTile(
          onTap: onTap,
          padding: option?.padding,
          backgroundColorActivated: option?.pressColor,
          backgroundColor: CupertinoDynamicColor.maybeResolve(
            isHighlight
                ? (option?.highlightColor ?? CupertinoColors.quaternaryLabel)
                : null,
            context,
          ),
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
