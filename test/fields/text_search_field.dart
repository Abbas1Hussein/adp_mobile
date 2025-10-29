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
    'AdaptiveTextSearchField render correctly',
    (tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(child: AdaptiveTextSearchField(controller: controller)),
        ),
      );

      await tester.pumpAndSettle();
      adaptiveValue(
        iOS: () {
          expect(find.byType(CupertinoSearchTextField), findsOneWidget);
          expect(find.byType(SearchBar), findsNothing);
        },
        android: () {
          expect(find.byType(SearchBar), findsOneWidget);
          expect(find.byType(CupertinoSearchTextField), findsNothing);
        },
      );
    },
  );

  testWidgets('AdaptiveTextSearchField Entered text matches', (tester) async {
    const input = 'AbbasHussein';

    await tester.pumpWidget(
      wrapAppWithScaffold(
        child: Center(child: AdaptiveTextSearchField(controller: controller)),
      ),
    );

    final textField = find.byType(AdaptiveTextSearchField);

    await tester.enterText(textField, input);
    expect(controller.text, input);
  });

  testWidgets('AdaptiveTextSearchField functionality', (tester) async {
    String onChangedValue = '';
    String onSubmittedValue = '';
    bool onTapCallbackCalled = false;

    await tester.pumpWidget(
      wrapAppWithScaffold(
        child: Center(
          child: AdaptiveTextSearchField(
            controller: controller,
            onTap: () => onTapCallbackCalled = true,
            onChanged: (value) => onChangedValue = value,
            onSubmitted: (value) => onSubmittedValue = value,
          ),
        ),
      ),
    );

    final textField = find.byType(AdaptiveTextSearchField);

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
