import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveTimePicker render correctly',
    (tester) async {
      await tester.pumpWidget(wrapApp(child: const AdaptiveTimePicker()));

      await tester.tap(find.byType(AdaptiveTimePicker));
      await tester.pumpAndSettle();

      adaptiveValue(
        iOS: () {
          expect(find.byType(CupertinoTimerPicker), findsOneWidget);
          expect(find.byType(TimePickerDialog), findsNothing);
        },
        android: () {
          expect(find.byType(TimePickerDialog), findsOneWidget);
          expect(find.byType(CupertinoTimerPicker), findsNothing);
        },
      );
    },
  );
}
