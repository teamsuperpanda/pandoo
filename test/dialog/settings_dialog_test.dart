import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/dialog/settings.dart';

import '../helpers/widget_wrapper.dart';

void main() {
  group('SettingsDialog', () {
    testWidgets('renders theme and language sections', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          SettingsDialog(
            onThemeChanged: (ThemeMode mode) {},
            currentThemeMode: ThemeMode.system,
            onLanguageChanged: (Locale? locale) {},
            currentLocale: null,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('Language'), findsOneWidget);
      expect(find.text('System'), findsAtLeast(1));
      expect(find.text('Animation'), findsAtLeast(1));
      expect(find.text('Close'), findsOneWidget);
    });

    testWidgets('close button pops dialog', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          Builder(
            builder: (context) => TextButton(
              onPressed: () => showDialog<void>(
                context: context,
                builder: (context) => SettingsDialog(
                  onThemeChanged: (ThemeMode mode) {},
                  currentThemeMode: ThemeMode.system,
                  onLanguageChanged: (Locale? locale) {},
                  currentLocale: null,
                ),
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Close'), findsOneWidget);

      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      expect(find.text('Close'), findsNothing);
    });
  });
}
