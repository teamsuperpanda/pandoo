import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/widgets/lists/list_card.dart';

import '../../helpers/widget_wrapper.dart';
import '../helpers/mock_box.dart';

void main() {
  group('ListCard Widget', () {
    late MockBox mockBox;

    setUp(() {
      mockBox = MockBox();
      StorageService.setTestInstance(mockBox);
    });

    testWidgets('renders list title and item count', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          Material(
            child: ListCard(
              title: 'Shopping',
              itemCount: 1,
              onTap: () {},
              onDelete: () {},
              onRename: (String newName) {},
              index: 0,
              pinned: false,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Shopping'), findsOneWidget);
      expect(find.text('1 items'), findsOneWidget);
    });

    testWidgets('shows pin icon when pinned', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          Material(
            child: ListCard(
              title: 'Pinned List',
              itemCount: 0,
              onTap: () {},
              onDelete: () {},
              onRename: (String newName) {},
              index: 0,
              pinned: true,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.push_pin), findsOneWidget);
    });

    testWidgets('shows drag indicator for all lists', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          Material(
            child: ListCard(
              title: 'Unpinned List',
              itemCount: 0,
              onTap: () {},
              onDelete: () {},
              onRename: (String newName) {},
              index: 0,
              pinned: false,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.drag_indicator), findsOneWidget);
    });

    testWidgets('shows no drag indicator when pinned', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          Material(
            child: ListCard(
              title: 'Pinned List',
              itemCount: 0,
              onTap: () {},
              onDelete: () {},
              onRename: (String newName) {},
              index: 0,
              pinned: true,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.drag_indicator), findsNothing);
    });

    testWidgets('shows popup menu with pin and delete options', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          Material(
            child: ListCard(
              title: 'Test List',
              itemCount: 0,
              onTap: () {},
              onDelete: () {},
              onRename: (String newName) {},
              index: 0,
              pinned: false,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.text('Pin'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('renders title and item count for pinned lists', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          Material(
            child: ListCard(
              title: 'Pinned',
              itemCount: 1,
              onTap: () {},
              onDelete: () {},
              onRename: (String newName) {},
              index: 0,
              pinned: true,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Pinned'), findsOneWidget);
      expect(find.text('1 items'), findsOneWidget);
    });

    testWidgets('surfaces a pin failure from the swipe action', (tester) async {
      await mockBox.put('Shopping', MockBox.createMockList('Shopping', 0));
      mockBox.putError = StateError('write failed');
      await tester.pumpWidget(
        wrapWithMaterialApp(
          Scaffold(
            body: ListCard(
              title: 'Shopping',
              itemCount: 1,
              index: 0,
              pinned: false,
              onTap: () {},
              onDelete: () {},
              onRename: (_) {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final dismissible = tester.widget<Dismissible>(find.byType(Dismissible));
      final dismissed = await dismissible.confirmDismiss!(
        DismissDirection.startToEnd,
      );
      await tester.pumpAndSettle();

      expect(dismissed, isFalse);
      expect(find.text('Could not save'), findsOneWidget);
    });
  });
}
