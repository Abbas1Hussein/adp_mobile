import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';
import 'main_menu.dart';

void main() {
  initializeMobileDefaultsTests();

  late List<Widget> children;
  late List<AdaptiveNavigationBarItem> items;

  setUp(
    () {
      items = List.generate(
        mainMenuTexts.length,
        (index) {
          return AdaptiveNavigationBarItem(
            icon: AdaptiveIcon(mainMenuIcons[index]),
            label: mainMenuTexts[index],
          );
        },
      );

      children = items.map(
        (element) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text(element.label!), element.icon],
          );
        },
      ).toList();
    },
  );

  testWidgets(
    'AdaptiveNavigationView should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: AdaptiveNavigationView(
            navigationBar: AdaptiveNavigationBar(items: items),
            children: children,
          ),
        ),
      );
      await widgetTester.pumpAndSettle();

      adaptiveValue(
        iOS: () {
          expect(find.byType(CupertinoTabScaffold), findsOneWidget);
          expect(find.byType(Scaffold), findsNothing);
        },
        android: () {
          expect(find.byType(Scaffold), findsOneWidget);
          expect(find.byType(CupertinoTabScaffold), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveNavigationView updates currentIndex correctly on item selection',
    (tester) async {
      await tester.runAsync(
        () async {
          int currentIndex = 0;

          await tester.pumpWidget(
            wrapApp(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return AdaptiveNavigationView(
                    navigationBar: AdaptiveNavigationBar(
                      items: items,
                      currentIndex: currentIndex,
                      onChanged: (value) {
                        setState(() => currentIndex = value);
                      },
                    ),
                    children: children,
                  );
                },
              ),
            ),
          );

          final navigationViewFinder = find.byType(AdaptiveNavigationView);

          final findItems = tester
              .widget<AdaptiveNavigationView>(navigationViewFinder)
              .navigationBar
              .items;

          // Initial state check (currentIndex is 0).
          expect(
              tester
                  .widget<AdaptiveNavigationView>(navigationViewFinder)
                  .navigationBar
                  .currentIndex,
              0);

          // Simulate a tap on the last item's icon.
          await tester.tap(find.byWidget(findItems.last.icon));
          await tester.pumpAndSettle();

          // Check if currentIndex is updated to the last item's index (6).
          expect(currentIndex, findItems.length - 1);

          // Simulate a tap on the first item's icon.
          await tester.tap(find.byWidget(findItems.first.icon));
          await tester.pumpAndSettle();

          // Check if currentIndex is updated back to the first item's index (0).
          expect(currentIndex, 0);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveNavigationAppBar`items` and `children` must have the same length.',
    (widgetTester) async {
      final navigationView = AdaptiveNavigationView(
        appBar: const AdaptiveNavigationAppbar(),
        navigationBar: AdaptiveNavigationBar(items: items),
        children: const [],
      );

      expect(
        () => navigationView.validateLength(),
        throwsA(isA<AssertionError>()),
      );
    },
  );
}
