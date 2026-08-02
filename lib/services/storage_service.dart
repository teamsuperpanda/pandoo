import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/models/list_model.dart';

class _AsyncLock {
  Future<void>? _last;

  Future<T> synchronized<T>(Future<T> Function() fn) async {
    final prev = _last;
    final completer = Completer<void>();
    _last = completer.future;
    if (prev != null) await prev;
    try {
      return await fn();
    } finally {
      completer.complete();
    }
  }
}

class StorageService {
  factory StorageService() => _instance;
  StorageService._internal();
  static StorageService _instance = StorageService._internal();

  static const String listsBoxName = 'lists';
  late Box<ListModel> _listsBox;
  final _lock = _AsyncLock();

  Future<void> init({String? testPath}) async {
    try {
      if (testPath != null) {
        Hive.init(testPath);
      } else {
        await Hive.initFlutter();
      }

      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(ListModelAdapter());
      }
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(TodoItemAdapter());
      }
      _listsBox = await Hive.openBox<ListModel>(listsBoxName);
    } catch (e) {
      debugPrint('StorageService.init error: $e');
      rethrow;
    }
  }

  Future<bool> addList(String name) async {
    final trimmed = name.trim();
    return _lock.synchronized(() async {
      try {
        if (trimmed.isEmpty || _listsBox.containsKey(trimmed)) {
          return false;
        }
        final unpinnedCount = getAllLists().where((l) => !l.pinned).length;
        final list = ListModel(name: trimmed, order: unpinnedCount);
        await _listsBox.put(trimmed, list);
        return true;
      } catch (e) {
        debugPrint('StorageService.addList error: $e');
        rethrow;
      }
    });
  }

  List<ListModel> getAllLists() {
    if (!_listsBox.isOpen) return [];
    final allLists = _listsBox.values.toList();
    final pinnedLists = allLists.where((list) => list.pinned).toList();
    final unpinnedLists = allLists.where((list) => !list.pinned).toList();

    pinnedLists.sort((a, b) => a.name.compareTo(b.name));
    unpinnedLists.sort((a, b) => a.order.compareTo(b.order));

    return [...pinnedLists, ...unpinnedLists];
  }

  Future<void> addItemToList(String listName, String item) async {
    return _lock.synchronized(() async {
      try {
        final list = _listsBox.get(listName);
        if (list != null) {
          final updatedItems = [...list.items, TodoItem(text: item)];
          await _listsBox.put(listName, list.copyWith(items: updatedItems));
        }
      } catch (e) {
        debugPrint('StorageService.addItemToList error: $e');
        rethrow;
      }
    });
  }

  Future<void> reorderLists(int oldIndex, int newIndex) async {
    return _lock.synchronized(() async {
      try {
        final lists = getAllLists();
        final pinned = lists.where((l) => l.pinned).toList();
        final unpinned = lists.where((l) => !l.pinned).toList();

        final adjustedOld = oldIndex - pinned.length;
        final adjustedNew = newIndex - pinned.length;

        if (adjustedOld < 0 || adjustedOld >= unpinned.length) return;

        if (adjustedOld < adjustedNew) {
          final adjustedNew2 = adjustedNew - 1;
          final item = unpinned.removeAt(adjustedOld);
          unpinned.insert(adjustedNew2, item);
        } else {
          final item = unpinned.removeAt(adjustedOld);
          unpinned.insert(adjustedNew, item);
        }

        final updates = <dynamic, ListModel>{
          for (var i = 0; i < unpinned.length; i++)
            unpinned[i].name: unpinned[i].copyWith(order: i),
        };
        await _listsBox.putAll(updates);
      } catch (e) {
        debugPrint('StorageService.reorderLists error: $e');
        rethrow;
      }
    });
  }

  Future<void> deleteList(String name) async {
    return _lock.synchronized(() async {
      try {
        await _listsBox.delete(name);
        await _putAllIfNotEmpty(
          _normalizedUnpinnedUpdates(
            getAllLists().where((list) => !list.pinned),
          ),
        );
      } catch (e) {
        debugPrint('StorageService.deleteList error: $e');
        rethrow;
      }
    });
  }

  Future<bool> renameList(String oldName, String newName) async {
    return _lock.synchronized(() async {
      try {
        final trimmed = newName.trim();
        if (trimmed.isEmpty || trimmed == oldName) return false;
        if (_listsBox.containsKey(trimmed)) {
          return false;
        }
        final list = _listsBox.get(oldName);
        if (list != null) {
          await _listsBox.put(trimmed, list.copyWith(name: trimmed));
          try {
            await _listsBox.delete(oldName);
          } on Object catch (_) {
            try {
              await _listsBox.delete(trimmed);
            } on Object catch (_) {
              // Keep the original entry even if rolling back the copy fails.
            }
            rethrow;
          }
          return true;
        }
        return false;
      } catch (e) {
        debugPrint('StorageService.renameList error: $e');
        rethrow;
      }
    });
  }

  Future<void> togglePin(String listName) async {
    return _lock.synchronized(() async {
      try {
        final list = _listsBox.get(listName);
        if (list != null) {
          final unpinnedLists = getAllLists()
              .where((candidate) => !candidate.pinned)
              .toList();
          if (list.pinned) {
            final unpinned = list.copyWith(
              pinned: false,
              order: unpinnedLists.length,
            );
            final updates = _normalizedUnpinnedUpdates(unpinnedLists);
            updates[listName] = unpinned;
            await _listsBox.putAll(updates);
          } else {
            final updates = _normalizedUnpinnedUpdates(
              unpinnedLists.where((candidate) => candidate.name != listName),
            );
            updates[listName] = list.copyWith(pinned: true);
            await _listsBox.putAll(updates);
          }
        }
      } catch (e) {
        debugPrint('StorageService.togglePin error: $e');
        rethrow;
      }
    });
  }

  ValueListenable<Box<ListModel>> getBoxNotifier() {
    return _listsBox.listenable();
  }

  ListModel? getList(String name) {
    return _listsBox.get(name);
  }

  Future<void> toggleItemCompletion(String listName, String itemId) async {
    return _lock.synchronized(() async {
      try {
        final list = _listsBox.get(listName);
        if (list == null) return;

        final updatedItems = list.items.map((item) {
          if (item.id == itemId) {
            return TodoItem(
              text: item.text,
              isCompleted: !item.isCompleted,
              id: item.id,
            );
          }
          return item;
        }).toList();

        await _listsBox.put(listName, list.copyWith(items: updatedItems));
      } catch (e) {
        debugPrint('StorageService.toggleItemCompletion error: $e');
        rethrow;
      }
    });
  }

  Future<void> deleteItemFromList(String listName, String itemId) async {
    return _lock.synchronized(() async {
      try {
        final list = _listsBox.get(listName);
        if (list == null) return;
        final updatedItems = list.items
            .where((item) => item.id != itemId)
            .toList();
        await _listsBox.put(listName, list.copyWith(items: updatedItems));
      } catch (e) {
        debugPrint('StorageService.deleteItemFromList error: $e');
        rethrow;
      }
    });
  }

  Future<void> removeCompletedItems(String listName) async {
    return _lock.synchronized(() async {
      try {
        final list = _listsBox.get(listName);
        if (list == null) return;

        final updatedItems = list.items
            .where((item) => !item.isCompleted)
            .toList();

        await _listsBox.put(listName, list.copyWith(items: updatedItems));
      } catch (e) {
        debugPrint('StorageService.removeCompletedItems error: $e');
        rethrow;
      }
    });
  }

  Future<void> close() async {
    if (_listsBox.isOpen) {
      await _listsBox.close();
    }
  }

  Map<dynamic, ListModel> _normalizedUnpinnedUpdates(
    Iterable<ListModel> unpinnedLists,
  ) {
    final updates = <dynamic, ListModel>{};
    var order = 0;
    for (final list in unpinnedLists) {
      if (list.pinned || list.order != order) {
        updates[list.name] = list.copyWith(pinned: false, order: order);
      }
      order++;
    }
    return updates;
  }

  Future<void> _putAllIfNotEmpty(Map<dynamic, ListModel> updates) async {
    if (updates.isNotEmpty) {
      await _listsBox.putAll(updates);
    }
  }

  @visibleForTesting
  static void setTestInstance(Box<ListModel> box) {
    try {
      if (_instance._listsBox.isOpen) {
        unawaited(_instance._listsBox.close());
      }
    } on Object catch (_) {}
    _instance = StorageService._internal();
    _instance._listsBox = box;
  }
}
