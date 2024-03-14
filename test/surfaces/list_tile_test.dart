import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveListTile should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptiveListTile(
            onTap: () {},
            onLongPress: () {},
            title: const Text('title'),
            leading: const Text('leading'),
            trailing: const Text('trailing'),
            subtitle: const Text('subtitle'),
          ),
        ),
      );
      await widgetTester.pumpAndSettle();

      adaptiveValue(
        ios: () {
          expect(find.byType(CupertinoListTile), findsOneWidget);
          expect(find.byType(ListTile), findsNothing);
        },
        android: () {
          expect(find.byType(ListTile), findsOneWidget);
          expect(find.byType(CupertinoListTile), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveListTile should trigger onTap and onLongPress callback',
    (widgetTester) async {
      bool onTap = false;
      bool longPressTriggered = false;

      await widgetTester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptiveListTile(
            onTap: () => onTap = true,
            onLongPress: () => longPressTriggered = true,
            title: const Text('cloudDownload'),
            subtitle: const Text('your download from net.'),
            leading: const AdaptiveIcon(AdpIcons.cloudDownload),
          ),
        ),
      );
      await widgetTester.tap(find.byType(AdaptiveListTile));
      await widgetTester.pumpAndSettle();

      await widgetTester.longPress(find.byType(AdaptiveListTile));
      await widgetTester.pumpAndSettle();

      expect(onTap, true);
      expect(longPressTriggered, true);
    },
  );

  testWidgets(
    'AdaptiveListTile should not trigger when click onTap and onLongPress callback disabled state',
    (widgetTester) async {
      bool onTap = false;
      bool longPressTriggered = false;

      await widgetTester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptiveListTile(
            enabled: false,
            onTap: () => onTap = true,
            onLongPress: () => longPressTriggered = true,
            title: const Text('cloudDownload'),
            subtitle: const Text('your download from net.'),
            leading: const AdaptiveIcon(AdpIcons.cloudDownload),
          ),
        ),
      );

      await widgetTester.longPress(find.byType(AdaptiveListTile), warnIfMissed: false);
      await widgetTester.pumpAndSettle();
      expect(longPressTriggered, false);

      await widgetTester.tap(find.byType(AdaptiveListTile), warnIfMissed: false);
      await widgetTester.pumpAndSettle();
      expect(onTap, false);
    },
  );
}
