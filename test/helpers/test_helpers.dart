import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/models/list_model.dart';

Future<void> initializeHiveForTesting() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  Hive.init('');

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ListModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TodoItemAdapter());
  }
}
