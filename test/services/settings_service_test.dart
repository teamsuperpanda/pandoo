import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';
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
      expect(settingsService.getFabAnimation(), isTrue);
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

    test('persists FAB animation across a Hive restart', () async {
      await settingsService.setFabAnimation(false);
      await Hive.box<Settings>('settings_db').close();

      final restartedService = SettingsService();
      await restartedService.init();

      expect(restartedService.getFabAnimation(), isFalse);
    });

    test('concurrent setters preserve every setting', () async {
      await Future.wait([
        settingsService.setThemeMode(ThemeMode.dark),
        settingsService.setLocale(const Locale('de', 'DE')),
        settingsService.setFabAnimation(false),
      ]);

      expect(settingsService.getThemeMode(), ThemeMode.dark);
      expect(settingsService.getLocale(), const Locale('de', 'DE'));
      expect(settingsService.getFabAnimation(), isFalse);

      final stored = Hive.box<Settings>('settings_db').get('app_settings');
      expect(stored?.theme, ThemeMode.dark);
      expect(stored?.locale, const Locale('de', 'DE'));
      expect(stored?.fabAnimation, isFalse);
    });

    test('a failed mutation does not poison the queue', () async {
      final box = _FailOnceSettingsBox(
        Settings(
          locale: const Locale('en', 'AU'),
          theme: ThemeMode.light,
          fabAnimation: false,
        ),
      );
      SettingsService.setTestInstance(box);
      settingsService = SettingsService();

      await expectLater(
        settingsService.setThemeMode(ThemeMode.dark),
        throwsStateError,
      );
      await settingsService.setLocale(const Locale('fr', 'FR'));

      expect(box.stored.theme, ThemeMode.light);
      expect(box.stored.locale, const Locale('fr', 'FR'));
      expect(box.stored.fabAnimation, isFalse);
      expect(settingsService.getThemeMode(), ThemeMode.light);
      expect(settingsService.getLocale(), const Locale('fr', 'FR'));
    });
  });
}

class _FailOnceSettingsBox extends Mock implements Box<Settings> {
  _FailOnceSettingsBox(this.stored);

  Settings stored;
  bool _failNextPut = true;

  @override
  Settings? get(dynamic key, {Settings? defaultValue}) => stored;

  @override
  Future<void> put(dynamic key, Settings value) async {
    if (_failNextPut) {
      _failNextPut = false;
      throw StateError('Simulated settings write failure');
    }
    stored = value;
  }
}
