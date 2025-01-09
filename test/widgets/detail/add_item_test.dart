import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/widgets/detail/add_item.dart';
import '../../helpers/widget_wrapper.dart';

void main() {
  group('AddItem Widget', () {
    testWidgets('renders text field and add button', (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(
        AddItem(onItemAdded: (_) async {}),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('calls onItemAdded when add button is pressed', (tester) async {
      String? addedText;
      await tester.pumpWidget(wrapWithMaterialApp(
        AddItem(onItemAdded: (text) async {
          addedText = text;
        }),
      ));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test item');
      await tester.tap(find.byType(IconButton));
      await tester.pump();

      expect(addedText, equals('test item'));
    });

    testWidgets('does not call onItemAdded when text is empty', (tester) async {
      bool wasCalled = false;
      await tester.pumpWidget(wrapWithMaterialApp(
        AddItem(onItemAdded: (_) async {
          wasCalled = true;
        }),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(IconButton));
      await tester.pump();

      expect(wasCalled, isFalse);
    });
  });
}
