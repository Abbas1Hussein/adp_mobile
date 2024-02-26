import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../../icon/icon.dart';
import '../../icon/icons.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: double.infinity,
      child: DragToMoveArea(
        child: IconTheme(
          data: const IconThemeData(size: 15.0, color: Colors.white),
          child: Row(
            children: [
              const SizedBox(width: 6.0),
              const AdaptiveIcon(AdpIcons.battery75),
              const SizedBox(width: 6.0),
              const AdaptiveIcon(AdpIcons.wifi),
              const Expanded(
                child: DragToResizeArea(
                  enableResizeEdges: [ResizeEdge.top],
                  child: SizedBox(width: double.infinity, height: 24.0),
                ),
              ),
              Text(
                TimeOfDay.now().format(context),
                style: Theme.of(context).typography.dense.bodySmall,
              ),
              const SizedBox(width: 6.0),
            ],
          ),
        ),
      ),
    );
  }
}
