/// Defines the selection types for the pulldown menu button.
enum SelectionType {
  /// Represents the default selection type where no item is selected by default.
  ///
  /// When [AdaptivePulldownMenuItem.enabled] is false, the item will be disabled.
  none,

  /// When used, this selection type focuses on only one [AdaptivePulldownMenuItem].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// AdaptivePulldownMenuButton.singleChoice(
  ///   title: 'Adp Menu',
  ///   items: [
  ///     AdaptivePulldownMenuItem(
  ///       enabled: true,
  ///       leading: AdaptiveIcon(AdpIcons.star),
  ///       child: Text('Give us a star'),
  ///     ),
  ///   ],
  /// ),
  /// ```
  /// - There should be exactly one item with the specified 'enabled' value set to true.
  single,
}

