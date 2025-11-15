import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/core/theme/app_theme.dart';

void main() {
  testWidgets('Popup menu background uses theme popupMenuTheme color (light)',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: Scaffold(
          body: Center(
            child: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(value: 'pin', child: Text('Pin')),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();

    // The PopupMenu is rendered as a Material; find the Material that is an
    // ancestor of the PopupMenuItem and inspect its color.
    final popupMaterial = tester.widget<Material>(
      find.ancestor(
          of: find.text('Pin'), matching: find.byType(Material)).first,
    );

    expect(popupMaterial.color, AppTheme.light().popupMenuTheme.color);
  });

  testWidgets('Popup menu background uses theme popupMenuTheme color (dark)',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark(),
        home: Scaffold(
          body: Center(
            child: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(value: 'pin', child: Text('Pin')),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();

    final popupMaterial = tester.widget<Material>(
      find.ancestor(
          of: find.text('Pin'), matching: find.byType(Material)).first,
    );

    expect(popupMaterial.color, AppTheme.dark().popupMenuTheme.color);
  });
}
