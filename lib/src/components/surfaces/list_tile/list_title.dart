import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';

/// A single fixed-height row that typically contains some text as well as
/// a leading or trailing icon.
///
/// ## The ListTile layout isn't exactly what I want
///
/// If the way ListTile pads and positions its elements isn't quite what
/// you're looking for, it's easy to create custom list items with a
/// combination of other widgets, such as [Row]s and [Column]s.
///
/// Use this widget to create list Tiles with platform-specific
/// styling and behavior:
/// - On iOS, [CupertinoListTile] is utilized.
/// - On Android, [ListTile] is used.
class AdaptiveListTile extends CoreAdaptiveComponent {
  const AdaptiveListTile({
    super.key,
    super.builders,
    this.iconColor,
    this.shape,
    this.title,
    this.titleTextStyle,
    this.leading,
    this.leadingWidth = 16.0,
    this.subtitle,
    this.trailing,
    this.enabled = true,
    this.contentPadding,
    this.onTap,
    this.onLongPress,
    this.tileColor,
    this.disabledColor,
    this.leadingAndTrailingTextStyle,
  });

  /// Determines whether this list tile is interactive.
  final bool enabled;

  /// The primary content of the adp list tile.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// The text style for ListTile's [title].
  final TextStyle? titleTextStyle;

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or a [CircleAvatar] widget.
  final Widget? leading;

  /// The minimum width allocated for the list tile widget.
  final double leadingWidth;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] widget.
  final Widget? trailing;

  /// The text style for ListTile's [leading] and [trailing].
  final TextStyle? leadingAndTrailingTextStyle;

  /// The tile's internal padding.
  ///
  /// Insets a [ListTile]'s contents: its [leading], [title], [subtitle],
  /// and [trailing] widgets.
  final EdgeInsetsGeometry? contentPadding;

  /// Called when the user taps this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final VoidCallback? onTap;

  /// Called when the user long-presses on this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final VoidCallback? onLongPress;

  /// The shape of the tile.
  final ShapeBorder? shape;

  /// the default color for [leading] and [trailing] icons.
  final Color? iconColor;

  /// the background color of list tile.
  final Color? tileColor;

  /// The background color of the tile when it is disabled.
  ///
  /// if enabled is false, this will used.
  final Color? disabledColor;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return ListTile(
      shape: shape,
      onTap: onTap,
      title: title,
      enabled: enabled,
      leading: leading,
      subtitle: subtitle,
      trailing: trailing,
      iconColor: iconColor,
      onLongPress: onLongPress,
      titleTextStyle: titleTextStyle,
      contentPadding: contentPadding,
      minLeadingWidth: leadingWidth,
      tileColor: enabled ? tileColor : disabledColor,
      leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
    );
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    final buildTitle = title != null
        ? DefaultTextStyle.merge(style: titleTextStyle, child: title!)
        : const SizedBox.shrink();

    final buildLeading = leading != null
        ? IconTheme.merge(
            data: IconTheme.of(context).copyWith(color: iconColor),
            child: DefaultTextStyle.merge(
              style: leadingAndTrailingTextStyle,
              child: leading!,
            ),
          )
        : null;
    final buildTrailing = trailing != null
        ? IconTheme.merge(
            data: IconTheme.of(context).copyWith(color: iconColor),
            child: DefaultTextStyle.merge(
              style: leadingAndTrailingTextStyle,
              child: trailing!,
            ),
          )
        : null;

    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: shape ?? LinearBorder.none,
        color: enabled ? tileColor : disabledColor,
      ),
      child: IntrinsicHeight(
        child: GestureDetector(
          onLongPress: enabled ? onLongPress : null,
          child: CupertinoListTile(
            onTap: enabled ? onTap : null,
            subtitle: subtitle,
            title: buildTitle,
            leading: buildLeading,
            trailing: buildTrailing,
            padding: contentPadding,
            leadingToTitle: leadingWidth,
          ),
        ),
      ),
    ).applyDisabledEffect(!enabled);
  }
}
