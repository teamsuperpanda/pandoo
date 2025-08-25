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
}
