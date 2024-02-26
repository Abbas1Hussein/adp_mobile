import 'package:flutter/widgets.dart';

import '../../core/common/construct/component.dart';

class AdaptiveBuilderWidget extends CoreAdaptiveComponent {
  const AdaptiveBuilderWidget({
    super.key,
    super.builders,
    required this.child,
  });

  final Widget child;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return child;
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return child;
  }
}
