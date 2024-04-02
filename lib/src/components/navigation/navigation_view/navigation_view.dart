import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import '../../layout/appbar/appbar_page.dart';
import '../navigation.dart';

/// The Navigation View top-level navigation for your app provides a structured layout for navigation within an application.
/// It typically consists of a sidebar for navigation options and an app bar for additional controls or indicators.
/// Provides a flexible layout for navigation purposes, allowing users to interact with the app's content seamlessly,
/// making it suitable for various application designs and platforms.
///
/// See also:
///
/// * [AdaptiveTabView] and this provides top-level navigation for your app.
///
/// Use this widget to create a navigation view with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoTabScaffold] is utilized.
/// - On Android, [Scaffold] is used.
class AdaptiveNavigationView extends CoreAdaptiveComponent<
    NavigationViewAndroidProperty, CoreIOSProperty> {
  /// Creates an adaptive navigation view.
  ///
  /// The [properties] parameter allows you to customize the visual and functional aspects
  /// of the navigation view separately for Windows and macOS platforms.
  /// You can provide specific [properties] for each platform using `NavigationViewAndroidProperty`
  /// and `NavigationViewIOSProperty` respectively.
  ///
  /// - [children] should have the same length as the number of items in the navigation sidebar.
  ///
  /// See also:
  ///   * [AdaptiveNavigationBar] Use this widget to create a visually consistent and platform-specific navigation
  ///   sidebar handling navigation items [navigationBar].
  ///   * [AdaptiveAppBarPage] An adaptive app bar component that displayed at the top of the navigation view [appBar].
  const AdaptiveNavigationView({
    super.key,
    super.builders,
    super.properties,
    this.appBar,
    this.contentPadding = kContentPadding,
    this.backgroundColor,
    this.restorationId,
    this.resizeToAvoidBottomInset = true,
    required this.navigationBar,
    required this.children,
  });

  /// The adaptive app bar displayed at the top of the navigation view.
  ///
  /// The `appBar` parameter allows you to provide an adaptive app bar that is displayed at the
  /// top of the navigation view.
  final AdaptiveNavigationAppbar? appBar;

  /// An adaptive navigation bar for handling navigation items.
  ///
  /// The `sidebar` parameter allows you to provide an adaptive navigation bar that handles
  /// navigation items. The appearance and behavior of the navigation bar can be customized based on the
  /// underlying platform.
  ///
  /// The [navigationBar.tabs] should have the same length as the number of [children].
  final AdaptiveNavigationBar navigationBar;

  /// The list of widgets representing the body of each navigation item.
  ///
  /// Each widget corresponds to a navigation item in the [navigationBar]. It should have the same length as
  /// the number of items in the navigation bar.
  final List<Widget> children;

  /// Optional padding around the body content.
  ///
  /// The `padding` parameter allows you to specify padding around the body content of each body,
  /// If `null`, a default padding of 8.0 is applied.
  final EdgeInsets contentPadding;

  /// The background color of the navigation view.
  ///
  /// The `backgroundColor` parameter allows you to specify the background color of the entire
  /// navigation view. If `null`, the default background color of the underlying platform is used.
  final Color? backgroundColor;

  /// Restoration ID to save and restore the state of the [AdaptiveNavigationView].
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  /// Whether the body should size itself to avoid the window's bottom inset.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true and cannot be null.
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    validateLength();
    return super.build(context);
  }

  @override
  Widget android(
    BuildContext context, [
    NavigationViewAndroidProperty? property,
  ]) {
    final navigationMode = navigationBar.properties?.android?.navigationMode ??
        AndroidNavigationMode.auto;

    final isNavigationAutoDetected = navigationMode == AndroidNavigationMode.auto;

    final isLandscape = isNavigationAutoDetected && MediaQuery.orientationOf(context) == Orientation.landscape;

    final body = Padding(
      padding: contentPadding,
      child: children[navigationBar.currentIndex],
    );

    final buildNavigationWidget = navigationBar.toAndroid(context);

    final buildNavigationRail = isLandscape
        ? Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: buildNavigationWidget.$3,
                  ),
                ),
              ),
              if (Theme.of(context).useMaterial3)
                const VerticalDivider(thickness: 0.3),
              Expanded(child: body),
            ],
          )
        : null;

    final useMaterial3 = navigationBar.properties?.android?.useMaterial3 ??
        Theme.of(context).useMaterial3;

    return Scaffold(
        appBar: appBar?.toAndroid(context),
        drawer: property?.drawer,
        drawerDragStartBehavior:
            property?.drawerDragStartBehavior ?? DragStartBehavior.start,
        drawerEdgeDragWidth: property?.drawerEdgeDragWidth,
        drawerEnableOpenDragGesture:
            property?.drawerEnableOpenDragGesture ?? true,
        drawerScrimColor: property?.drawerScrimColor,
        endDrawer: property?.endDrawer,
        endDrawerEnableOpenDragGesture:
            property?.endDrawerEnableOpenDragGesture ?? true,
        extendBody: property?.extendBody ?? false,
        onDrawerChanged: property?.onDrawerChanged,
        onEndDrawerChanged: property?.onEndDrawerChanged,
        extendBodyBehindAppBar: property?.extendBodyBehindAppBar ?? false,
        floatingActionButton: property?.floatingActionButton,
        floatingActionButtonAnimator: property?.floatingActionButtonAnimator,
        floatingActionButtonLocation: property?.floatingActionButtonLocation,
        persistentFooterAlignment: property?.persistentFooterAlignment ??
            AlignmentDirectional.centerEnd,
        persistentFooterButtons: property?.persistentFooterButtons,
        restorationId: restorationId,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        primary: property?.primary ?? true,
        backgroundColor: backgroundColor,
        bottomSheet: property?.bottomSheet,
        body: isLandscape ? buildNavigationRail : body,
        bottomNavigationBar: isLandscape
            ? null
            : useMaterial3
                ? buildNavigationWidget.$2 // NavigationBar,
                : buildNavigationWidget.$1 // BottomNavigationBar,
        );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoTabScaffold(
      tabBar: navigationBar.toIOS(context),
      restorationId: restorationId,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      tabBuilder: (BuildContext context, int index) {
        return CupertinoPageScaffold(
          navigationBar: appBar?.toIOS(context),
          // backgroundColor: backgroundColor,
          // resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          child: SafeArea(
            child: Padding(padding: contentPadding, child: children[index]),
          ),
        );
      },
    );
  }

  void validateLength() {
    final hasSameLength = navigationBar.items.length == children.length;
    assert(
      hasSameLength,
      "\n`items` and `children` must have the same length."
      "\nCurrently: items has ${navigationBar.items.length} elements and tabs has ${children.length} elements.",
    );
  }
}
