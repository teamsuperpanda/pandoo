import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/models/settings_model.dart';
import 'package:pandoo/services/settings_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SettingsService', () {
    late SettingsService settingsService;

    setUpAll(() async {
      await initializeHiveForTesting();
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(SettingsAdapter());
      }
      if (Hive.isBoxOpen('settings_db')) {
        await Hive.box<Settings>('settings_db').close();
      }
    });

    setUp(() async {
      await Hive.deleteBoxFromDisk('settings_db');
      settingsService = SettingsService();
      await settingsService.init();
    });

    tearDownAll(() async {
      await Hive.close();
    });

    test('initializes with default settings', () {
      expect(settingsService.getThemeMode(), equals(ThemeMode.system));
      expect(settingsService.getLocale(), isNull);
    });

    test('can set and get theme mode', () async {
      await settingsService.setThemeMode(ThemeMode.dark);
      expect(settingsService.getThemeMode(), equals(ThemeMode.dark));

      await settingsService.setThemeMode(ThemeMode.light);
      expect(settingsService.getThemeMode(), equals(ThemeMode.light));
    });

    test('can set and get locale', () async {
      const locale = Locale('es', 'ES');
      await settingsService.setLocale(locale);
      expect(settingsService.getLocale(), equals(locale));

      await settingsService.setLocale(null);
      expect(settingsService.getLocale(), isNull);
    });

    test('persists settings across instances', () async {
      // Set some settings
      await settingsService.setThemeMode(ThemeMode.dark);
      await settingsService.setLocale(const Locale('fr', 'FR'));

      // Create new instance (simulating app restart)
      final newService = SettingsService();
      await newService.init();

      expect(newService.getThemeMode(), equals(ThemeMode.dark));
      expect(newService.getLocale(), equals(const Locale('fr', 'FR')));
    });
  });
}
