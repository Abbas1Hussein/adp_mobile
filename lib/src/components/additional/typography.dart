import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/common/adaptive.dart';

/// A class representing adaptive typography that provides styles for various text elements
/// based on the current platform (iOS or Android).
class AdaptiveTypography {
  /// Creates an instance of [AdaptiveTypography].
  const AdaptiveTypography({
    this.body,
    this.label,
    this.caption,
    this.headline,
    this.subheading,
  });

  /// The text style for body text.
  final TextStyle? body;

  /// The text style for label text.
  final TextStyle? label;

  /// The text style for caption text.
  final TextStyle? caption;

  /// The text style for headline text.
  final TextStyle? headline;

  /// The text style for subheading text.
  final TextStyle? subheading;

  /// Retrieves an instance of [AdaptiveTypography] based on the current platform.
  ///
  /// Uses [adaptiveValue] to select the appropriate text styles for the current platform.
  static AdaptiveTypography of(BuildContext context) => _data(context);

  /// Internal method to retrieve the adaptive typography based on the current platform.
  static AdaptiveTypography _data(BuildContext context) {
    return AdaptiveTypography(
      body: adaptiveValue<TextStyle?>(
        ios: () => CupertinoTheme.of(context).textTheme.textStyle,
        android: () => Theme.of(context).textTheme.bodyMedium,
      ),
      headline: adaptiveValue<TextStyle?>(
        ios: () => CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        android: () =>
            Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 24),
      ),
      caption: adaptiveValue<TextStyle?>(
        ios: () => CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
        android: () => Theme.of(context).textTheme.bodySmall,
      ),
      label: adaptiveValue<TextStyle?>(
        ios: () => CupertinoTheme.of(context).textTheme.navActionTextStyle,
        android: () => Theme.of(context).textTheme.labelMedium,
      ),
      subheading: adaptiveValue<TextStyle?>(
        ios: () => CupertinoTheme.of(context).textTheme.navTitleTextStyle,
        android: () => Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  @override
  bool operator ==(other) {
    if (other is AdaptiveTypography) {
      return body == other.body &&
          headline == other.headline &&
          caption == other.caption &&
          label == other.label &&
          subheading == other.subheading;
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(body, headline, caption, label, subheading);
}
