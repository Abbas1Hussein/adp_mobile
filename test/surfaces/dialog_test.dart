import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  const title = 'Are you sure you want to proceed?';
  const message =
      'There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...';

  testWidgets(
    'AdaptiveDialog should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (context) {
              return AdaptiveButton(
                child: const Text('Show Dialog'),
                onPressed: () {
                  showAdpDialog(
                    context: context,
                    builder: (context) {
                      return AdaptiveDialog(
                        title: const Text(title),
                        content: const Text(message),
                        actions: [
                          AdaptiveDialogAction(
                            child: const Text('Action 1'),
                            onPressed: () {},
                          ),
                          AdaptiveDialogAction(
                            child: const Text('Action 2'),
                            onPressed: () {},
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      );

      await widgetTester.tap(find.text('Show Dialog'));
      await widgetTester.pumpAndSettle();

      adaptiveValue(
        ios: () {
          expect(find.byType(CupertinoAlertDialog), findsOneWidget);
          expect(find.byType(AlertDialog), findsNothing);
        },
        android: () {
          expect(find.byType(AlertDialog), findsOneWidget);
          expect(find.byType(CupertinoAlertDialog), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'DialogPresenter - Show Confirmation Dialog',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (context) {
              return AdaptiveButton(
                child: const Text('Show Confirmation Dialog'),
                onPressed: () async {
                  final result = await DialogPresenter.showConfirmationDialog(
                    context,
                    title: title,
                    message: message,
                    confirmLabel: 'Confirm',
                  );

                  // Ensure that the dialog was closed with the correct result.
                  expect(result, true);
                },
              );
            },
          ),
        ),
      );

      // Trigger the dialog.
      await tester.tap(find.text('Show Confirmation Dialog'));
      await tester.pumpAndSettle();

      // Confirm the dialog.
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      // Ensure that the dialog is closed.
      expect(find.byType(AdaptiveDialog), findsNothing);
    },
  );

  testWidgets(
    'DialogPresenter - Show Information Dialog',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (BuildContext context) {
              return AdaptiveButton(
                onPressed: () async {
                  await DialogPresenter.showInformationDialog(
                    context,
                    title: title,
                    message: message,
                  );

                  expect(find.byType(AdaptiveButton), findsOneWidget);
                },
                child: const Text('Show Information Dialog'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Information Dialog'));
      await tester.pumpAndSettle();
    },
  );
}
