import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';


class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 24,
          child: DragToMoveArea(
            child: IconTheme(
              data: const IconThemeData(size: 15.0, color: Colors.white),
              child: Row(
                children: [
                  const SizedBox(width: 6.0),
                  const Icon(CupertinoIcons.battery_75_percent),
                  const SizedBox(width: 6.0),
                  const Icon(CupertinoIcons.wifi),
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
        ),
        Expanded(child: child),
        SizedBox(
          height: 34.0,
          width: double.infinity,
          child: IconTheme(
            data: const IconThemeData(size: 15.0, color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => windowManager.close(),
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                ),
                IconButton(
                  onPressed: () => windowManager.minimize(),
                  icon: const Icon(Icons.circle_outlined),
                ),
                IconButton(
                  onPressed: () async {
                    if (await windowManager.isMaximized()){
                      windowManager.unmaximize();
                    } else {
                      windowManager.maximize();
                    }
                  },
                  icon: const Icon(Icons.rectangle_outlined),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
