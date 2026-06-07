import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/services/umami_service.dart';
import 'package:pandoo/widgets/lists/show_lists.dart';

import '../../helpers/widget_wrapper.dart';
import '../../widgets/helpers/mock_box.dart';

void main() {
  group('ShowLists Widget', () {
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

    testWidgets('renders empty list when no lists exist', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          ShowLists(umamiService: umamiService),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ReorderableListView), findsOneWidget);
    });

    testWidgets('renders list cards when lists exist', (tester) async {
      await mockBox.put(
        'Shopping',
        MockBox.createMockList('Shopping', 0),
      );
      await mockBox.put(
        'Work',
        MockBox.createMockList('Work', 1),
      );

      await tester.pumpWidget(
        wrapWithMaterialApp(
          ShowLists(umamiService: umamiService),
        ),
      );
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

      await tester.pumpWidget(
        wrapWithMaterialApp(
          ShowLists(umamiService: umamiService),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('2 items'), findsOneWidget);
    });
  });
}
