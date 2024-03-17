import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests(MobileTargetPlatform.android);

  late TextEditingController controller;
  late List<AdaptiveSearchItem<int>> suggestions;

  setUp(
    () {
      controller = TextEditingController();
      suggestions = List.generate(
        10,
        (index) => AdaptiveSearchItem(
          searchKey: '${index + 1}',
          value: index + 1,
        ),
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
                controller: controller,
                suggestions: suggestions,
              ),
            ),
          );

          await tester.pumpAndSettle();

          // Trigger suggestions by entering text
          await tester.enterText(find.byKey(key), input);
          expect(controller.text, input);
        },
      );
    },
  );

  tearDown(() => controller.dispose());
}
