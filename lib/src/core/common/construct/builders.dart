import 'package:flutter/widgets.dart';

/// for a builder function used to create adaptive widgets based on platform-specific data.
///
/// - [platformChild]: The widget that represents the core content of the adaptive component.
/// - [theme]: The theme data specific to the platform (Android [Theme] or iOS [CupertinoTheme]).
/// - [property]: The platform-specific property used to customize the component (CoreAndroidProperty or CoreIOSProperty).
typedef Builder<ThemePlatformData, Property> = Widget Function(
  Widget platformChild,
  ThemePlatformData theme,
  Property property,
);

/// Base class for defining adaptive builders that customize the appearance and behavior
/// of a component separately for android and iOS platforms.
///
/// - [A]: Type of android-specific builder.
/// - [I]: Type of iOS-specific builder.
abstract class CoreAdaptiveBuilder<A, I> {
  const CoreAdaptiveBuilder({this.android, this.ios});

  final A? android;
  final I? ios;
}

/// Concrete implementation of [CoreAdaptiveBuilder] that allows setting both android
/// and iOS builders simultaneously.
///
/// See also:
///
/// * [CoreAdaptiveComponent]: Used this to create edit adaptive components on android and iOS platforms.
final class AdaptiveBuilder<A, I> extends CoreAdaptiveBuilder<A, I> {
  const AdaptiveBuilder({super.android, super.ios});

  /// for setting the android-specific builder.
  const AdaptiveBuilder.android(A android) : super(android: android);

  /// for setting the iOS-specific builder.
  const AdaptiveBuilder.ios(I ios) : super(ios: ios);
}
