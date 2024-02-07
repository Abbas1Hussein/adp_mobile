import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../../buttons/icon_button/icon_button.dart';
import '../../icon/icon.dart';
import '../../icon/icons.dart';

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
        ),
        Expanded(child: child),
        const TitleBottom(),
      ],
    );
  }
}

class TitleBottom extends StatefulWidget {
  const TitleBottom({super.key});

  @override
  State<TitleBottom> createState() => _TitleBottomState();
}

class _TitleBottomState extends State<TitleBottom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.0,
      width: double.infinity,
      child: IconTheme(
        data: const IconThemeData(size: 15.0, color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Tooltip(
              message: 'finish',
              child: AdaptiveIconButton(
                onPressed: windowManager.close,
                icon: const AdaptiveIcon.all(Icons.arrow_back_ios_rounded),
              ),
            ),
            Tooltip(
              message: 'minimize',
              child: AdaptiveIconButton(
                onPressed: windowManager.minimize,
                icon: const AdaptiveIcon.all(Icons.circle_rounded),
              ),
            ),
            FutureBuilder<bool>(
              future: windowManager.isMaximized(),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return Tooltip(
                    message: 'unMaximize',
                    child: AdaptiveIconButton(
                      onPressed: () {
                        windowManager.unmaximize();
                        setState(() {});
                      },
                      icon: const AdaptiveIcon.all(Icons.rectangle_outlined),
                    ),
                  );
                }
                return Tooltip(
                  message: 'maximized',
                  child: AdaptiveIconButton(
                    onPressed: () {
                      windowManager.maximize();
                      setState(() {});
                    },
                    icon: const AdaptiveIcon.all(Icons.rectangle_rounded),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
