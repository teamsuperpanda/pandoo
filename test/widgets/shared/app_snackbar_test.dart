import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/widgets/shared/app_snackbar.dart';

void main() {
  testWidgets('shows an error snackbar with title and message', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => showErrorSnackBar(
                context,
                title: 'Could not save',
                message: 'Try again.',
              ),
              child: const Text('show'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('show'));
    await tester.pump();

    expect(find.text('Could not save'), findsOneWidget);
    expect(find.text('Try again.'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('renders an action when provided', (tester) async {
    var undone = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => showAppSnackBar(
                context,
                title: 'Deleted',
                message: 'One item',
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () => undone = true,
                ),
              ),
              child: const Text('show'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('show'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Undo'));
    await tester.pump();

    expect(undone, isTrue);
  });
}
