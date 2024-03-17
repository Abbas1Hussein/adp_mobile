import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import '../../../buttons/menu/cupertino_menu_action.dart';
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
    required super.focusNode,
    required super.onFieldSubmitted,
    required super.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      focusNode: focusNode,
      borderRadius: BorderRadius.zero,
      controller: textEditingController,
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
      padding: decoration?.margin ?? const EdgeInsets.only(
        right: 8.0
      ),
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
  Widget optionBuilder(BuildContext context, bool isHighlight, VoidCallback onTap, String searchKey) {
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
