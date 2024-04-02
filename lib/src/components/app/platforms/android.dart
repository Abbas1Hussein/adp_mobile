import 'package:flutter/material.dart';

import '../../../core/common/construct/property.dart';

class AppAndroidProperty extends CoreAndroidProperty {
  const AppAndroidProperty({this.theme, this.darkTheme});

  /// Default visual properties, like colors fonts and shapes, for this app's
  /// fluent widgets.
  ///
  /// A second [darkTheme] [FluentThemeData] value, which is used to provide a dark
  /// version of the user interface can also be specified. [themeMode] will
  /// control which theme will be used if a [darkTheme] is provided.
  ///
  /// The default value of this property is the value of `FluentThemeData(brightness: Brightness.light)`.
  final ThemeData? theme;

  /// The [FluentThemeData] to use when a 'dark mode' is requested by the system.
  ///
  /// Some host platforms allow the users to select a system-wide 'dark mode',
  /// or the application may want to offer the user the ability to choose a
  /// dark theme just for this application. This is theme that will be used for
  /// such cases. [themeMode] will control which theme will be used.
  ///
  /// This theme should have a [FluentThemeData.brightness] set to [Brightness.dark].
  ///
  /// Uses [theme] instead when null. Defaults to the value of
  /// [FluentThemeData(brightness: Brightness.light)] when both [darkTheme] and [theme] are null.
  final ThemeData? darkTheme;
}
