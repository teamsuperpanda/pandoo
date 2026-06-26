import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/screens/detail.dart';
import 'package:pandoo/services/storage_service.dart';

import '../helpers/widget_wrapper.dart';
import '../widgets/helpers/mock_box.dart';

void main() {
  group('DetailScreen Widget', () {
    late MockBox mockBox;

    setUp(() {
      mockBox = MockBox();
      StorageService.setTestInstance(mockBox);
    });

    testWidgets('renders list title in app bar', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0),
      );

      await tester.pumpWidget(
        wrapWithMaterialApp(
          const DetailScreen(
            listTitle: 'Shopping',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Shopping'), findsOneWidget);
    });

    testWidgets('shows back button', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0),
      );

      await tester.pumpWidget(
        wrapWithMaterialApp(
          const DetailScreen(
            listTitle: 'Shopping',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('renders todo items', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList(
          'Shopping',
          0,
          items: [
            TodoItem(text: 'Milk'),
            TodoItem(text: 'Bread'),
          ],
        ),
      );

      await tester.pumpWidget(
        wrapWithMaterialApp(
          const DetailScreen(
            listTitle: 'Shopping',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Milk'), findsOneWidget);
      expect(find.text('Bread'), findsOneWidget);
    });

    testWidgets('renders add item widget', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0),
      );

      await tester.pumpWidget(
        wrapWithMaterialApp(
          const DetailScreen(
            listTitle: 'Shopping',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('shows cleanup button when completed items exist', (
      tester,
    ) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList(
          'Shopping',
          0,
          items: [
            TodoItem(text: 'Milk', isCompleted: true),
            TodoItem(text: 'Bread'),
          ],
        ),
      );

      await tester.pumpWidget(
        wrapWithMaterialApp(
          const DetailScreen(
            listTitle: 'Shopping',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.byIcon(Icons.cleaning_services_rounded),
        findsOneWidget,
      );
    });

    testWidgets('renders search field', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0),
      );

      await tester.pumpWidget(
        wrapWithMaterialApp(
          const DetailScreen(
            listTitle: 'Shopping',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('search filters todo items', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList(
          'Shopping',
          0,
          items: [
            TodoItem(text: 'Milk'),
            TodoItem(text: 'Bread'),
            TodoItem(text: 'Almond Milk'),
          ],
        ),
      );

      await tester.pumpWidget(
        wrapWithMaterialApp(
          const DetailScreen(
            listTitle: 'Shopping',
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('searchField')), 'Milk');
      await tester.pumpAndSettle();

      // Milk appears in both search field and list item
      expect(find.text('Milk'), findsNWidgets(2));
      expect(find.text('Almond Milk'), findsOneWidget);
      expect(find.text('Bread'), findsNothing);
    });

    testWidgets('search is case insensitive', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList(
          'Shopping',
          0,
          items: [
            TodoItem(text: 'Milk'),
            TodoItem(text: 'Bread'),
          ],
        ),
      );

      await tester.pumpWidget(
        wrapWithMaterialApp(
          const DetailScreen(
            listTitle: 'Shopping',
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('searchField')), 'milk');
      await tester.pumpAndSettle();

      expect(find.text('Milk'), findsOneWidget);
      expect(find.text('Bread'), findsNothing);
    });

    testWidgets('clearing search restores all items', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList(
          'Shopping',
          0,
          items: [
            TodoItem(text: 'Milk'),
            TodoItem(text: 'Bread'),
          ],
        ),
      );

      await tester.pumpWidget(
        wrapWithMaterialApp(
          const DetailScreen(
            listTitle: 'Shopping',
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('searchField')), 'Milk');
      await tester.pumpAndSettle();
      expect(find.text('Bread'), findsNothing);

      await tester.tap(find.byIcon(Icons.clear));
      await tester.pumpAndSettle();

      expect(find.text('Milk'), findsOneWidget);
      expect(find.text('Bread'), findsOneWidget);
    });
  });
}
