import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/models/list_model.dart';

void main() {
  group('ListModel', () {
    test('creates list model with required parameters', () {
      final list = ListModel(
        name: 'Test List',
        order: 0,
      );

      expect(list.name, equals('Test List'));
      expect(list.order, equals(0));
      expect(list.items, isEmpty);
      expect(list.pinned, isFalse);
    });

    test('creates list model with all parameters', () {
      final items = [
        TodoItem(text: 'Item 1'),
        TodoItem(text: 'Item 2', isCompleted: true),
      ];
      
      final list = ListModel(
        name: 'Test List',
        order: 5,
        items: items,
        pinned: true,
      );

      expect(list.name, equals('Test List'));
      expect(list.order, equals(5));
      expect(list.items, equals(items));
      expect(list.pinned, isTrue);
    });
  });

  group('TodoItem', () {
    test('creates todo item with required text', () {
      final item = TodoItem(text: 'Test item');

      expect(item.text, equals('Test item'));
      expect(item.isCompleted, isFalse);
      expect(item.id, isNotEmpty);
    });

    test('creates todo item with all parameters', () {
      final item = TodoItem(
        text: 'Test item',
        isCompleted: true,
        id: 'test-id',
      );

      expect(item.text, equals('Test item'));
      expect(item.isCompleted, isTrue);
      expect(item.id, equals('test-id'));
    });

    test('generates unique IDs for different items', () {
      final item1 = TodoItem(text: 'Item 1');
      final item2 = TodoItem(text: 'Item 2');

      expect(item1.id, isNot(equals(item2.id)));
    });

    test('uses provided ID when specified', () {
      final item = TodoItem(text: 'Test', id: 'custom-id');
      expect(item.id, equals('custom-id'));
    });
  });
}
