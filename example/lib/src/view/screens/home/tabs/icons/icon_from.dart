import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart' as m;

class IconFromPreview extends StatelessWidget {
  const IconFromPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveIcon.from(
          aICON: m.Icons.camera_alt,
          iICON: CupertinoIcons.camera_fill,
        ),
        AdaptiveIcon.from(
          aICON: CupertinoIcons.settings,
          iICON: m.Icons.settings,
        ),
        AdaptiveIcon.from(
          aICON: m.Icons.airplanemode_on_sharp,
          iICON: CupertinoIcons.airplane,
        ),
      ],
    );
  }
}
