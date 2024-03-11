import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveDatePicker render correctly',
    (tester) async {
      await tester.pumpWidget(wrapApp(child: const AdaptiveDatePicker()));

      await tester.tap(find.byType(AdaptiveDatePicker));
      await tester.pumpAndSettle();
      adaptiveValue(
        ios: () {
          expect(find.byType(CupertinoDatePicker), findsOneWidget);
          expect(find.byType(DatePickerDialog), findsNothing);
        },
        android: () {
          expect(find.byType(DatePickerDialog), findsOneWidget);
          expect(find.byType(CupertinoDatePicker), findsNothing);
        },
      );
    },
  );
}
