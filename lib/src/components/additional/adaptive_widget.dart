import 'package:flutter/widgets.dart';

import '../../core/common/construct/component.dart';
import '../../core/common/construct/property.dart';

class AdaptiveWidget extends CoreAdaptiveComponent {
  const AdaptiveWidget({
    super.key,
    required this.onAndroid,
    required this.oniOS,
  });

  final WidgetBuilder onAndroid;
  final WidgetBuilder oniOS;

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) =>
      onAndroid(context);

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) =>
      oniOS(context);
}
