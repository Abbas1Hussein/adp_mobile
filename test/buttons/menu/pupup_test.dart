import 'dart:math';

import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile/src/components/buttons/menu/popup/platforms/ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../wrap_app.dart';

void main() {
  initializeMobileDefaultsTests();

  final List<String> foodItems = [
    'Pizza',
    'Burger',
    'Salad',
    'Sushi',
    'Tacos',
    'Pasta',
    'Chicken Curry',
    'Ice Cream',
    'Steak',
    'Fried Rice',
    'Pancakes',
    'Shrimp Scampi',
    'Lobster',
    'Caesar Salad',
    'Chocolate Cake',
    'Grilled Cheese Sandwich',
    'Hot Dog',
  ];

  final randomNumber = Random().nextInt(foodItems.length);

  testWidgets(
    'AdaptivePopupMenuButton Render correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptivePopupMenuButton<String>(
            items: const [],
            onChanged: (value) {},
          ),
        ),
      );

      await tester.pumpAndSettle();
      adaptiveValue(
        iOS: () {
          expect(find.byType(PopupMenuIOS<String>), findsOneWidget);
          expect(find.byType(DropdownButton<String>), findsNothing);
        },
        android: () {
          expect(find.byType(DropdownButton<String>), findsOneWidget);
          expect(find.byType(PopupMenuIOS<String>), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptivePopupMenuButton displays correctly items',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptivePopupMenuButton<String>(
            value: foodItems[randomNumber],
            onChanged: (value) {},
            items: foodItems.map((food) {
              return AdaptivePopupMenuItem<String>(
                child: Text(food),
                value: food,
              );
            }).toList(),
          ),
        ),
      );

      await tester.tap(find.byType(AdaptivePopupMenuButton<String>));
      await tester.pumpAndSettle();

      final items = tester
          .widget<AdaptivePopupMenuButton<String>>(
            find.byType(AdaptivePopupMenuButton<String>),
          )
          .items;
      expect(items, isNotEmpty);
    },
  );

  testWidgets(
    'AdaptivePopupMenuItem value should only appear in one menu item',
    (WidgetTester tester) async {
      final List<AdaptivePopupMenuItem<String>> nonUniqueItems = [
        const AdaptivePopupMenuItem<String>(
            child: Text('Item 1'), value: 'value1'),
        const AdaptivePopupMenuItem<String>(
          child: Text('Item 2'),
          value: 'value1',
        ),
      ]; // Duplicate value

      // Act
      final button = AdaptivePopupMenuButton<String>(
        value: 'value1',
        items: nonUniqueItems,
      );

      // Assert
      expect(
        () => button.validateSelectedItem(),
        throwsA(isA<AssertionError>()),
      );
    },
  );
}
