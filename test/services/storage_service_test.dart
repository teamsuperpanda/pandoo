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

}
