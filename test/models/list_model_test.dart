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

    test('generates unique IDs', () {
      final item1 = TodoItem(text: 'First');
      final item2 = TodoItem(text: 'Second');
      expect(item1.id, startsWith('item_'));
      expect(item2.id, startsWith('item_'));
      expect(item1.id, isNot(equals(item2.id)));
    });

    test('copyWith creates a copy with updated text', () {
      final item = TodoItem(text: 'Original');
      final copy = item.copyWith(text: 'Updated');
      expect(copy.text, equals('Updated'));
      expect(copy.id, equals(item.id));
      expect(copy.isCompleted, equals(item.isCompleted));
    });

    test('copyWith creates a copy with updated isCompleted', () {
      final item = TodoItem(text: 'Test');
      final copy = item.copyWith(isCompleted: true);
      expect(copy.isCompleted, isTrue);
      expect(copy.text, equals('Test'));
      expect(copy.id, equals(item.id));
    });

    test('copyWith with no arguments returns equivalent but different object',
        () {
      final item = TodoItem(text: 'Test', isCompleted: true);
      final copy = item.copyWith();
      expect(copy.text, equals(item.text));
      expect(copy.isCompleted, equals(item.isCompleted));
      expect(copy.id, equals(item.id));
    });

    test('== and hashCode work correctly', () {
      final item1 = TodoItem(text: 'Test', id: 'same-id');
      final item2 = TodoItem(text: 'Test', id: 'same-id');
      final item3 = TodoItem(text: 'Different', id: 'other-id');

      expect(item1, equals(item2));
      expect(item1.hashCode, equals(item2.hashCode));
      expect(item1, isNot(equals(item3)));
    });

    test('edge cases: empty name', () {
      final item = TodoItem(text: '');
      expect(item.text, isEmpty);
      expect(item.isCompleted, isFalse);
    });

    test('edge cases: long text', () {
      final longText = 'a' * 1000;
      final item = TodoItem(text: longText);
      expect(item.text.length, equals(1000));
    });

    test('edge cases: special characters', () {
      final item = TodoItem(text: r'Hello\nWorld\t!@#$%^&*()_+');
      expect(item.text, contains(r'\n'));
      expect(item.text, contains(r'\t'));
      expect(item.text, contains(r'!@#$%^&*()_+'));
    });
  });

  group('ListModel copyWith', () {
    test('copyWith creates a copy with updated name', () {
      final list = ListModel(name: 'Original', order: 1, pinned: true);
      final copy = list.copyWith(name: 'Renamed');
      expect(copy.name, equals('Renamed'));
      expect(copy.order, equals(1));
      expect(copy.pinned, isTrue);
      expect(copy.items, isEmpty);
    });

    test('copyWith creates a copy with updated items', () {
      final list = ListModel(name: 'Test', order: 0);
      final items = [TodoItem(text: 'New item')];
      final copy = list.copyWith(items: items);
      expect(copy.items, equals(items));
      expect(copy.name, equals('Test'));
    });

    test('copyWith creates a copy with updated order', () {
      final list = ListModel(name: 'Test', order: 0);
      final copy = list.copyWith(order: 5);
      expect(copy.order, equals(5));
    });

    test('copyWith creates a copy with updated pinned', () {
      final list = ListModel(name: 'Test', order: 0);
      final copy = list.copyWith(pinned: true);
      expect(copy.pinned, isTrue);
    });

    test('copyWith with no arguments returns equivalent object', () {
      final items = [TodoItem(text: 'Item')];
      final list = ListModel(name: 'Test', order: 1, items: items, pinned: true);
      final copy = list.copyWith();
      expect(copy.name, equals(list.name));
      expect(copy.order, equals(list.order));
      expect(copy.items, equals(list.items));
      expect(copy.pinned, equals(list.pinned));
    });
  });
}
