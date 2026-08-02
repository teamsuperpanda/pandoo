import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/services/storage_service.dart';

import '../widgets/helpers/mock_box.dart';

void main() {
  late MockBox mockBox;
  late StorageService storage;

  setUp(() async {
    mockBox = MockBox();
    StorageService.setTestInstance(mockBox);
    storage = StorageService();
  });

  tearDown(() async {
    await storage.close();
  });

  test('Add list successfully', () async {
    final result = await storage.addList('Test List');
    expect(result, isTrue);
    expect(mockBox.get('Test List'), isNotNull);
  });

  test('Cannot add duplicate list', () async {
    await storage.addList('Test List');
    final result = await storage.addList('Test List');
    expect(result, isFalse);
  });

  test('Get all lists returns sorted lists', () async {
    await storage.addList('List 2');
    await storage.addList('List 1');
    await storage.addList('List 3');

    final lists = storage.getAllLists();
    expect(lists.length, equals(3));
    expect(lists.map((e) => e.order), equals([0, 1, 2]));
  });

  test('Pinned lists sorted alphabetically', () async {
    await storage.addList('B List');
    await storage.addList('A List');
    await storage.togglePin('A List');
    await storage.togglePin('B List');

    final lists = storage.getAllLists();
    expect(lists.length, equals(2));
    expect(lists[0].pinned, isTrue);
    expect(lists[1].pinned, isTrue);
    expect(lists[0].name, equals('A List'));
    expect(lists[1].name, equals('B List'));
  });

  test('Pinned lists come before unpinned', () async {
    await storage.addList('B');
    await storage.addList('A');
    await storage.togglePin('A');

    final lists = storage.getAllLists();
    expect(lists.length, equals(2));
    expect(lists[0].name, equals('A'));
    expect(lists[0].pinned, isTrue);
    expect(lists[1].name, equals('B'));
    expect(lists[1].pinned, isFalse);
  });

  test('Pinning a list normalizes order before adding another list', () async {
    await storage.addList('First');
    await storage.addList('Second');

    await storage.togglePin('First');
    await storage.addList('Third');

    final unpinned = storage.getAllLists().where((list) => !list.pinned);
    expect(unpinned.map((list) => list.name), ['Second', 'Third']);
    expect(unpinned.map((list) => list.order), [0, 1]);
  });

  test('Unpinning appends the list before adding another list', () async {
    await storage.addList('First');
    await storage.addList('Second');
    await storage.togglePin('First');

    await storage.togglePin('First');
    await storage.addList('Third');

    final unpinned = storage.getAllLists().where((list) => !list.pinned);
    expect(unpinned.map((list) => list.name), ['Second', 'First', 'Third']);
    expect(unpinned.map((list) => list.order), [0, 1, 2]);
  });

  test('Deleting with pinned lists normalizes only unpinned order', () async {
    await storage.addList('Delete');
    await storage.addList('Keep');
    await storage.addList('Pinned');
    await storage.togglePin('Pinned');

    await storage.deleteList('Delete');
    await storage.addList('Added');

    final lists = storage.getAllLists();
    expect(lists.first.name, 'Pinned');
    expect(lists.first.pinned, isTrue);
    expect(lists.first.order, 2);
    final unpinned = lists.where((list) => !list.pinned);
    expect(unpinned.map((list) => list.name), ['Keep', 'Added']);
    expect(unpinned.map((list) => list.order), [0, 1]);
  });

  test('Repeated pin changes keep unpinned ordering deterministic', () async {
    await storage.addList('First');
    await storage.addList('Second');
    await storage.addList('Third');

    await storage.togglePin('Second');
    await storage.togglePin('Second');
    await storage.togglePin('First');
    await storage.togglePin('First');

    final unpinned = storage.getAllLists().where((list) => !list.pinned);
    expect(unpinned.map((list) => list.name), ['Third', 'Second', 'First']);
    expect(unpinned.map((list) => list.order), [0, 1, 2]);
  });

  test('Pin batch failure leaves pinned state and orders unchanged', () async {
    await storage.addList('First');
    await storage.addList('Second');
    await storage.addList('Third');
    mockBox
      ..putError = StateError('batch failed')
      ..putErrorKey = 'Second';

    await expectLater(storage.togglePin('First'), throwsStateError);

    final lists = storage.getAllLists();
    expect(lists.map((list) => list.name), ['First', 'Second', 'Third']);
    expect(lists.map((list) => list.pinned), [isFalse, isFalse, isFalse]);
    expect(lists.map((list) => list.order), [0, 1, 2]);
  });

  test('Delete item from list removes only that item', () async {
    await storage.addList('Test');
    await storage.addItemToList('Test', 'Item 1');
    await storage.addItemToList('Test', 'Item 2');
    await storage.addItemToList('Test', 'Item 3');

    final list = storage.getList('Test')!;
    final itemToDelete = list.items[1];

    await storage.deleteItemFromList('Test', itemToDelete.id);

    final updated = storage.getList('Test')!;
    expect(updated.items.length, equals(2));
    expect(updated.items[0].text, equals('Item 1'));
    expect(updated.items[1].text, equals('Item 3'));
  });

  test('Delete item with missing id does nothing', () async {
    await storage.addList('Test');
    await storage.addItemToList('Test', 'Item 1');

    await storage.deleteItemFromList('Test', 'nonexistent');

    final updated = storage.getList('Test')!;
    expect(updated.items.length, equals(1));
  });

  test('Delete item from missing list does not throw', () async {
    await expectLater(
      storage.deleteItemFromList('NoSuchList', 'any-id'),
      completes,
    );
  });

  test('Rename trims and rejects empty names', () async {
    await storage.addList('Test');
    final result = await storage.renameList('Test', '  ');
    expect(result, isFalse);
    expect(storage.getList('Test'), isNotNull);
  });

  test('Rename to same trimmed name returns false', () async {
    await storage.addList('Test');
    final result = await storage.renameList('Test', 'Test');
    expect(result, isFalse);
  });

  test('Rename trims whitespace from new name', () async {
    await storage.addList('Old');
    final result = await storage.renameList('Old', '  New  ');
    expect(result, isTrue);
    expect(storage.getList('New'), isNotNull);
    expect(storage.getList('Old'), isNull);
  });

  test('Rename put failure retains the source list', () async {
    await storage.addList('Old');
    mockBox
      ..putError = StateError('put failed')
      ..putErrorKey = 'New';

    await expectLater(storage.renameList('Old', 'New'), throwsStateError);

    expect(storage.getList('Old'), isNotNull);
    expect(storage.getList('New'), isNull);
  });

  test('Rename delete failure rolls back copy and retains source', () async {
    await storage.addList('Old');
    mockBox
      ..deleteError = StateError('delete failed')
      ..deleteErrorKey = 'Old';

    await expectLater(storage.renameList('Old', 'New'), throwsStateError);

    expect(storage.getList('Old'), isNotNull);
    expect(storage.getList('New'), isNull);
  });
}
