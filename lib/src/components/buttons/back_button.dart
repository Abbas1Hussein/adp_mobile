import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/common/construct/component.dart';

class AdaptiveBackButton extends CoreAdaptiveComponent {
  const AdaptiveBackButton({super.key, this.color, this.onPressed});

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return BackButton(color: color, onPressed: onPressed);
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoNavigationBarBackButton(color: color, onPressed: onPressed);
  }
}
