import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  late TextEditingController controller;

  setUp(() {
    controller = TextEditingController();
  });

  testWidgets(
    'AdaptiveTextField render correctly',
    (tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(child: AdaptiveTextField(controller: controller)),
        ),
      );

      await tester.pumpAndSettle();
      adaptiveValue(
        iOS: () {
          expect(find.byType(CupertinoTextField), findsOneWidget);
          expect(find.byType(TextField), findsNothing);
        },
        android: () {
          expect(find.byType(TextField), findsOneWidget);
          expect(find.byType(CupertinoTextField), findsNothing);
        },
      );
    },
  );

  testWidgets('AdaptiveTextField Entered text matches', (tester) async {
    const input = 'AbbasHussein';

    await tester.pumpWidget(
      wrapAppWithScaffold(
        child: Center(child: AdaptiveTextField(controller: controller)),
      ),
    );

    final textField = find.byType(AdaptiveTextField);

    await tester.enterText(textField, input);
    expect(controller.text, input);
  });

  testWidgets('AdaptiveTextField functionality', (tester) async {
    String onChangedValue = '';
    String onSubmittedValue = '';
    bool onTapCallbackCalled = false;

    await tester.pumpWidget(
      wrapAppWithScaffold(
        child: Center(
          child: AdaptiveTextField(
            controller: controller,
            onTap: () => onTapCallbackCalled = true,
            onChanged: (value) => onChangedValue = value,
            onSubmitted: (value) => onSubmittedValue = value,
          ),
        ),
      ),
    );

    final textField = find.byType(AdaptiveTextField);

    //  Ensure onChanged callback is called when text changes
    await tester.enterText(textField, 'NewText');
    expect(onChangedValue, 'NewText');

    // Check if onTap callback is triggered
    await tester.tap(textField);
    expect(onTapCallbackCalled, true);

    // Submit the text and check if onSubmitted callback is triggered
    await tester.testTextInput.receiveAction(TextInputAction.done);
    expect(onSubmittedValue, 'NewText');
  });
}
