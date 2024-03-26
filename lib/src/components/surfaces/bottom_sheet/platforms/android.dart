import 'package:flutter/material.dart';

import '../../../../core/common/construct/property.dart';
import '../bottom_sheet.dart';

class BottomSheetAndroid extends StatelessWidget {
  const BottomSheetAndroid({
    super.key,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.contentPadding,
    this.contentTextStyle,
    this.contentScrollController,
    required this.content,
    this.actions,
    this.actionsPadding,
    this.actionsTextStyle,
    this.actionScrollController,
  });

  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;
  final ScrollController? contentScrollController;
  final ScrollController? actionScrollController;

  final Widget content;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? actionsPadding;
  final TextStyle? actionsTextStyle;

  @override
  Widget build(BuildContext context) {
    final isSmallThan2 = actions!.length <= 2;

    return SafeArea(
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) Padding(
                padding: titlePadding ?? const EdgeInsets.all(8.0),
                child: DefaultTextStyle.merge(
                  style: titleTextStyle ?? Theme.of(context).textTheme.titleMedium,
                  child: title!,
                ),
              ),
            Flexible(
              child: Padding(
                padding: contentPadding ?? const EdgeInsets.all(8.0),
                child: DefaultTextStyle.merge(
                  style: contentTextStyle ?? Theme.of(context).textTheme.bodySmall,
                  child: SingleChildScrollView(
                    controller: contentScrollController,
                    child: content,
                  ),
                ),
              ),
            ),
            if (isSmallThan2) const Divider(),
            if (actions != null && actions!.isNotEmpty)
              Builder(
                builder: (context) {
                  if (isSmallThan2) {
                    final List<Widget>? buildActions = actions?.map((child) {
                      if (child is AdaptiveBottomSheetAction) {
                        return child.android(context, null, isSmallThan2);
                      }
                      return child;
                    }).toList();

                    return Row(
                      children: [
                        Expanded(child: _buildAction(buildActions![0])),
                        if (buildActions.length > 1) const SizedBox(height: 15.0, child: VerticalDivider()),
                        if (buildActions.length > 1) Expanded(child: _buildAction(buildActions[1])),
                      ],
                    );
                  } else {
                    return SingleChildScrollView(
                      controller: actionScrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: actions!.map((child) => _buildAction(child)).toList(),
                      ),
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(Widget child) {
    return Padding(
      padding: actionsPadding ?? const EdgeInsets.all(4.0),
      child: DefaultTextStyle.merge(style: actionsTextStyle, child: child),
    );
  }
}

class BottomSheetAndroidProperty extends CoreAndroidProperty {
  const BottomSheetAndroidProperty({
    this.shape,
    this.elevation,
    this.constraints,
    this.showDragHandle,
    this.backgroundColor,
    this.enableDrag = true,
    this.isScrollControlled = false,
  });

  final bool enableDrag;
  final double? elevation;
  final ShapeBorder? shape;
  final bool? showDragHandle;
  final Color? backgroundColor;
  final bool isScrollControlled;
  final BoxConstraints? constraints;
}
