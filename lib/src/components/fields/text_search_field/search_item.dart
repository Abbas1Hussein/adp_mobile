import 'package:search_field_autocomplete/search_field_autocomplete.dart';

class AdaptiveSearchItem<T> extends SearchFieldAutoCompleteItem<T> {
  const AdaptiveSearchItem({
    super.value,
    super.child,
    required super.searchKey,
  });

  factory AdaptiveSearchItem.from(SearchFieldAutoCompleteItem<T> item) {
    return AdaptiveSearchItem(
      value: item.value,
      child: item.child,
      searchKey: item.searchKey,
    );
  }
}
