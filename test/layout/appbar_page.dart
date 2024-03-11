import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveAppBarPage should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: AdaptiveScaffoldPage(
            appBar: AdaptiveAppBarPage(
              title: const Text('Adaptive AppBar'),
              leading: const AdaptiveIcon(AdpIcons.home),
              actions: [
                AdaptiveIconButton(
                  icon: const AdaptiveIcon(AdpIcons.add),
                  onPressed: () {},
                ),
                const Divider(),
                AdaptiveIconButton(
                  icon: const AdaptiveIcon(AdpIcons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
