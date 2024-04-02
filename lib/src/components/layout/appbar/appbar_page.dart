import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/model.dart';

class AdaptiveAppBarPage extends CoreModel<AppBar, CupertinoNavigationBar> {
  const AdaptiveAppBarPage({
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.backgroundColor,
    this.border,
    this.foregroundColor,
    this.actionsIconTheme,
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

  /// The border of the app bar. By default renders a single pixel bottom border side.
  ///
  /// If a border is null, the app bar will not display a border.
  final Border? border;

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
      shape: border,
      title: title,
      leading: leading,
      actions: actions,
      elevation: 1.0,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      actionsIconTheme: actionsIconTheme,
      titleTextStyle: titleTextStyle,
      titleSpacing: titleSpacing,
      leadingWidth: leadingWidth,
      toolbarOpacity: toolbarOpacity,
      toolbarTextStyle: toolbarTextStyle,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  CupertinoNavigationBar toIOS(BuildContext context) {
    final iconTheme = const CupertinoIconThemeData().resolve(context);

    final Color defaultBackgroundColor =
        CupertinoDynamicColor.maybeResolve(backgroundColor, context) ??
            CupertinoTheme.of(context).barBackgroundColor;

    final styledTitle = title != null
        ? SizedBox(
            width: titleSpacing,
            child: DefaultTextStyle(
              overflow: TextOverflow.ellipsis,
              style: titleTextStyle ??
                  CupertinoTheme.of(context).textTheme.navTitleTextStyle,
              child: title!,
            ),
          )
        : null;

    // The icon size will be scaled by a factor of the accessibility text scale,
    // to follow the behavior of `UISearchTextField`.
    final double scaledIconSize = MediaQuery.textScalerOf(context)
        .scale(actionsIconTheme?.size ?? iconTheme.size ?? 21.5);

    final getEffectiveCenterTitle = actions != null && actions!.length >= 4;

    return CupertinoNavigationBar(
      border: border,
      leading: leading != null
          ? Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: IconTheme.merge(
                data: iconTheme.copyWith(size: scaledIconSize),
                child: leading!,
              ),
            )
          : null,
      trailing: actions != null && actions!.isNotEmpty
          ? IconTheme.merge(
              data: (actionsIconTheme ?? iconTheme).copyWith(
                size: scaledIconSize,
                color: foregroundColor ??
                    CupertinoDynamicColor.maybeResolve(
                        iconTheme.color, context),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: actions!.map(
                  (child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: child,
                    );
                  },
                ).toList(),
              ),
            )
          : null,
      middle: getEffectiveCenterTitle
          ? Align(
              alignment: AlignmentDirectional.centerStart,
              child: styledTitle,
            )
          : styledTitle,
      backgroundColor: (backgroundColor ?? defaultBackgroundColor)
          .withOpacity(toolbarOpacity),
      padding: EdgeInsetsDirectional.zero,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
