import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveIcon renders on both platforms',
    (WidgetTester tester) async {
      await tester.pumpWidget(wrapApp(child: const AdaptiveIcon(AdpIcons.add)));

      adaptiveValue(
        iOS: () => expect(find.byType(Icon), findsOneWidget),
        android: () => expect(find.byType(Icon), findsOneWidget),
      );
    },
  );
}
