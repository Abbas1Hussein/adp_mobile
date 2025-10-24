import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveScaffoldPage should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapAppWithScaffold(child: const Center(child: AdaptiveDatePicker())),
      );

      await widgetTester.pumpAndSettle();
      adaptiveValue(
        iOS: () {
          expect(find.byType(CupertinoPageScaffold), findsOneWidget);
          expect(find.byType(Scaffold), findsNothing);
        },
        android: () {
          expect(find.byType(Scaffold), findsOneWidget);
          expect(find.byType(CupertinoPageScaffold), findsNothing);
        },
      );
    },
  );
}
