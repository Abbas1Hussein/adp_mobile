import 'package:flutter/widgets.dart';

/// A unique key used to identify the widget when no matches are found.
///
/// This key is utilized to retrieve an empty widget from [AdaptiveSearchItem].
final emptyKey = UniqueKey().toString();

/// Callback widget to show when the search returns no results.
///
/// If Widget is null, default will be used.
typedef EmptyBuilder = Widget? Function(String value);

class EmptyModel {
  const EmptyModel({required this.searchKey, required this.enteredText});

  final String searchKey;
  final String enteredText;

  factory EmptyModel.from(String searchKey) {
    final key = searchKey.split('|');
    return EmptyModel(searchKey: key.first, enteredText: key.last);
  }

  @override
  String toString() => '$searchKey|$enteredText';
}
