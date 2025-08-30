import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/services/storage_service.dart';

Future<void> initializeHiveForTesting() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  // Initialize storage service with test path
  await StorageService().init(testPath: 'test');

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ListModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TodoItemAdapter());
  }
}
