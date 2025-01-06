import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/widgets/lists/list_card.dart';
import 'package:pandoo/services/storage_service.dart';
import '../helpers/mock_box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/models/list_model.dart';
import 'dart:io';

void main() {
  late MockBox mockBox;
  late Directory tempDir;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp();
    Hive.init(tempDir.path);
    Hive.registerAdapter(ListModelAdapter());
    Hive.registerAdapter(TodoItemAdapter());
  });

  setUp(() async {
    mockBox = MockBox();
    StorageService.setTestInstance(mockBox);
    await StorageService().init(testPath: tempDir.path);
  });

  tearDown(() async {
    await StorageService().close();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  testWidgets('ListCard Widget renders correctly with given title',
      (WidgetTester tester) async {
    const title = 'Test List';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListCard(
            title: title,
            index: 0,
            onTap: () {},
            onDelete: () {},
            onRename: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text(title), findsOneWidget);
  });

  testWidgets('ListCard Widget calls onTap when tapped',
      (WidgetTester tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListCard(
            title: 'Test List',
            index: 0,
            onTap: () {
              tapped = true;
            },
            onDelete: () {},
            onRename: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byType(ListTile));
    await tester.pump();

    expect(tapped, isTrue);
  });
}
