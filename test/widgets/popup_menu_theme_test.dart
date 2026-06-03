import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/core/theme/app_theme.dart';

void main() {
  for (final entry in [
    ('light', AppTheme.light),
    ('dark', AppTheme.dark),
  ]) {
    final themeName = entry.$1;
    final themeFactory = entry.$2;

    testWidgets(
      'Popup menu background uses theme popupMenuTheme color ($themeName)',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: themeFactory(),
            home: Scaffold(
              body: Center(
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'pin', child: Text('Pin')),
                  ],
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.byIcon(Icons.more_vert));
        await tester.pumpAndSettle();

        final popupMaterial = tester.widget<Material>(
          find
              .ancestor(of: find.text('Pin'), matching: find.byType(Material))
              .first,
        );

        expect(popupMaterial.color, themeFactory().popupMenuTheme.color);
      },
    );
  }
}
