import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/platform_ruining.dart';
import '../bottom_bar/bottom_bar.dart';
import '../title_bar/title_bar.dart';

class HeaderFooterWrapper extends StatelessWidget {
  const HeaderFooterWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: PlatformRuining.isAndroid
          ? Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7)
          : CupertinoTheme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
      child: Column(
        children: [const TitleBar(), Expanded(child: child), const BottomBar()],
      ),
    );
  }
}
