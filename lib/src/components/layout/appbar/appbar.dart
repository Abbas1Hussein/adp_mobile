import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/model.dart';

class AdaptiveAppBar extends CoreModel<AppBar, CupertinoNavigationBar> {
  const AdaptiveAppBar({
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.actionsIconTheme,
    this.centerTitle,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
  });

  /// The title of the adp navigation appBar .
  ///
  /// Typically a [Text] widget that contains the app name.
  final Widget? title;

  /// Whether the [title] should be centered, Defaults is false.
  final bool? centerTitle;

  /// The spacing around [title] content on the horizontal axis. This spacing is
  /// applied even if there is no [leading] content or [actions]. If you want
  /// [title] to take all the space available, set this value to 0.0.
  final double? titleSpacing;

  /// The default text style for the nav AppBar's [title] widget.
  ///
  /// See also:
  ///
  ///  * [DefaultTextStyle], which overrides the default text style for all of the
  ///    widgets in a subtree.
  final TextStyle? titleTextStyle;

  /// The widget at the beginning of the app bar, before [title].
  ///
  /// Typically the [leading] widget is an [AdaptiveIcon] or an [AdaptiveIconButton].
  ///
  /// If this is null and [automaticallyImplyLeading] is set to true, the
  /// view will imply an appropriate widget. If the parent [Navigator] can
  /// go back, the app bar will use an [backButton] that calls [Navigator.maybePop].
  ///
  /// See also:
  ///
  ///   * [automaticallyImplyLeading], that controls whether we should try to
  /// imply the leading widget, if [leading] is null
  final Widget? leading;

  /// Specifies the width of the leading of the [AdaptiveNavigationAppBar].
  final double? leadingWidth;

  /// Controls whether the [AdaptiveNavigationAppBar] should try to imply if the [leading] widget
  /// is null.
  ///
  /// If `true` and [leading] are null, the adp navigation appBar will automatically try to
  /// deduce what the leading widget should be. If `false` and [leading] is
  /// null, leading space is given to [title]. If the [leading] widget is not
  /// null, this parameter has no effect.
  final bool automaticallyImplyLeading;

  /// The list of widget to display in the app bar.
  final List<Widget>? actions;

  /// The color, opacity, and size to use for the icons that appear in the app
  /// bar's [actions].
  ///
  /// This property should only be used when the [actions] should be
  /// themed differently than the icon that appears in the app bar's [leading]
  /// widget.
  final IconThemeData? actionsIconTheme;

  /// The background color of the navigation app bar.
  ///
  /// If [backgroundColor] is specified, it sets the color of the app bar.
  /// If [backgroundColor] is null, the app bar uses the default background color based on the platform theme.
  final Color? backgroundColor;

  /// The default color for [Text] and [Icon]s within the app bar.
  ///
  /// See also:
  ///
  ///  * [backgroundColor], which specifies the app bar's background color.
  final Color? foregroundColor;

  /// How opaque the toolbar part of the nav app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  final double toolbarOpacity;

  /// The default text style for the Adp AppBar's [leading], and
  /// [actions] widgets, but not its [title].
  ///
  /// See also:
  ///
  ///  * [DefaultTextStyle], which overrides the default text style for all of the
  ///    widgets in a subtree.
  final TextStyle? toolbarTextStyle;

  @override
  AppBar toAndroid(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actions,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      actionsIconTheme: actionsIconTheme,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      leadingWidth: leadingWidth,
      toolbarTextStyle: toolbarTextStyle,
      titleTextStyle: titleTextStyle,
    );
  }

  @override
  CupertinoNavigationBar toIOS(BuildContext context) {
    final Color defaultBackgroundColor =
        CupertinoDynamicColor.maybeResolve(backgroundColor, context) ??
            CupertinoTheme.of(context).barBackgroundColor;

    final styledTitle = title != null
        ? DefaultTextStyle(
            style: titleTextStyle ??
                CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            child: title!,
          )
        : null;

    return CupertinoNavigationBar(
      leading: centerTitle == false
          ? Row(children: [
              if (leading != null) leading!,
              SizedBox(width: titleSpacing),
              if (title != null) styledTitle!
            ])
          : leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      middle: centerTitle != false ? styledTitle : null,
      automaticallyImplyMiddle: true,
      backgroundColor: (backgroundColor ?? defaultBackgroundColor)
          .withOpacity(toolbarOpacity),
      transitionBetweenRoutes: true,
      trailing: actions != null
          ? IconTheme(
              data: (actionsIconTheme ?? Theme.of(context).iconTheme).copyWith(
                color: foregroundColor ??
                    CupertinoDynamicColor.resolve(
                      CupertinoColors.label,
                      context,
                    ),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: actions!),
            )
          : null,
    );
  }
}
