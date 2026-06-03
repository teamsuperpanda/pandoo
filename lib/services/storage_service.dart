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

        for (var i = 0; i < unpinned.length; i++) {
          final list = unpinned[i];
          await _listsBox.put(list.name, list.copyWith(order: i));
        }
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
        final lists = getAllLists();
        for (var i = 0; i < lists.length; i++) {
          final list = lists[i];
          if (list.order != i) {
            await _listsBox.put(list.name, list.copyWith(order: i));
          }
        }
      } catch (e) {
        debugPrint('StorageService.deleteList error: $e');
        rethrow;
      }
    });
  }

  Future<bool> renameList(String oldName, String newName) async {
    return _lock.synchronized(() async {
      try {
        if (_listsBox.containsKey(newName)) {
          return false;
        }
        final list = _listsBox.get(oldName);
        if (list != null) {
          await _listsBox.delete(oldName);
          await _listsBox.put(newName, list.copyWith(name: newName));
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
          await _listsBox.put(listName, list.copyWith(pinned: !list.pinned));
        }
      } catch (e) {
        debugPrint('StorageService.togglePin error: $e');
        rethrow;
      }
    });
  }

  ValueListenable<Box<ListModel>> getBoxNotifier() {
    if (_listsBox.isOpen) {
      return _listsBox.listenable();
    }
    try {
      if (!Hive.isBoxOpen(listsBoxName)) {
        throw StateError('Storage not initialized');
      }
      return _listsBox.listenable();
    } catch (e) {
      if (Hive.isBoxOpen(listsBoxName)) {
        _listsBox = Hive.box<ListModel>(listsBoxName);
        return _listsBox.listenable();
      }
      rethrow;
    }
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

  Future<void> removeCompletedItems(String listName) async {
    return _lock.synchronized(() async {
      try {
        final list = _listsBox.get(listName);
        if (list == null) return;

        final updatedItems = list.items.where((item) => !item.isCompleted).toList();

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
