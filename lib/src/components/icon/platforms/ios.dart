import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../core/extension/brightness.dart';

/// An Icon widget that respects a Cupertino icon theme.
class CupertinoIcon extends StatelessWidget {
  /// Creates an icon.
  ///
  /// The [size] and [color] default to the value given by the current
  /// [CupertinoIconTheme].
  const CupertinoIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
  });

  /// The icon to display. The available icons are described in [Icons]
  /// and [CupertinoIcons].
  ///
  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
  final IconData? icon;

  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the current [CupertinoIconTheme] size, if any. If there is no
  /// [CupertinoIconTheme], or it does not specify an explicit size, then it
  /// defaults to 24.0.
  final double? size;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the current [CupertinoIconTheme] color, if any.
  ///
  /// The color (whether specified explicitly here or obtained from the
  /// [CupertinoIconTheme]) will be further adjusted by the opacity of the current
  /// [CupertinoIconTheme], if any.
  ///
  /// If no [CupertinoIconTheme] and no [CupertinoTheme] is specified, icons will
  /// default to the color value of [CupertinoColors.activeBlue.color].
  ///
  /// See [CupertinoTheme] to set the current theme and [CupertinoThemeData.brightness]
  /// for setting the current theme's brightness.
  final Color? color;

  /// Semantic label for the icon.
  ///
  /// Announced in accessibility modes (e.g TalkBack/VoiceOver).
  /// This label does not show in the UI.
  ///
  ///  * [SemanticsProperties.label], which is set to [semanticLabel] in the
  ///    underlying	 [Semantics] widget.
  final String? semanticLabel;

  /// The text direction to use for rendering the icon.
  ///
  /// If this is null, the ambient [Directionality] is used instead.
  ///
  /// Some icons follow the reading direction. For example, "back" buttons point
  /// left in left-to-right environments and right in right-to-left
  /// environments. Such icons have their [IconData.matchTextDirection] field
  /// set to true, and the [CupertinoIcon] widget uses the [textDirection] to
  /// determine the orientation in which to draw the icon.
  ///
  /// This property has no effect if the [icon]'s [IconData.matchTextDirection]
  /// field is false, but for consistency a text direction value must always be
  /// specified, either directly using this property or using [Directionality].
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    assert(this.textDirection != null || debugCheckHasDirectionality(context));
    final TextDirection textDirection =
        this.textDirection ?? Directionality.of(context);

    final iconTheme = CupertinoIconTheme.of(context);

    final iconSize = size ?? iconTheme.size;

    if (icon == null) {
      return Semantics(
        label: semanticLabel,
        child: SizedBox(
          width: iconSize,
          height: iconSize,
        ),
      );
    }

    final iconOpacity = iconTheme.opacity ?? 1.0;
    Color iconColor = color ?? iconTheme.color!;
    if (iconOpacity != 1.0) {
      iconColor = iconColor.withOpacity(iconColor.opacity * iconOpacity);
    }

    Widget iconWidget = RichText(
      overflow: TextOverflow.visible,
      textDirection: textDirection,
      text: TextSpan(
        text: String.fromCharCode(icon!.codePoint),
        style: TextStyle(
          inherit: false,
          color: iconColor,
          fontSize: iconSize,
          fontFamily: icon!.fontFamily,
          package: icon!.fontPackage,
        ),
      ),
    );

    if (icon!.matchTextDirection) {
      switch (textDirection) {
        case TextDirection.rtl:
          iconWidget = Transform(
            transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
            alignment: Alignment.center,
            transformHitTests: false,
            child: iconWidget,
          );
          break;
        case TextDirection.ltr:
          break;
      }
    }

    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(
        child: SizedBox(
          width: iconSize,
          height: iconSize,
          child: Center(child: iconWidget),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IconDataProperty(
      'icon',
      icon,
      ifNull: '<empty>',
      showName: false,
    ));
    properties.add(DoubleProperty('size', size, defaultValue: null));
    properties.add(ColorProperty('color', color, defaultValue: null));
  }
}

/// Controls the default color, opacity, and size of icons in a widget subtree.
///
/// The icon theme is honored by [CupertinoIcon] widgets.
class CupertinoIconTheme extends InheritedTheme {
  /// Creates an icon theme that controls the color, opacity, and size of
  /// descendant widgets.
  ///
  /// Both [data] and [child] arguments must not be null.
  const CupertinoIconTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Creates an icon theme that controls the color, opacity, and size of
  /// descendant widgets, and merges in the current icon theme, if any.
  ///
  /// The [data] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    required CupertinoIconThemeData data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        return CupertinoIconTheme(
          key: key,
          data: _getInheritedIconThemeData(context).merge(data),
          child: child,
        );
      },
    );
  }

  /// The color, opacity, and size to use for icons in this subtree.
  final CupertinoIconThemeData data;

  /// The data from the closest instance of this class that encloses the given
  /// context, if any.
  ///
  /// If there is no ambient icon theme, defaults to [CupertinoIconThemeData.fallback].
  /// The returned [CupertinoIconThemeData] is concrete (all values are non-null; see
  /// [CupertinoIconThemeData.isConcrete]). Any properties on the ambient icon theme that
  /// are null get defaulted to the values specified on
  /// [CupertinoIconThemeData.fallback].
  ///
  /// The [CupertinoTheme] widget from the `Cupertino_ui` library introduces a [CupertinoIconTheme]
  /// widget set to the [CupertinoThemeData.iconTheme], so in a Cupertino_ui-style
  /// application, this will typically default to the icon theme from the
  /// ambient [CupertinoTheme].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// CupertinoIconThemeData theme = CupertinoIconTheme.of(context);
  /// ```
  static CupertinoIconThemeData of(BuildContext context) {
    final CupertinoIconThemeData iconThemeData =
        _getInheritedIconThemeData(context).resolve(context);
    return iconThemeData.isConcrete
        ? iconThemeData
        : iconThemeData.copyWith(
            size: iconThemeData.size ??
                const CupertinoIconThemeData.fallback().size,
            color: iconThemeData.color ??
                const CupertinoIconThemeData.fallback().color,
            opacity: iconThemeData.opacity ??
                const CupertinoIconThemeData.fallback().opacity,
          );
  }

  static CupertinoIconThemeData _getInheritedIconThemeData(
      BuildContext context) {
    final CupertinoIconTheme? iconTheme =
        context.dependOnInheritedWidgetOfExactType<CupertinoIconTheme>();

    final brightness = CupertinoTheme.brightnessOf(context);

    return iconTheme?.data ??
        CupertinoIconThemeData(
          color: brightness.resolve(
            darkColor: CupertinoColors.activeBlue.darkColor,
            lightColor: CupertinoColors.activeBlue.color,
          ),
          size: 20,
        );
  }

  @override
  bool updateShouldNotify(CupertinoIconTheme oldWidget) =>
      data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return CupertinoIconTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}

/// Defines the color, opacity, and size of icons.
///
/// Used by [CupertinoIconTheme] to control the color, opacity, and size of icons in a
/// widget subtree.
///
/// To obtain the current icon theme, use [CupertinoIconTheme.of]. To convert an icon
/// theme to a version with all the fields filled in, use
/// [CupertinoIconThemeData.fallback].
class CupertinoIconThemeData with Diagnosticable {
  /// Creates an icon theme data.
  ///
  /// The opacity applies to both explicit and default icon colors. The value
  /// is clamped between 0.0 and 1.0.
  const CupertinoIconThemeData({
    this.color,
    double? opacity,
    this.size,
  }) : _opacity = opacity;

  /// Creates an icon theme with some reasonable default values.
  ///
  /// The [color] is blue, the [opacity] is 1.0, and the [size] is 24.0.
  const CupertinoIconThemeData.fallback()
      : color = const Color.fromARGB(255, 0, 122, 255),
        _opacity = 1.0,
        size = 24.0;

  /// Creates a copy of this icon theme but with the given fields replaced with
  /// the new values.
  CupertinoIconThemeData copyWith({
    Color? color,
    double? opacity,
    double? size,
  }) {
    return CupertinoIconThemeData(
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
      size: size ?? this.size,
    );
  }

  /// Returns a new icon theme that matches this icon theme but with some values
  /// replaced by the non-null parameters of the given icon theme. If the given
  /// icon theme is null, simply returns this icon theme.
  CupertinoIconThemeData merge(CupertinoIconThemeData? other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      opacity: other.opacity,
      size: other.size,
    );
  }

  /// Called by [CupertinoIconTheme.of] to convert this instance to an [CupertinoIconThemeData]
  /// that fits the given [BuildContext].
  ///
  /// This method gives the ambient [CupertinoIconThemeData] a chance to update itself,
  /// after it's been retrieved by [CupertinoIconTheme.of], and before being returned as
  /// the final result. For instance, [CupertinoIconThemeData] overrides this method
  /// to resolve [color], in case [color] is a [CupertinoDynamicColor] and needs
  /// to be resolved against the given [BuildContext] before it can be used as a
  /// regular [Color].
  ///
  /// The default implementation returns this [CupertinoIconThemeData] as-is.
  ///
  /// See also:
  ///
  ///  * [CupertinoIconThemeData.resolve] an implementation that resolves
  ///    the color of [CupertinoIconThemeData] before returning.
  CupertinoIconThemeData resolve(BuildContext context) => this;

  /// Whether all the properties of this object are non-null.
  bool get isConcrete => color != null && opacity != null && size != null;

  /// The default color for icons.
  final Color? color;

  /// An opacity to apply to both explicit and default icon colors.
  double? get opacity => _opacity?.clamp(0.0, 1.0);
  final double? _opacity;

  /// The default size for icons.
  final double? size;

  /// Linearly interpolate between two icon theme data objects.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static CupertinoIconThemeData lerp(
    CupertinoIconThemeData? a,
    CupertinoIconThemeData? b,
    double t,
  ) {
    return CupertinoIconThemeData(
      color: Color.lerp(a?.color, b?.color, t),
      opacity: ui.lerpDouble(a?.opacity, b?.opacity, t),
      size: ui.lerpDouble(a?.size, b?.size, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is CupertinoIconThemeData &&
        other.color?.value == color?.value &&
        other.opacity == opacity &&
        other.size == size;
  }

  @override
  int get hashCode => Object.hash(color, opacity, size);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('CupertinoColor', color, defaultValue: null));
    properties.add(DoubleProperty('opacity', opacity, defaultValue: null));
    properties.add(DoubleProperty('size', size, defaultValue: null));
  }
}
