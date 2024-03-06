import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import '../appbar/appbar_page.dart';

const _contentPadding = EdgeInsets.all(4.0);

/// The Scaffold is designed to be a top level container for
/// a [AdpApp]. This means that adding a Scaffold
/// to each route on a adp app will provide the app with
/// platform's basic visual layout structure.
///
/// Use this widget to create a scaffold with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoPageScaffold] is utilized.
/// - On Android, [Scaffold] is used.
class AdaptiveScaffoldPage extends CoreAdaptiveComponent {
  /// Creates an adaptive scaffold page.
  ///
  /// Example usage:
  /// ```dart
  /// const AdaptiveScaffold(
  ///   appBar: AdaptiveAppBar(
  ///     title: Text('Adaptive App'),
  ///     leading: AdaptiveIcon(AdpIcons.home),
  ///   ),
  /// );
  /// ```
  /// See also:
  ///
  ///  * [AdaptiveAppBarPage], which is a horizontal bar typically shown at the top of an app,
  ///  using the [appBar] property.
  const AdaptiveScaffoldPage({
    super.key,
    super.builders,
    this.appBar,
    this.content,
    this.backgroundColor,
    this.contentPadding = _contentPadding,
    this.resizeToAvoidBottomInset = true,
  });

  /// The app bar to be displayed at the top of the scaffold page.
  final AdaptiveAppBarPage? appBar;

  /// The main content of the adaptive scaffold page.
  final Widget? content;

  /// Padding around the content of the adaptive scaffold page.
  final EdgeInsets contentPadding;

  /// The background color of the adaptive scaffold page.
  final Color? backgroundColor;

  /// Whether the [child] should size itself to avoid the window's bottom inset.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true.
  final bool resizeToAvoidBottomInset;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar?.toAndroid(context),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Padding(padding: contentPadding, child: content),
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: appBar?.toIOS(context),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      child: Padding(padding: contentPadding, child: content),
    );
  }
}
