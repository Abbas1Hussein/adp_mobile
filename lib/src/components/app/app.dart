import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';

class AdpApp extends CoreAdaptiveComponent<AppAndroidProperty, AppIOSProperty> {
  const AdpApp({
    super.key,
    super.properties,
    this.themeMode,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.shortcuts,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.actions,
    this.restorationScopeId,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.scrollBehavior,
    this.title = '',
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        routerConfig = null;

  const AdpApp.router({
    super.key,
    super.properties,
    this.themeMode,
    this.builder,
    this.shortcuts,
    this.onGenerateTitle,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.backButtonDispatcher,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.actions,
    this.restorationScopeId,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.scrollBehavior,
    this.title = '',
    required RouterConfig<Object> this.routerConfig,
    required RouterDelegate<Object> this.routerDelegate,
  })  : navigatorObservers = const <NavigatorObserver>[],
        routes = const <String, WidgetBuilder>{},
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        initialRoute = null;

  /// Determines which theme will be used by the application if both [tooltipTheme]
  /// and [darkTheme] are provided.
  ///
  /// If set to [ThemeMode.system], the choice of which theme to use will
  /// be based on the user's system preferences. If the [MediaQuery.platformBrightnessOf]
  /// is [Brightness.light], [tooltipTheme] will be used. If it is [Brightness.dark],
  /// [darkTheme] will be used (unless it is null, in which case [tooltipTheme]
  /// will be used.
  ///
  /// If set to [ThemeMode.light] the [tooltipTheme] will always be used,
  /// regardless of the user's system preference.
  ///
  /// If set to [ThemeMode.dark] the [darkTheme] will be used
  /// regardless of the user's system preference. If [darkTheme] is null
  /// then it will fallback to using [tooltipTheme].
  ///
  /// The default value is [ThemeMode.system].
  final ThemeMode? themeMode;

  /// {@macro flutter.widgets.widgetsApp.navigatorKey}
  final GlobalKey<NavigatorState>? navigatorKey;

  /// {@macro flutter.widgets.widgetsApp.home}
  final Widget? home;

  /// The application's top-level routing table.
  ///
  /// When a named route is pushed with [Navigator.pushNamed], the route name is
  /// looked up in this map. If the name is present, the associated
  /// [WidgetBuilder] is used to construct a [FluentPageRoute] that performs
  /// an appropriate transition, including [Hero] animations, to the new route.
  ///
  /// {@macro flutter.widgets.widgetsApp.routes}
  final Map<String, WidgetBuilder> routes;

  /// {@macro flutter.widgets.widgetsApp.initialRoute}
  final String? initialRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateRoute}
  final RouteFactory? onGenerateRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateInitialRoutes}
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// {@macro flutter.widgets.widgetsApp.onUnknownRoute}
  final RouteFactory? onUnknownRoute;

  /// {@macro flutter.widgets.widgetsApp.navigatorObservers}
  final List<NavigatorObserver> navigatorObservers;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  /// {@macro flutter.widgets.widgetsApp.routerConfig}
  final RouterConfig<Object>? routerConfig;

  /// {@macro flutter.widgets.widgetsApp.builder}
  ///
  /// Fluent specific features such as [showDialog] and [showMenu], and widgets
  /// such as [Tooltip], [PopupMenuButton], also require a [Navigator] to properly
  /// function.
  final TransitionBuilder? builder;

  /// {@macro flutter.widgets.widgetsApp.title}
  ///
  /// This value is passed unmodified to [WidgetsApp.title].
  final String title;

  /// {@macro flutter.widgets.widgetsApp.onGenerateTitle}
  ///
  /// This value is passed unmodified to [WidgetsApp.onGenerateTitle].
  final GenerateAppTitle? onGenerateTitle;

  /// {@macro flutter.widgets.widgetsApp.color}
  final Color? color;

  /// {@macro flutter.widgets.widgetsApp.locale}
  final Locale? locale;

  /// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// Returns an iterable of common localizations delegates.
  ///
  /// This includes the localizations delegates provided through [localizationsDelegates],
  /// If [localizationsDelegates] is not provided, the common localizations
  /// delegates include the following:
  ///   - [DefaultWidgetsLocalizations.delegate]
  ///
  /// These localizations delegates are used to handle localization-related
  /// tasks such as formatting dates, numbers, and providing localized messages.
  Iterable<LocalizationsDelegate<dynamic>>
      get _commonLocalizationsDelegates sync* {
    if (localizationsDelegates != null) {
      yield* localizationsDelegates!;
    }
    yield DefaultWidgetsLocalizations.delegate;

    yield DefaultMaterialLocalizations.delegate;
    yield DefaultCupertinoLocalizations.delegate;
  }

  /// {@macro flutter.widgets.widgetsApp.localeListResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// {@macro flutter.widgets.LocaleResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleResolutionCallback? localeResolutionCallback;

  /// {@macro flutter.widgets.widgetsApp.supportedLocales}
  ///
  /// It is passed along unmodified to the [WidgetsApp] built by this widget.
  final Iterable<Locale> supportedLocales;

  /// Turns on a performance overlay.
  ///
  /// See also:
  ///
  ///  * <https://flutter.dev/debugging/#performanceoverlay>
  final bool showPerformanceOverlay;

  /// Turns on checkerboarding of raster cache images.
  final bool checkerboardRasterCacheImages;

  /// Turns on checkerboarding of layers rendered to offscreen bitmaps.
  final bool checkerboardOffscreenLayers;

  /// Turns on an overlay that shows the accessibility information
  /// reported by the framework.
  final bool showSemanticsDebugger;

  /// {@macro flutter.widgets.widgetsApp.debugShowCheckedModeBanner}
  final bool debugShowCheckedModeBanner;

  /// {@macro flutter.widgets.widgetsApp.actions}
  /// {@tool snippet}
  /// This example shows how to add a single action handling an
  /// [ActivateAction] to the default actions without needing to
  /// add your own [Actions] widget.
  ///
  /// Alternatively, you could insert a [Actions] widget with just the mapping
  /// you want to add between the [FluentApp] and its child and get the same
  /// effect.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return FluentApp(
  ///     actions: <Type, Action<Intent>>{
  ///       ... WidgetsApp.defaultActions,
  ///       ActivateAction: CallbackAction(
  ///         onInvoke: (Intent intent) {
  ///           // Do something here...
  ///           return null;
  ///         },
  ///       ),
  ///     },
  ///     color: const Color(0xFFFF0000),
  ///     builder: (BuildContext context, Widget? child) {
  ///       return const Placeholder();
  ///     },
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  /// {@macro flutter.widgets.widgetsApp.actions.seeAlso}
  final Map<Type, Action<Intent>>? actions;

  /// {@macro flutter.widgets.widgetsApp.restorationScopeId}
  final String? restorationScopeId;

  /// {@macro flutter.material.materialApp.scrollBehavior}
  ///
  /// See also:
  ///
  ///  * [ScrollConfiguration], which controls how [Scrollable] widgets behave
  ///    in a subtree.
  final ScrollBehavior? scrollBehavior;

  /// {@macro flutter.widgets.widgetsApp.shortcuts}
  /// {@tool snippet}
  /// This example shows how to add a single shortcut for
  /// [LogicalKeyboardKey.select] to the default shortcuts without needing to
  /// add your own [Shortcuts] widget.
  ///
  /// Alternatively, you could insert a [Shortcuts] widget with just the mapping
  /// you want to add between the [WidgetsApp] and its child and get the same
  /// effect.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return WidgetsApp(
  ///     shortcuts: <LogicalKeySet, Intent>{
  ///       ... WidgetsApp.defaultShortcuts,
  ///       LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
  ///     },
  ///     color: const Color(0xFFFF0000),
  ///     builder: (BuildContext context, Widget? child) {
  ///       return const Placeholder();
  ///     },
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  /// {@macro flutter.widgets.widgetsApp.shortcuts.seeAlso}
  final Map<LogicalKeySet, Intent>? shortcuts;

  bool get usesRouter => routerDelegate != null || routerConfig != null;

  @override
  Widget android(BuildContext context, [AppAndroidProperty? property]) {
    if (usesRouter) {
      return MaterialApp.router(
        title: title,
        color: color,
        locale: locale,
        actions: actions,
        builder: builder,
        themeMode: themeMode,
        onGenerateTitle: onGenerateTitle,
        restorationScopeId: restorationScopeId,
        routerConfig: routerConfig,
        routerDelegate: routerDelegate,
        backButtonDispatcher: backButtonDispatcher,
        routeInformationParser: routeInformationParser,
        routeInformationProvider: routeInformationProvider,
        theme: property?.theme ?? ThemeData.light(),
        darkTheme: property?.darkTheme ?? ThemeData.dark(),
        shortcuts: shortcuts,
        showSemanticsDebugger: showSemanticsDebugger,
        showPerformanceOverlay: showPerformanceOverlay,
        localizationsDelegates: _commonLocalizationsDelegates,
        localeResolutionCallback: localeResolutionCallback,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        localeListResolutionCallback: localeListResolutionCallback,
        checkerboardRasterCacheImages: checkerboardOffscreenLayers,
        scrollBehavior: scrollBehavior,
        supportedLocales: supportedLocales,
      );
    }
    return MaterialApp(
      home: home,
      title: title,
      color: color,
      routes: routes,
      locale: locale,
      actions: actions,
      builder: builder,
      themeMode: themeMode,
      initialRoute: initialRoute,
      navigatorKey: navigatorKey,
      onUnknownRoute: onUnknownRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateTitle: onGenerateTitle,
      theme: property?.theme ?? ThemeData.light(),
      darkTheme: property?.darkTheme ?? ThemeData.dark(),
      shortcuts: shortcuts,
      navigatorObservers: navigatorObservers,
      restorationScopeId: restorationScopeId,
      showSemanticsDebugger: showSemanticsDebugger,
      showPerformanceOverlay: showPerformanceOverlay,
      localizationsDelegates: _commonLocalizationsDelegates,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      localeResolutionCallback: localeResolutionCallback,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      localeListResolutionCallback: localeListResolutionCallback,
      checkerboardRasterCacheImages: checkerboardOffscreenLayers,
      scrollBehavior: scrollBehavior,
      supportedLocales: supportedLocales,
    );
  }

  @override
  Widget iOS(BuildContext context, [AppIOSProperty? property]) {
    final lightTheme = property?.theme ??
        const CupertinoThemeData(brightness: Brightness.light);
    final darkTheme = property?.theme ??
        const CupertinoThemeData(brightness: Brightness.dark);

    final theme = themeMode == ThemeMode.light ? lightTheme : darkTheme;

    if (usesRouter) {
      return CupertinoApp.router(
        title: title,
        color: color,
        locale: locale,
        actions: actions,
        shortcuts: shortcuts,
        builder: builder,
        routerConfig: routerConfig,
        routerDelegate: routerDelegate,
        theme: theme,
        onGenerateTitle: onGenerateTitle,
        restorationScopeId: restorationScopeId,
        backButtonDispatcher: backButtonDispatcher,
        routeInformationParser: routeInformationParser,
        routeInformationProvider: routeInformationProvider,
        showSemanticsDebugger: showSemanticsDebugger,
        showPerformanceOverlay: showPerformanceOverlay,
        localizationsDelegates: _commonLocalizationsDelegates,
        localeResolutionCallback: localeResolutionCallback,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        localeListResolutionCallback: localeListResolutionCallback,
        checkerboardRasterCacheImages: checkerboardOffscreenLayers,
        scrollBehavior: scrollBehavior,
        supportedLocales: supportedLocales,
      );
    }
    return CupertinoApp(
      home: home,
      title: title,
      color: color,
      routes: routes,
      locale: locale,
      actions: actions,
      shortcuts: shortcuts,
      builder: builder,
      initialRoute: initialRoute,
      navigatorKey: navigatorKey,
      onUnknownRoute: onUnknownRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateTitle: onGenerateTitle,
      navigatorObservers: navigatorObservers,
      restorationScopeId: restorationScopeId,
      theme: theme,
      showSemanticsDebugger: showSemanticsDebugger,
      showPerformanceOverlay: showPerformanceOverlay,
      localizationsDelegates: _commonLocalizationsDelegates,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      localeResolutionCallback: localeResolutionCallback,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      localeListResolutionCallback: localeListResolutionCallback,
      checkerboardRasterCacheImages: checkerboardOffscreenLayers,
      scrollBehavior: scrollBehavior,
      supportedLocales: supportedLocales,
    );
  }

}

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

class AppIOSProperty extends CoreIOSProperty {
  const AppIOSProperty({this.theme, this.darkTheme});

  /// The style used if [themeMode] is [ThemeMode.dark]
  final CupertinoThemeData? darkTheme;

  /// The style used if [themeMode] is [ThemeMode.light]
  final CupertinoThemeData? theme;
}
