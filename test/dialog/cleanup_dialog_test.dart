import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/dialog/cleanup_dialog.dart';

import '../helpers/widget_wrapper.dart';

void main() {
  group('CleanupDialog', () {
    testWidgets('renders dialog', (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(
        const CleanupDialog(),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Clean Completed Items'), findsOneWidget);
      expect(
        find.text('Remove all completed items from this list?'),
        findsOneWidget,
      );
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Clean'), findsOneWidget);
    });

    testWidgets('returns true when clean is pressed', (tester) async {
      bool? result;
      await tester.pumpWidget(wrapWithMaterialApp(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              result = await showDialog<bool>(
                context: context,
                builder: (context) => const CleanupDialog(),
              );
            },
            child: const Text('Open'),
          ),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Clean'));
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
                builder: (context) => const CleanupDialog(),
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
