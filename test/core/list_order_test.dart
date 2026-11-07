import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/core/list_order.dart';
import 'package:pandoo/models/list_model.dart';

ListModel _list(String name, {int order = 0, bool pinned = false}) =>
    ListModel(name: name, order: order, pinned: pinned);

void main() {
  test('pinned lists come first, sorted by name', () {
    final ordered = orderedLists([
      _list('b'),
      _list('Zebra', order: 5, pinned: true),
      _list('a', order: 1),
      _list('Alpha', order: 9, pinned: true),
    ]);

    expect(ordered.map((list) => list.name), ['Alpha', 'Zebra', 'b', 'a']);
  });

  test('normalization makes unpinned order contiguous and idempotent', () {
    final input = [
      _list('Pinned', order: 4, pinned: true),
      _list('B', order: 8),
      _list('A', order: 2),
    ];

    final once = normalizedUnpinned(orderedLists(input));
    final twice = normalizedUnpinned(orderedLists([...orderedLists(input)]));

    expect(once.map((list) => list.name), ['A', 'B']);
    expect(once.map((list) => list.order), [0, 1]);
    expect(twice.map((list) => list.order), [0, 1]);
  });

  test('moving down uses removal-index semantics', () {
    final moved = moveUnpinned(
      [_list('One'), _list('Two', order: 1), _list('Three', order: 2)],
      0,
      2,
    );

    expect(moved.map((list) => list.name), ['Two', 'One', 'Three']);
  });

  test('moving up keeps every list and stays contiguous', () {
    final moved = moveUnpinned(
      [_list('One'), _list('Two', order: 1), _list('Three', order: 2)],
      2,
      0,
    );

    expect(moved.map((list) => list.name), ['Three', 'One', 'Two']);
    expect(normalizedUnpinned(moved).map((list) => list.order), [0, 1, 2]);
  });

  test('an out-of-range move leaves the order unchanged', () {
    final lists = [_list('One'), _list('Two', order: 1)];
    expect(moveUnpinned(lists, 5, 0).map((list) => list.name), ['One', 'Two']);
  });
}
