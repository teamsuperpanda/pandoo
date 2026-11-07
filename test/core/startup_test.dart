import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:pandoo/core/startup.dart';
import 'package:pandoo/services/storage_service.dart';

void main() {
  test('returns null when both steps succeed', () async {
    expect(
      await runStartup(storageInit: () async {}, settingsInit: () async {}),
      isNull,
    );
  });

  test('returns diagnostics when storage fails', () async {
    final error = await runStartup(
      storageInit: () async => throw StateError('storage boom'),
      settingsInit: () async {},
    );

    expect(error, isNotNull);
    expect(error, contains('storage boom'));
  });

  test('returns diagnostics when settings fails', () async {
    final error = await runStartup(
      storageInit: () async {},
      settingsInit: () async => throw StateError('settings boom'),
    );

    expect(error, isNotNull);
    expect(error, contains('settings boom'));
  });

  test('a failing box open is reported instead of thrown', () async {
    final dir = Directory.systemTemp.createTempSync('pandoo_startup_test_');
    addTearDown(() {
      dir.deleteSync(recursive: true);
    });

    final error = await runStartup(
      storageInit: () => StorageService().init(
        testPath: dir.path,
        failOpen: () async => throw HiveError('corrupt box'),
      ),
      settingsInit: () async {},
    );

    expect(error, isNotNull);
    expect(error, contains('corrupt box'));
  });
}
