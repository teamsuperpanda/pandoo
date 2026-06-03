import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/dialog/delete_list_dialog.dart';

import '../helpers/widget_wrapper.dart';

void main() {
  group('DeleteListDialog', () {
    testWidgets('renders dialog with list title', (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(
        const DeleteListDialog(listTitle: 'Test List'),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Delete List'), findsOneWidget);
      expect(
        find.text('Are you sure you want to delete "Test List"?'),
        findsOneWidget,
      );
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('returns true when delete is pressed', (tester) async {
      bool? result;
      await tester.pumpWidget(wrapWithMaterialApp(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              result = await showDialog<bool>(
                context: context,
                builder: (context) =>
                    const DeleteListDialog(listTitle: 'Test List'),
              );
            },
            child: const Text('Open'),
          ),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(result, isTrue);
    });

    testWidgets('returns false when cancel is pressed', (tester) async {
      bool? result;
      await tester.pumpWidget(wrapWithMaterialApp(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              result = await showDialog<bool>(
                context: context,
                builder: (context) =>
                    const DeleteListDialog(listTitle: 'Test List'),
              );
            },
            child: const Text('Open'),
          ),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(result, isFalse);
    });
  });
}
