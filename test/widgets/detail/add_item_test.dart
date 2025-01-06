import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/widgets/detail/add_item.dart';

void main() {
  group('AddItem Widget', () {
    testWidgets('renders text field and add button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AddItem(
              onItemAdded: (_) async {},
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('calls onItemAdded when add button is pressed',
        (WidgetTester tester) async {
      // Arrange
      var itemAdded = '';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AddItem(
              onItemAdded: (String text) async {
                itemAdded = text;
              },
            ),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byType(TextField), 'New Item');
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Assert
      expect(itemAdded, 'New Item');
    });

    testWidgets('does not call onItemAdded when text is empty',
        (WidgetTester tester) async {
      // Arrange
      var itemAdded = '';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AddItem(
              onItemAdded: (String text) async {
                itemAdded = text;
              },
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Assert
      expect(itemAdded, '');
    });
  });
}
