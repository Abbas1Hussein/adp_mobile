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
              child: IconButton(
                onPressed: windowManager.close,
                icon: const Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
            Tooltip(
              message: 'minimize',
              child: IconButton(
                onPressed: windowManager.minimize,
                icon: const Icon(Icons.circle_rounded),
              ),
            ),
            FutureBuilder<bool>(
              future: windowManager.isMaximized(),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return Tooltip(
                    message: 'unMaximize',
                    child: IconButton(
                      onPressed: () {
                        windowManager.unmaximize();
                        setState(() {});
                      },
                      icon: const Icon(Icons.rectangle_rounded),
                    ),
                  );
                }
                return Tooltip(
                  message: 'maximized',
                  child: IconButton(
                    onPressed: () {
                      windowManager.maximize();
                      setState(() {});
                    },
                    icon: const Icon(Icons.rectangle_rounded),
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
