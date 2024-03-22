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
          material: m.Icons.camera_alt,
          cupertino: CupertinoIcons.camera_fill,
        ),
        AdaptiveIcon.from(
          material: CupertinoIcons.settings,
          cupertino: m.Icons.settings,
        ),
        AdaptiveIcon.from(
          material: m.Icons.airplanemode_on_sharp,
          cupertino: CupertinoIcons.airplane,
        ),
      ],
    );
  }
}
