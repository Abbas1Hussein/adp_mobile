import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core.dart';
import 'builders.dart' as b;
import 'component_mixin.dart';

export 'property.dart';
export '../../extension/widget.dart';

/// A base class for creating adaptive components that can have different implementations
/// on Android and IOS platforms.
///
/// This class provides a consistent structure for building widgets that can adapt to
/// platform-specific visual and functional aspects.
///
/// - [Android]: Type of Android-specific properties.
/// - [IOS]: Type of IOS-specific properties.
abstract class CoreAdaptiveComponent<Android extends CoreAndroidProperty,
        IOS extends CoreIOSProperty> extends StatelessWidget
    with AdaptiveComponentMixin<Android, IOS> {
  const CoreAdaptiveComponent({this.builders, this.properties, super.key});

  /// Builders for adapting the component based on platform and theme.
  ///
  /// This property allows you to specify builders for both Android and IOS platforms.
  /// Builders are functions that customize the appearance and behavior of the component
  /// based on the provided [ThemePlatformData] and [Property] for each platform.
  ///
  /// Example:
  /// ```dart
  /// CoreAdaptiveBuilder(
  ///   android: (platformChild, theme, property) {
  ///     // Android-specific customization logic here
  ///     return CustomAndroidWidget(
  ///       child: platformChild, // The core content for Android.
  ///       theme: theme, // The Theme data.
  ///       property: property, // The CoreAndroidProperty.
  ///     );
  ///   },
  ///   iOS: (platformChild, theme, property) {
  ///     // IOS-specific customization logic here
  ///     return CustomIOSWidget(
  ///       child: platformChild, // The core content for IOS.
  ///       theme: theme, // The CupertinoTheme data.
  ///       property: property, // The CoreIOSProperty.
  ///     );
  ///   },
  /// );
  /// ```
  /// The [Android] builder receives [platformChild], [theme], and [property] parameters,
  /// and it returns a Android-specific widget, while the [IOS] builder performs
  /// similar customization for the IOS platform.
  @override
  final CoreAdaptiveBuilder<b.Builder<ThemeData, Android?>,
      b.Builder<CupertinoThemeData, IOS?>>? builders;

  /// Properties for customizing the visual and functional aspects of the adaptive component.
  ///
  /// This property allows you to specify properties separately for both Android and IOS platforms.
  /// Properties are objects containing platform-specific settings that influence the appearance and
  /// behavior of the component based on the provided [Android] and [IOS] types.
  ///
  /// Example:
  /// ```dart
  /// CoreProperties(
  ///   Android: MyAndroidProperties(), // An instance of CoreAndroidProperty.
  ///   IOS: MyIOSProperties(), // An instance of CoreIOSProperty.
  /// );
  /// ```
  /// The [Android] and [IOS] properties enable you to set platform-specific settings
  /// to tailor the component's behavior and appearance on Android and IOS platforms, respectively.
  @override
  final CoreProperties<Android, IOS>? properties;

  @override
  @mustCallSuper
  Widget build(BuildContext context) => getAdaptiveComponent(context);
}
