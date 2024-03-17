import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile/src/components/buttons/button/iOS.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveIconButton renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: const Center(
            child: AdaptiveIconButton(
              icon: AdaptiveIcon(AdpIcons.add),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        ios: () {
          expect(find.byType(IOSButton), findsOneWidget);
          expect(find.byType(IconButton), findsNothing);
        },
        android: () {
          expect(find.byType(IconButton), findsOneWidget);
          expect(find.byType(IOSButton), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveIconButton calls onPressed callbacks',
    (WidgetTester tester) async {
      bool checkValue = false;

      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(
            child: AdaptiveIconButton(
              onPressed: () => checkValue = true,
              icon: const AdaptiveIcon(AdpIcons.add),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AdaptiveIconButton));
      await tester.pumpAndSettle();
      expect(checkValue, true);
    },
  );

  testWidgets(
    'AdaptiveIconButton disabled state',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: const Center(
            child: AdaptiveIconButton(
              onPressed: null,
              icon: AdaptiveIcon(AdpIcons.app),
            ),
          ),
        ),
      );

      // Verify that the button is disabled and not tappable
      expect(find.byType(AdaptiveIconButton), findsOneWidget);
      final iconButton = tester.widget<AdaptiveIconButton>(
        find.byType(AdaptiveIconButton),
      );

      expect(iconButton.onPressed, isNull);

      // tap the disabled button
      await tester.tap(find.byType(AdaptiveIconButton));
      await tester.pumpAndSettle();

      // Ensure that the onPressed callback is still null and no action is taken
      expect(iconButton.onPressed, isNull);
    },
  );
}
