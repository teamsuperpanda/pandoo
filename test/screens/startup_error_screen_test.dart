import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/screens/startup_error_screen.dart';

import '../helpers/widget_wrapper.dart';

void main() {
  testWidgets('shows the diagnostics and recovery actions', (tester) async {
    await tester.pumpWidget(
      wrapWithMaterialApp(
        StartupErrorScreen(
          diagnostics: 'Error: corrupt box',
          onRetry: () async => null,
          onReset: () async {},
        ),
      ),
    );

    expect(find.text('Local storage could not be opened'), findsOneWidget);
    expect(find.text('Error: corrupt box'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
    expect(find.text('Copy diagnostics'), findsOneWidget);
    expect(find.text('Reset local data'), findsOneWidget);
  });

  testWidgets('retry shows the new diagnostics on failure', (tester) async {
    var calls = 0;
    await tester.pumpWidget(
      wrapWithMaterialApp(
        StartupErrorScreen(
          diagnostics: 'first error',
          onRetry: () async {
            calls++;
            return 'second error';
          },
          onReset: () async {},
        ),
      ),
    );

    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(calls, 1);
    expect(find.text('second error'), findsOneWidget);
  });

  testWidgets('reset requires confirmation before deleting data', (
    tester,
  ) async {
    var resets = 0;
    await tester.pumpWidget(
      wrapWithMaterialApp(
        StartupErrorScreen(
          diagnostics: 'error',
          onRetry: () async => null,
          onReset: () async {
            resets++;
          },
        ),
      ),
    );

    await tester.tap(find.text('Reset local data'));
    await tester.pumpAndSettle();

    expect(find.text('Reset local data?'), findsOneWidget);
    expect(resets, 0);

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(resets, 0);

    await tester.tap(find.text('Reset local data'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Reset local data'));
    await tester.pumpAndSettle();

    expect(resets, 1);
  });
}
