import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';
import '../../../../core/extension/widget.dart';
import '../tab.dart';

const CupertinoDynamicColor _kThumbColor = CupertinoDynamicColor.withBrightness(
  color: Color(0xFFFFFFFF),
  darkColor: Color(0xFF636366),
);

class TabViewIOS extends StatelessWidget {
  const TabViewIOS({
    super.key,
    this.property,
    this.onChanged,
    this.primaryColor,
    this.secondaryColor,
    this.contentPadding,
    this.contentMargin,
    this.selectedTabColor,
    this.unselectedTabColor,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    required this.tabs,
    required this.children,
    required this.currentIndex,
  });

  final TabViewIOSProperty? property;

  final int currentIndex;
  final ValueChanged<int>? onChanged;

  final List<Widget> children;
  final List<AdaptiveTab> tabs;

  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? contentMargin;

  final Color? primaryColor;
  final Color? secondaryColor;

  final Color? selectedTabColor;
  final Color? unselectedTabColor;

  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: primaryColor,
      child: Column(
        children: [
          SizedBox(
            width: (property?.isExpended ?? true) ? double.infinity : null,
            child: Padding(
              padding:  property?.margin ?? const EdgeInsets.all(4.0),
              child: CupertinoSlidingSegmentedControl(
                thumbColor: selectedTabColor ?? _kThumbColor,
                backgroundColor: property?.backgroundColor ?? CupertinoColors.tertiarySystemFill,
                children: List.generate(
                  tabs.length,
                  (index) {
                    final isSelected = currentIndex == index;

                    final icon = tabs[index].icon;
                    final label = tabs[index].label;

                    final iconTheme = icon != null
                        ? IconTheme.merge(
                            data: (isSelected
                                    ? selectedIconTheme
                                    : unselectedIconTheme) ??
                                IconTheme.of(context),
                            child: icon,
                          )
                        : null;

                    final labelTheme = DefaultTextStyle.merge(
                      style: isSelected ? selectedLabelStyle : unselectedLabelStyle,
                      child: label,
                    );

                    final color = isSelected ? null : unselectedTabColor;

                    return ColoredBox(
                      color: color ?? Colors.transparent,
                      child: Align(
                        alignment: property?.alignment ?? Alignment.center,
                        child: labelTheme.margeWith(iconTheme, 8.0),
                      ),
                    );
                  },
                ).asMap(),
                onValueChanged: (value) => onChanged?.call(value!),
                groupValue: currentIndex,
              ),
            ),
          ),
          Expanded(
            child: children.map(
              (child) {
                return Padding(
                  padding: contentMargin ?? EdgeInsets.zero,
                  child: ColoredBox(
                    color: secondaryColor ?? Colors.transparent,
                    child: Padding(
                      padding: contentPadding ?? EdgeInsets.zero,
                      child: child,
                    ),
                  ),
                );
              },
            ).toList()[currentIndex],
          ),
        ],
      ),
    );
  }
}

class TabViewIOSProperty extends CoreIOSProperty {
  const TabViewIOSProperty({
    this.margin,
    this.isExpended = true,
    this.alignment = Alignment.center,
    this.backgroundColor = CupertinoColors.tertiarySystemFill,
  });

  /// Determines whether the sliding segmented control should expand to fill available width.
  ///
  /// Defaults to `true`.
  final bool isExpended;

  /// External margins around the sliding segmented control.
  ///
  /// Defaults to [EdgeInsets.all(4.0)].
  final EdgeInsetsGeometry? margin;

  /// The color used to paint the rounded rect behind the [children] and the separators.
  ///
  /// The default value is [CupertinoColors.tertiarySystemFill]. The background
  /// will not be painted if null is specified.
  final Color? backgroundColor;

  /// Alignment of tab labels within the sliding segmented control.
  ///
  /// Defaults to [Alignment.center].
  final AlignmentGeometry alignment;
}
