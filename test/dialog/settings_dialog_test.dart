import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/dialog/settings.dart';
import 'package:pandoo/models/locale_adapter.dart';
import 'package:pandoo/models/settings_model.dart';
import 'package:pandoo/models/theme_mode_adapter.dart';
import 'package:pandoo/services/settings_service.dart';

import '../helpers/test_helpers.dart';
import '../helpers/widget_wrapper.dart';

void main() {
  group('SettingsDialog', () {
    setUpAll(() async {
      await initializeHiveForTesting();
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(SettingsAdapter());
      }
      if (!Hive.isAdapterRegistered(100)) {
        Hive.registerAdapter(ThemeModeAdapter());
      }
      if (!Hive.isAdapterRegistered(101)) {
        Hive.registerAdapter(LocaleAdapter());
      }
    });

    setUp(() async {
      if (Hive.isBoxOpen('settings_db')) {
        await Hive.box<Settings>('settings_db').close();
      }
      await Hive.deleteBoxFromDisk('settings_db');
      final box = await Hive.openBox<Settings>('settings_db');
      SettingsService.setTestInstance(box);
    });

    tearDownAll(() async {
      await Hive.close();
    });

    testWidgets('renders theme and language sections', (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(const SettingsDialog()));
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
                builder: (context) => const SettingsDialog(),
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

    // Note: widget tests for dropdown/switch persistence are not feasible in
    // testWidgets because Hive's I/O is incompatible with the fakeAsync zone.
    // Those persistence paths are covered in test/services/settings_service_test.dart.
  });
}
