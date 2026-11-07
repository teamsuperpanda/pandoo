import 'package:pandoo/models/list_model.dart';

/// One place for the list ordering rules.
///
/// Invariants:
/// - pinned lists come first, sorted by name;
/// - unpinned lists follow, sorted by `order`;
/// - unpinned `order` values are contiguous from 0;
/// - applying the rules twice changes nothing.
List<ListModel> orderedLists(Iterable<ListModel> lists) {
  final pinned = lists.where((list) => list.pinned).toList()
    ..sort((a, b) => a.name.compareTo(b.name));
  final unpinned = lists.where((list) => !list.pinned).toList()
    ..sort((a, b) => a.order.compareTo(b.order));
  return [...pinned, ...unpinned];
}

/// Returns copies of the unpinned lists with contiguous `order` values.
List<ListModel> normalizedUnpinned(Iterable<ListModel> lists) {
  var order = 0;
  return [
    for (final list in lists)
      if (!list.pinned) list.copyWith(pinned: false, order: order++),
  ];
}

/// Moves an unpinned list within the unpinned block, using Flutter's
/// `ReorderableListView` index semantics (the new index is before removal).
List<ListModel> moveUnpinned(
  Iterable<ListModel> lists,
  int oldIndex,
  int newIndex,
) {
  final unpinned = [
    for (final list in orderedLists(lists))
      if (!list.pinned) list,
  ];
  if (oldIndex < 0 || oldIndex >= unpinned.length) return unpinned;
  var target = newIndex;
  if (target > oldIndex) target -= 1;
  target = target.clamp(0, unpinned.length - 1);
  final moved = unpinned.removeAt(oldIndex);
  unpinned.insert(target, moved);
  return unpinned;
}
