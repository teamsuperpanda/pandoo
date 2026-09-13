import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/services/storage_service.dart';

/// Initializes Hive in a unique temporary directory for the calling test file.
///
/// `flutter test` runs test files concurrently in separate isolates, so a
/// shared path makes box lock files collide. Each isolate gets its own
/// directory instead. The returned directory should be deleted in
/// `tearDownAll` after `Hive.close()`.
Future<Directory> initializeHiveForTesting() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final hiveDir = Directory.systemTemp.createTempSync('pandoo_hive_test_');
  try {
    await StorageService().init(testPath: hiveDir.path);
  } on Object {
    hiveDir.deleteSync(recursive: true);
    rethrow;
  }

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ListModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TodoItemAdapter());
  }

  return hiveDir;
}
