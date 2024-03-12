import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../slide_to.dart';
import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveSlider renders correctly with value',
    (WidgetTester tester) async {
      const double value = 50.0;
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptiveSlider(value: value, onChanged: (value) {}),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        ios: () {
          expect(find.byType(CupertinoSlider), findsOneWidget);
          expect(find.byType(Slider), findsNothing);

          final CupertinoSlider cupertinoSlider = tester.widget(
            find.byType(CupertinoSlider),
          );

          expect(cupertinoSlider.value, equals(value));
        },
        android: () {
          expect(find.byType(Slider), findsOneWidget);
          expect(find.byType(CupertinoSlider), findsNothing);

          final Slider slider = tester.widget(find.byType(Slider));
          expect(slider.value, equals(value));
        },
      );
    },
  );

  testWidgets(
    'AdaptiveSlider updates value correctly with slide gesture',
    (WidgetTester tester) async {
      double progressValue = 0;
      bool startCallbackCalled = false;
      bool endCallbackCalled = false;

      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: StatefulBuilder(
            builder: (context, setState) {
              return AdaptiveSlider(
                onChanged: (value) => setState(() => progressValue = value),
                onChangeStart: (_) => startCallbackCalled = true,
                onChangeEnd: (_) => endCallbackCalled = true,
                value: progressValue,
              );
            },
          ),
        ),
      );

      await tester.slideToValue(find.byType(AdaptiveSlider), 85.8);

      expect(progressValue, isNot(0));
      expect(startCallbackCalled, isTrue);
      expect(endCallbackCalled, isTrue);
    },
  );
}
