import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/services/schema_migration.dart';
import 'package:pandoo/services/storage_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  Directory? hiveDir;

  setUpAll(() async {
    hiveDir = await initializeHiveForTesting();
  });

  tearDownAll(() async {
    await Hive.close();
    hiveDir?.deleteSync(recursive: true);
  });

  test('writes the current schema version at init', () {
    expect(StorageService().schemaVersion, currentSchemaVersion);
  });

  test('re-opening keeps the schema version', () async {
    await StorageService().close();
    await StorageService().init(testPath: hiveDir!.path);
    expect(StorageService().schemaVersion, currentSchemaVersion);
  });
}
