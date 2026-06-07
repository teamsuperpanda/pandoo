import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/dialog/list_name_dialog.dart';
import 'package:pandoo/l10n/l10n.dart';

import '../helpers/widget_wrapper.dart';

void main() {
  group('ListNameDialog', () {
    testWidgets('renders text field and action buttons', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          const Material(child: _DialogOpener()),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('returns list name when submitted', (tester) async {
      String? result;
      await tester.pumpWidget(
        wrapWithMaterialApp(
          Material(
            child: Builder(
              builder: (context) => FloatingActionButton(
                onPressed: () async {
                  result = await showDialog<String>(
                    context: context,
                    builder: (ctx) => ListNameDialog(
                      title: ctx.l10n.addNewList,
                      buttonLabel: ctx.l10n.addNewList,
                    ),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), 'My List');
      await tester.tap(find.byType(FilledButton));
      await tester.pumpAndSettle();

      expect(result, equals('My List'));
    });

    testWidgets('returns null when cancelled', (tester) async {
      String? result;
      await tester.pumpWidget(
        wrapWithMaterialApp(
          Material(
            child: Builder(
              builder: (context) => FloatingActionButton(
                onPressed: () async {
                  result = await showDialog<String>(
                    context: context,
                    builder: (ctx) => ListNameDialog(
                      title: ctx.l10n.addNewList,
                      buttonLabel: ctx.l10n.addNewList,
                    ),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(result, isNull);
    });

    testWidgets('shows validation error for empty name', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          const Material(child: _DialogOpener()),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FilledButton));
      await tester.pumpAndSettle();

      expect(find.text('Name cannot be empty'), findsOneWidget);
    });
  });
}

class _DialogOpener extends StatelessWidget {
  const _DialogOpener();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (ctx) => ListNameDialog(
          title: ctx.l10n.addNewList,
          buttonLabel: ctx.l10n.addNewList,
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}
