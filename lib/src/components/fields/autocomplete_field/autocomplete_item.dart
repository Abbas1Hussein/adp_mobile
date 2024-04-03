import 'package:flutter/widgets.dart';

typedef BuilderSearchItem = Widget Function(bool isHighlight, VoidCallback onTap);

class AdaptiveAutoCompleteItem<T> {
  const AdaptiveAutoCompleteItem(
      { this.value, this.builder, required this.searchKey });

  /// The value of the search item. This can be any type of object.
  final T? value;

  /// The string to search for.
  final String searchKey;

  /// The widget to display in the search results overlay. If not specified, a
  /// [Text] widget with the default styling will appear instead.
  final BuilderSearchItem? builder;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AdaptiveAutoCompleteItem &&
            runtimeType == other.runtimeType &&
            searchKey == other.searchKey &&
            builder == other.builder &&
            value == other.value;
  }

  @override
  int get hashCode => searchKey.hashCode;
}
