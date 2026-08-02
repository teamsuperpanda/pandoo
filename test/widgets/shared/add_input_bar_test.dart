import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/widgets/shared/add_input_bar.dart';

import '../../helpers/widget_wrapper.dart';

Future<void> _noop(String text) async {}

void main() {
  group('AddInputBar Widget', () {
    testWidgets('renders hint text and add button', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          const AddInputBar(hintText: 'Add new item', onSubmit: _noop),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Add new item'), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('submits text when add button is pressed', (tester) async {
      String? submitted;
      await tester.pumpWidget(
        wrapWithMaterialApp(
          AddInputBar(
            hintText: 'Add new item',
            onSubmit: (text) async {
              submitted = text;
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test item');
      await tester.tap(find.byType(IconButton));
      await tester.pump();

      expect(submitted, equals('test item'));
    });

    testWidgets('submits text when enter is pressed on keyboard', (
      tester,
    ) async {
      String? submitted;
      await tester.pumpWidget(
        wrapWithMaterialApp(
          AddInputBar(
            hintText: 'Add new item',
            onSubmit: (text) async {
              submitted = text;
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'keyboard item');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(submitted, equals('keyboard item'));
    });

    testWidgets('does not submit when text is empty', (tester) async {
      var wasCalled = false;
      await tester.pumpWidget(
        wrapWithMaterialApp(
          AddInputBar(
            hintText: 'Add new item',
            onSubmit: (_) async {
              wasCalled = true;
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(IconButton));
      await tester.pump();

      expect(wasCalled, isFalse);
    });

    testWidgets('clears the text field after submit', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          const AddInputBar(hintText: 'Add new item', onSubmit: _noop),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test item');
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(
        tester.widget<TextField>(find.byType(TextField)).controller!.text,
        isEmpty,
      );
    });

    testWidgets('does not touch its controller after disposal', (tester) async {
      final submitted = Completer<void>();
      await tester.pumpWidget(
        wrapWithMaterialApp(
          AddInputBar(
            hintText: 'Add new item',
            onSubmit: (_) => submitted.future,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test item');
      await tester.tap(find.byType(IconButton));
      await tester.pumpWidget(const SizedBox());

      submitted.complete();
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  });
}
