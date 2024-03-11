import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveCircularProgressIndicator renders correctly with value',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(child: const AdaptiveCircularProgressIndicator()),
      );

      adaptiveValue(
        ios: () {
          expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
          expect(find.byType(CircularProgressIndicator), findsNothing);
        },
        android: () {
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
          expect(find.byType(CupertinoActivityIndicator), findsNothing);
        },
      );
    },
  );
}
