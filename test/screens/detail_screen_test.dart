import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/screens/detail.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/services/umami_service.dart';

import '../helpers/widget_wrapper.dart';
import '../widgets/helpers/mock_box.dart';

void main() {
  group('DetailScreen Widget', () {
    late MockBox mockBox;
    late UmamiService umamiService;

    setUp(() {
      mockBox = MockBox();
      StorageService.setTestInstance(mockBox);
      umamiService = UmamiService(
        websiteId: 'test',
        endpoint: 'https://example.com',
      );
    });

    testWidgets('renders list title in app bar', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0),
      );

      await tester.pumpWidget(wrapWithMaterialApp(
        DetailScreen(
          listTitle: 'Shopping',
          umamiService: umamiService,
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Shopping'), findsOneWidget);
    });

    testWidgets('shows back button', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0),
      );

      await tester.pumpWidget(wrapWithMaterialApp(
        DetailScreen(
          listTitle: 'Shopping',
          umamiService: umamiService,
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('renders todo items', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0, items: [
          TodoItem(text: 'Milk'),
          TodoItem(text: 'Bread'),
        ]),
      );

      await tester.pumpWidget(wrapWithMaterialApp(
        DetailScreen(
          listTitle: 'Shopping',
          umamiService: umamiService,
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Milk'), findsOneWidget);
      expect(find.text('Bread'), findsOneWidget);
    });

    testWidgets('renders add item widget', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0),
      );

      await tester.pumpWidget(wrapWithMaterialApp(
        DetailScreen(
          listTitle: 'Shopping',
          umamiService: umamiService,
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('shows cleanup button when completed items exist',
        (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0, items: [
          TodoItem(text: 'Milk', isCompleted: true),
          TodoItem(text: 'Bread'),
        ]),
      );

      await tester.pumpWidget(wrapWithMaterialApp(
        DetailScreen(
          listTitle: 'Shopping',
          umamiService: umamiService,
        ),
      ));
      await tester.pumpAndSettle();

      expect(
        find.byIcon(Icons.cleaning_services_rounded),
        findsOneWidget,
      );
    });
  });
}
