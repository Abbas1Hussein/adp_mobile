import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveBottomSheet should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (context) {
              return AdaptiveButton(
                child: const Text('Show BottomSheet'),
                onPressed: () {
                  showAdpBottomSheet(
                    context: context,
                    builder: (context) {
                      return AdaptiveBottomSheet(
                        title: const Text('title'),
                        content: const Text('content'),
                        actions: [
                          AdaptiveBottomSheetAction(
                            child: const Text('action 1'),
                            onPressed: () {},
                          ),
                          AdaptiveBottomSheetAction(
                            child: const Text('action 2'),
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

      await widgetTester.tap(find.text('Show BottomSheet'));
      await widgetTester.pumpAndSettle();

      adaptiveValue(
        iOS: () => expect(find.byType(CupertinoActionSheet), findsOneWidget),
        android: () => expect(find.byType(CupertinoActionSheet), findsNothing),
      );
    },
  );
}
