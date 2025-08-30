import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/widgets/lists/add_list.dart';
import '../../helpers/widget_wrapper.dart';
import '../../widgets/helpers/mock_box.dart';
import 'package:pandoo/services/storage_service.dart';

void main() {
  group('AddList Widget', () {
    late MockBox mockBox;

    setUp(() {
      mockBox = MockBox();
      StorageService.setTestInstance(mockBox);
    });

    testWidgets('renders text field and add button', (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(
        AddList(onListAdded: () {}),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('adds list when text is entered and button pressed', (tester) async {
      bool onListAddedCalled = false;
      
      await tester.pumpWidget(wrapWithMaterialApp(
        AddList(onListAdded: () {
          onListAddedCalled = true;
        }),
      ));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'New List');
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(onListAddedCalled, isTrue);
      expect(mockBox.containsKey('New List'), isTrue);
    });

    testWidgets('does not add list when text is empty', (tester) async {
      bool onListAddedCalled = false;
      
      await tester.pumpWidget(wrapWithMaterialApp(
        AddList(onListAdded: () {
          onListAddedCalled = true;
        }),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(IconButton));
      await tester.pump();

      expect(onListAddedCalled, isFalse);
      expect(mockBox.length, equals(0));
    });

    testWidgets('clears text field after successful add', (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(
        AddList(onListAdded: () {}),
      ));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Test List');
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.text('Test List'), findsNothing);
    });

    testWidgets('shows error snackbar for duplicate list name', (tester) async {
      // Add a list first
      await mockBox.put('Existing List', MockBox.createMockList('Existing List', 0));
      
      await tester.pumpWidget(wrapWithMaterialApp(
        Scaffold(
          body: AddList(onListAdded: () {}),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Existing List');
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
