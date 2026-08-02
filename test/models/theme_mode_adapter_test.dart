import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:pandoo/models/theme_mode_adapter.dart';

class _MockBinaryReader extends Mock implements BinaryReader {
  @override
  int readByte() =>
      super.noSuchMethod(Invocation.method(#readByte, []), returnValue: 0)
          as int;
}

void main() {
  group('ThemeModeAdapter', () {
    test('reads a valid theme index', () {
      final reader = _MockBinaryReader();
      when(reader.readByte()).thenReturn(ThemeMode.dark.index);

      expect(ThemeModeAdapter().read(reader), ThemeMode.dark);
    });

    test('falls back to system for an invalid theme index', () {
      final reader = _MockBinaryReader();
      when(reader.readByte()).thenReturn(ThemeMode.values.length);

      expect(ThemeModeAdapter().read(reader), ThemeMode.system);
    });
  });
}
