import 'package:flutter/cupertino.dart' show CupertinoTheme, CupertinoThemeData;
import 'package:flutter/material.dart' hide Builder;

import '../adaptive.dart';
import 'builders.dart';
import 'properties.dart';

export 'builders.dart';

mixin AdaptiveComponentMixin<Android extends CoreAndroidProperty,
    IOS extends CoreIOSProperty> {
  CoreProperties<Android, IOS>? get properties => null;

  CoreAdaptiveBuilder<Builder<ThemeData, Android?>,
      Builder<CupertinoThemeData, IOS?>>? get builders => null;

  Widget android(BuildContext context, [Android? property]);

  Widget iOS(BuildContext context, [IOS? property]);

  Widget getAdaptiveComponent(BuildContext context) {
    return adaptiveValue(
      android: () {
        final body = android(context, properties?.android);

        if (builders?.android != null) {
          return builders!.android!.call(
            body,
            Theme.of(context),
            properties?.android,
          );
        }
        return body;
      },
      ios: () {
        final body = iOS(context, properties?.ios);

        if (builders?.ios != null) {
          return builders!.ios!.call(
            body,
            CupertinoTheme.of(context),
            properties?.ios,
          );
        }
        return body;
      },
    );
  }
}
