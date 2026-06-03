import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/services/umami_service.dart';
import 'package:pandoo/widgets/lists/list_card.dart';

import '../../helpers/widget_wrapper.dart';
import '../../widgets/helpers/mock_box.dart';

void main() {
  group('ListCard Widget', () {
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

    testWidgets('renders list title and item count', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0, items: [
          TodoItem(text: 'Milk'),
        ]),
      );

      await tester.pumpWidget(wrapWithMaterialApp(
        Material(
          child: ListCard(
            title: 'Shopping',
            onTap: () {},
            onDelete: () {},
            onRename: (String newName) {},
            index: 0,
            pinned: false,
            umamiService: umamiService,
          ),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Shopping'), findsOneWidget);
      expect(find.text('1 items'), findsOneWidget);
    });

    testWidgets('shows pin icon when pinned', (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(
        Material(
          child: ListCard(
            title: 'Pinned List',
            onTap: () {},
            onDelete: () {},
            onRename: (String newName) {},
            index: 0,
            pinned: true,
            umamiService: umamiService,
          ),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.push_pin), findsOneWidget);
    });

    testWidgets('shows drag indicator when not pinned', (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(
        Material(
          child: ListCard(
            title: 'Unpinned List',
            onTap: () {},
            onDelete: () {},
            onRename: (String newName) {},
            index: 0,
            pinned: false,
            umamiService: umamiService,
          ),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.drag_indicator), findsOneWidget);
    });

    testWidgets('shows popup menu with pin and delete options',
        (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(
        Material(
          child: ListCard(
            title: 'Test List',
            onTap: () {},
            onDelete: () {},
            onRename: (String newName) {},
            index: 0,
            pinned: false,
            umamiService: umamiService,
          ),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.text('Pin'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped on card body', (tester) async {
      var tapped = false;

      await tester.pumpWidget(wrapWithMaterialApp(
        Material(
          child: ListCard(
            title: 'Test List',
            onTap: () {
              tapped = true;
            },
            onDelete: () {},
            onRename: (String newName) {},
            index: 0,
            pinned: false,
            umamiService: umamiService,
          ),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.drag_indicator));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });
  });
}
