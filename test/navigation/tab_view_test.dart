// import 'package:adp_mobile/adp_mobile.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import '../wrap_app.dart';
// import 'main_menu.dart';
//
// void main() {
//   initializeMobileDefaultsTests();
//
//   late List<AdaptiveTab> tabs;
//   late List<Widget> children;
//
//   setUp(
//     () {
//       tabs = List.generate(
//         mainMenuTexts.length,
//         (index) => AdaptiveTab(
//           icon: AdaptiveIcon(mainMenuIcons[index]),
//           label: SizedBox(
//             width: 30.0,
//             child: Text(mainMenuTexts[index]),
//           ),
//         ),
//       );
//
//       children =
//           tabs.map((element) => element.label.margeWith(element.icon)).toList();
//     },
//   );
//
//   testWidgets(
//     'AdaptiveTabView should render correctly',
//     (widgetTester) async {
//       await widgetTester.pumpWidget(
//         wrapApp(child: AdaptiveTabView(tabs: tabs, children: children)),
//       );
//
//       adaptiveValue(
//         ios: () {
//           expect(
//             find.byType(CupertinoSlidingSegmentedControl<int>),
//             findsOneWidget,
//           );
//           expect(find.byType(TabBar), findsNothing);
//           expect(find.byType(TabBarView), findsNothing);
//         },
//         android: () {
//           expect(find.byType(TabBar), findsOneWidget);
//           expect(find.byType(TabBarView), findsOneWidget);
//           expect(
//             find.byType(CupertinoSlidingSegmentedControl<int>),
//             findsNothing,
//           );
//         },
//       );
//     },
//   );
//
//   testWidgets(
//     'AdaptiveTabView updates currentIndex correctly on tab selection',
//     (tester) async {
//       await tester.runAsync(
//         () async {
//           int currentIndex = 0;
//
//           await tester.pumpWidget(
//             wrapApp(
//               child: StatefulBuilder(
//                 builder: (context, setState) {
//                   return AdaptiveTabView(
//                     currentIndex: currentIndex,
//                     onChanged: (value) => setState(() => currentIndex = value),
//                     tabs: tabs,
//                     children: children,
//                   );
//                 },
//               ),
//             ),
//           );
//
//           final tabViewFinder = find.byType(AdaptiveTabView);
//
//           final findItems = tester.widget<AdaptiveTabView>(tabViewFinder).tabs;
//
//           // Initial state check (currentIndex is 0).
//           expect(tester.widget<AdaptiveTabView>(tabViewFinder).currentIndex, 0);
//
//           // Simulate a tap on the last item's label.
//           await tester.tap(find.byWidget(findItems.last.label));
//           await tester.pumpAndSettle();
//
//           // Check if currentIndex is updated to the last item's index (6).
//           expect(currentIndex, findItems.length - 1);
//
//           // Simulate a tap on the first item's label.
//           await tester.tap(find.byWidget(findItems.first.label));
//           await tester.pumpAndSettle();
//
//           // Check if currentIndex is updated back to the first item's index (0).
//           expect(currentIndex, 0);
//         },
//       );
//     },
//   );
// }
