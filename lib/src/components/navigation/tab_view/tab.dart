import 'package:flutter/cupertino.dart';


/// Represents a tab in the adaptive tab view.
///
/// See also:
///
///   * [AdaptiveTabView], the widget that uses [AdaptiveTab] to create a
///     consistent tab view experience.
class AdaptiveTab {
  const AdaptiveTab({ this.icon, required this.label });

  /// The main content of the tab, typically an [Text].
  final Widget label;

  /// An optional widget representing an icon for the tab.
  ///
  /// typically an [AdaptiveIcon].
  final Widget? icon;
}
