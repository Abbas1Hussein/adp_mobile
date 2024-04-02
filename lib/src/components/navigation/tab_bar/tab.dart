import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';

class AdaptiveTab extends CoreAdaptiveComponent  {
  const AdaptiveTab({
    super.key,
    this.icon,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    required this.label,
  });

  final Widget label;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  final Widget? icon;
  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;

  @override
  Widget android(
    BuildContext context, [
    CoreAndroidProperty? property,
    bool isSelected = false,
    Axis? direction,
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    IconThemeData? selectedIconTheme,
    IconThemeData? unselectedIconTheme,
  ]) {
    final iconTheme = _buildIconTheme(
      context,
      isSelected,
      selectedIconTheme,
      unselectedIconTheme,
    );
    final labelStyle = _buildLabelStyle(
      isSelected,
      selectedLabelStyle,
      unselectedLabelStyle,
    );

    if (direction == Axis.horizontal) {
      return Tab(
        child: FittedBox(child: labelStyle.margeWith(iconTheme, 8.0)),
      );
    }
    return Tab(iconMargin: EdgeInsets.zero, icon: iconTheme, child: labelStyle);
  }

  @override
  Widget iOS(
    BuildContext context, [
    CoreIOSProperty? property,
    Color? color,
    bool isSelected = false,
    Axis? direction,
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    IconThemeData? selectedIconTheme,
    IconThemeData? unselectedIconTheme,
    AlignmentGeometry? alignment,
  ]) {
    final iconTheme = _buildIconTheme(
      context,
      isSelected,
      selectedIconTheme,
      unselectedIconTheme,
    );
    final labelStyle = _buildLabelStyle(
      isSelected,
      selectedLabelStyle,
      unselectedLabelStyle,
    );

    final colored = isSelected ? null : color;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ColoredBox(
          color: colored ?? Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: alignment ?? Alignment.center,
              child: direction == Axis.vertical
                  ? DefaultTextStyle.merge(
                      overflow: TextOverflow.ellipsis,
                      child: iconTheme?.margeWith(labelStyle, 8.0, Axis.vertical) ??
                          labelStyle,
                    )
                  : FittedBox(
                      child: labelStyle.margeWith(iconTheme, 8.0, Axis.horizontal),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildIconTheme(
    BuildContext context,
    bool isSelected,
    IconThemeData? selectedIconTheme,
    IconThemeData? unselectedIconTheme,
  ) {
    final selectedData = this.selectedIconTheme ?? selectedIconTheme;
    final unselectedData = this.unselectedIconTheme ?? unselectedIconTheme;

    final data = isSelected ? selectedData : unselectedData;
    return icon != null
        ? IconTheme.merge(
            data: data ??
                IconTheme.of(context).copyWith(
                  size: MediaQuery.textScalerOf(context).scale(21.5),
                ),
            child: icon!)
        : null;
  }

  Widget _buildLabelStyle(
    bool isSelected,
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
  ) {
    final selectedStyle = this.selectedLabelStyle ?? selectedLabelStyle;
    final unselectedStyle = this.unselectedLabelStyle ?? unselectedLabelStyle;

    final style = isSelected ? selectedStyle : unselectedStyle;
    return DefaultTextStyle.merge(style: style, child: label);
  }
}
