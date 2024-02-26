import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../../buttons/icon_button/icon_button.dart';
import '../../icon/icon.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
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
