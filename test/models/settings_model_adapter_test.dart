import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:pandoo/models/settings_model.dart';

class _MockBinaryReader extends Mock implements BinaryReader {
  @override
  int readByte() =>
      super.noSuchMethod(Invocation.method(#readByte, []), returnValue: 0)
          as int;
}

void main() {
  test('SettingsAdapter defaults missing FAB animation to true', () {
    final reader = _MockBinaryReader();
    when(reader.readByte()).thenReturnInOrder([2, 0, 1]);
    when(reader.read()).thenReturnInOrder([null, ThemeMode.dark]);

    final settings = SettingsAdapter().read(reader);

    expect(settings.theme, ThemeMode.dark);
    expect(settings.fabAnimation, isTrue);
  });
}
