import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile/src/components/fields/text_search_field/platform/platform.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  late TextEditingController controller;
  late List<AdaptiveSearchItem<int>> options;

  setUp(
    () {
      controller = TextEditingController();
      options = List.generate(
        10,
        (index) => AdaptiveSearchItem(
          searchKey: '${index + 1}',
          value: index + 1,
        ),
      );
    },
  );

  testWidgets(
    'AdaptiveTextSearchField render correctly',
    (tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(child: AdaptiveTextSearchField(options: options)),
        ),
      );

      await tester.pumpAndSettle();

      adaptiveValue(
        ios: () {
          expect(find.byType(MaterialAutocomplete<int>), findsNothing);
          expect(find.byType(CupertinoAutocomplete<int>), findsOneWidget);
        },
        android: () {
          expect(find.byType(MaterialAutocomplete<int>), findsOneWidget);
          expect(find.byType(CupertinoAutocomplete<int>), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveTextSearchField Entered text matches',
    (tester) async {
      const key = Key('adaptiveTextSearchField');
      const input = '- *** - {-(@AbbasHussein@)-} - *** -';

      await tester.runAsync(
        () async {
          await tester.pumpWidget(
            wrapAppWithScaffold(
              child: AdaptiveTextSearchField(
                key: key,
                focusNode: FocusNode(),
                controller: controller,
                options: options,
              ),
            ),
          );

          await tester.pumpAndSettle();

          // Trigger options by entering text
          await tester.enterText(find.byKey(key), input);
          expect(controller.text, input);
        },
      );
    },
  );

  tearDown(() => controller.dispose());
}
