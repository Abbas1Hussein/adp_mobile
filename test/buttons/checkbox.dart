import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile/src/core/enum/target.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'Renders correctly AdaptiveCheckbox',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptiveCheckbox(value: true, onChanged: (value) {}),
        ),
      );

      await tester.pumpAndSettle();

      adaptiveValue(
        ios: () {
          expect(find.byType(CupertinoCheckbox), findsOneWidget);
          expect(find.byType(Checkbox), findsNothing);
        },
        android: () {
          expect(find.byType(Checkbox), findsOneWidget);
          expect(find.byType(CupertinoCheckbox), findsNothing);
        },
      );
    },
  );

  Future<void> toggleAdaptiveCheckbox(WidgetTester tester) async {
    await tester.tap(find.byType(AdaptiveCheckbox));
    await tester.pumpAndSettle();
  }

  testWidgets(
    'Toggling AdaptiveCheckbox updates its value directly',
    (WidgetTester tester) async {
      bool? checkBoxValue = false;

      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Center(
                child: AdaptiveCheckbox(
                  value: checkBoxValue,
                  onChanged: (bool? value) {
                    setState(() => checkBoxValue = value);
                  },
                ),
              );
            },
          ),
        ),
      );

      expect(
        tester.widget<AdaptiveCheckbox>(find.byType(AdaptiveCheckbox)).value,
        false,
      );

      await toggleAdaptiveCheckbox(tester);
      expect(checkBoxValue, true);

      await toggleAdaptiveCheckbox(tester);
      expect(checkBoxValue, false);

      await toggleAdaptiveCheckbox(tester);
      expect(checkBoxValue, true);
    },
  );
}
