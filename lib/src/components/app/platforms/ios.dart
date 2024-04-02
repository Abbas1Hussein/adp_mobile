import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/properties.dart';
import 'android.dart';

class IOSMaterialThemeBuilder extends StatelessWidget {
  const IOSMaterialThemeBuilder({
    super.key,
    this.themeMode,
    required this.properties,
    required this.builder,
    required this.child,
  });

  final Widget? child;
  final ThemeMode? themeMode;
  final TransitionBuilder? builder;
  final CoreProperties<AppAndroidProperty, AppIOSProperty>? properties;

  @override
  Widget build(BuildContext context) {
    final property = properties?.ios;
    final propertyAndroid = properties?.android;

    final ThemeData? themeData =
        context.findAncestorWidgetOfExactType<Theme>()?.data;

    final mode = themeMode ?? ThemeMode.system;
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final useDarkStyle = mode == ThemeMode.dark ||
        (mode == ThemeMode.system && platformBrightness == Brightness.dark);

    final cupertinoTheme =
        (useDarkStyle ? property?.darkTheme : property?.theme) ??
            CupertinoTheme.of(context);

    return AnimatedTheme(
      curve: Curves.linearToEaseOut,
      duration: const Duration(milliseconds: 300),
      data: themeData ??
          (useDarkStyle
                  ? (propertyAndroid?.darkTheme ??
                      ThemeData.dark(useMaterial3: true))
                  : (propertyAndroid?.theme ??
                      ThemeData.light(useMaterial3: true)))
              .copyWith(
            platform: TargetPlatform.iOS,
            cupertinoOverrideTheme: CupertinoThemeData(
              textTheme: cupertinoTheme.textTheme,
              brightness: cupertinoTheme.brightness,
              primaryColor: cupertinoTheme.primaryColor,
              applyThemeToAll: cupertinoTheme.applyThemeToAll,
              barBackgroundColor: cupertinoTheme.barBackgroundColor,
              primaryContrastingColor: cupertinoTheme.primaryContrastingColor,
              scaffoldBackgroundColor: cupertinoTheme.scaffoldBackgroundColor,
            ),
            dividerColor: CupertinoColors.separator,
            canvasColor: cupertinoTheme.primaryColor,
            primaryColor: cupertinoTheme.primaryColor,
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: cupertinoTheme.primaryColor,
            ),
            navigationDrawerTheme: NavigationDrawerThemeData(
              indicatorSize: const Size.fromHeight(kMinInteractiveDimensionCupertino),
              iconTheme: const MaterialStatePropertyAll(CupertinoIconThemeData()),
              labelTextStyle: MaterialStatePropertyAll(cupertinoTheme.textTheme.textStyle),
              indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              indicatorColor: CupertinoDynamicColor.resolve(cupertinoTheme.barBackgroundColor, context),
              backgroundColor: CupertinoDynamicColor.resolve(cupertinoTheme.barBackgroundColor, context),
            ),
            drawerTheme: DrawerThemeData(
              backgroundColor: useDarkStyle
                  ? CupertinoDynamicColor.resolve(
                      cupertinoTheme.barBackgroundColor, context)
                  : cupertinoTheme.barBackgroundColor,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: CupertinoDynamicColor.resolve(cupertinoTheme.primaryColor, context),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: CupertinoDynamicColor.resolve(cupertinoTheme.primaryColor, context),
            ),
            iconTheme: const CupertinoIconThemeData().copyWith(color: cupertinoTheme.primaryColor),
          ),
      child: builder?.call(context, child) ?? child ?? const SizedBox.shrink(),
    );
  }
}

class AppIOSProperty extends CoreIOSProperty {
  const AppIOSProperty({this.theme, this.darkTheme});

  /// The style used if [themeMode] is [ThemeMode.dark]
  final CupertinoThemeData? darkTheme;

  /// The style used if [themeMode] is [ThemeMode.light]
  final CupertinoThemeData? theme;
}
