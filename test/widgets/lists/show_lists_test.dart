import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/widgets/lists/show_lists.dart';

import '../../helpers/widget_wrapper.dart';
import '../helpers/mock_box.dart';

void main() {
  group('ShowLists Widget', () {
    late MockBox mockBox;

    setUp(() {
      mockBox = MockBox();
      StorageService.setTestInstance(mockBox);
    });

    testWidgets('renders empty list when no lists exist', (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(const ShowLists()));
      await tester.pumpAndSettle();

      expect(find.byType(ReorderableListView), findsOneWidget);
    });

    testWidgets('renders list cards when lists exist', (tester) async {
      await mockBox.put('Shopping', MockBox.createMockList('Shopping', 0));
      await mockBox.put('Work', MockBox.createMockList('Work', 1));

      await tester.pumpWidget(wrapWithMaterialApp(const ShowLists()));
      await tester.pumpAndSettle();

      expect(find.text('Shopping'), findsOneWidget);
      expect(find.text('Work'), findsOneWidget);
    });

    testWidgets('shows item count for each list', (tester) async {
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

      await tester.pumpWidget(wrapWithMaterialApp(const ShowLists()));
      await tester.pumpAndSettle();

      expect(find.text('2 items'), findsOneWidget);
    });

    testWidgets('rejects a drag across the pinned boundary with feedback', (
      tester,
    ) async {
      await mockBox.put(
        'Pinned',
        MockBox.createMockList('Pinned', 0, pinned: true),
      );
      await mockBox.put('One', MockBox.createMockList('One', 0));
      await mockBox.put('Two', MockBox.createMockList('Two', 1));

      await tester.pumpWidget(
        wrapWithMaterialApp(const Scaffold(body: ShowLists())),
      );
      await tester.pumpAndSettle();

      final list = tester.widget<ReorderableListView>(
        find.byType(ReorderableListView),
      );

      // Unpinned dropped into the pinned section.
      list.onReorderItem!(2, 0);
      await tester.pumpAndSettle();
      expect(
        find.text(
          'Pinned lists stay at the top. Use the menu to pin or unpin.',
        ),
        findsOneWidget,
      );

      // Pinned dragged down into the unpinned section.
      list.onReorderItem!(0, 2);
      await tester.pumpAndSettle();
      expect(
        find.text(
          'Pinned lists stay at the top. Use the menu to pin or unpin.',
        ),
        findsOneWidget,
      );

      expect(StorageService().getAllLists().map((l) => l.name), [
        'Pinned',
        'One',
        'Two',
      ]);
    });
  });
}
