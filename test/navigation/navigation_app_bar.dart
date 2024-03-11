import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';
import 'main_menu.dart';

void main() {
  initializeMobileDefaultsTests();

  testWidgets(
    'AdaptiveNavigationAppBar should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: AdaptiveNavigationView(
            appBar: const AdaptiveNavigationAppbar(
              title: Text('Home'),
              leading: AdaptiveIcon(AdpIcons.home),
            ),
            navigationBar: AdaptiveNavigationBar(
              items: List.generate(
                mainMenuIcons.length,
                (index) => AdaptiveNavigationBarItem(
                  label: mainMenuTexts[index],
                  icon: AdaptiveIcon(mainMenuIcons[index]),
                ),
              ),
            ),
            children: List.generate(
              mainMenuIcons.length,
              (index) => Center(child: Text(mainMenuTexts[index])),
            ),
          ),
        ),
      );

      await widgetTester.pumpAndSettle();
      adaptiveValue(
        ios: () {
          expect(find.byType(CupertinoNavigationBar), findsOneWidget);
          expect(find.byType(AppBar), findsNothing);
        },
        android: () {
          expect(find.byType(AppBar), findsOneWidget);
          expect(find.byType(CupertinoNavigationBar), findsNothing);
        },
      );
    },
  );
}
