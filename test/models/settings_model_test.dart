import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/models/settings_model.dart';

void main() {
  group('Settings', () {
    test('creates settings with default values', () {
      final settings = Settings();

      expect(settings.locale, isNull);
      expect(settings.theme, equals(ThemeMode.system));
      expect(settings.analyticsEnabled, isFalse);
    });

    test('settings can be created with custom values', () {
      final settings = Settings(
        locale: const Locale('fr'),
        theme: ThemeMode.dark,
        analyticsEnabled: true,
      );

      expect(settings.locale, equals(const Locale('fr')));
      expect(settings.theme, equals(ThemeMode.dark));
      expect(settings.analyticsEnabled, isTrue);
    });
  });
}
