import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:pandoo/models/settings_model.dart';

void main() {
  group('Settings', () {
    test('creates settings with default values', () {
      final settings = Settings();

      expect(settings.locale, isNull);
      expect(settings.theme, equals(ThemeMode.system));
    });
  });
}
