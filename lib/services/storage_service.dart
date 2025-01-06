import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/list_model.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  static const String listsBoxName = 'lists';
  late Box<ListModel> _listsBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ListModelAdapter());
    Hive.registerAdapter(TodoItemAdapter());
    _listsBox = await Hive.openBox<ListModel>(listsBoxName);
  }

  Future<bool> addList(String name) async {
    if (_listsBox.containsKey(name)) {
      return false;
    }
    final order = _listsBox.length;
    final list = ListModel(name: name, order: order);
    await _listsBox.put(name, list);
    return true;
  }

  List<ListModel> getAllLists() {
    return _listsBox.values.toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  Future<void> addItemToList(String listName, String item) async {
    final list = _listsBox.get(listName);
    if (list != null) {
      final updatedItems = [...list.items, TodoItem(text: item)];
      final updatedList = ListModel(
        name: list.name,
        items: updatedItems,
        order: list.order,
      );
      await _listsBox.put(listName, updatedList);
    }
  }

  Future<void> reorderLists(int oldIndex, int newIndex) async {
    final lists = getAllLists();
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = lists.removeAt(oldIndex);
    lists.insert(newIndex, item);

    // Update order for all items
    await _listsBox.clear();
    for (int i = 0; i < lists.length; i++) {
      final list = lists[i];
      final updatedList = ListModel(
        name: list.name,
        items: list.items,
        order: i,
      );
      await _listsBox.put(list.name, updatedList);
    }
  }

  Future<void> deleteList(String name) async {
    await _listsBox.delete(name);
    // Reorder remaining lists
    final lists = getAllLists();
    await _listsBox.clear();
    for (int i = 0; i < lists.length; i++) {
      final list = lists[i];
      final updatedList = ListModel(
        name: list.name,
        items: list.items,
        order: i,
      );
      await _listsBox.put(list.name, updatedList);
    }
  }

  Future<bool> renameList(String oldName, String newName) async {
    if (_listsBox.containsKey(newName)) {
      return false;
    }
    final list = _listsBox.get(oldName);
    if (list != null) {
      final updatedList = ListModel(
        name: newName,
        items: list.items,
        order: list.order,
      );
      await _listsBox.delete(oldName);
      await _listsBox.put(newName, updatedList);
      return true;
    }
    return false;
  }

  ValueListenable<Box<ListModel>> getBoxNotifier() {
    return _listsBox.listenable();
  }

  ListModel? getList(String name) {
    return _listsBox.get(name);
  }

  Future<void> toggleItemCompletion(String listName, String itemId) async {
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

    final updatedList = ListModel(
      name: list.name,
      items: updatedItems,
      order: list.order,
    );

    await _listsBox.put(listName, updatedList);
  }

  Future<void> removeCompletedItems(String listName) async {
    final list = _listsBox.get(listName);
    if (list == null) return;

    final updatedItems = list.items.where((item) => !item.isCompleted).toList();

    final updatedList = ListModel(
      name: list.name,
      items: updatedItems,
      order: list.order,
    );

    await _listsBox.put(listName, updatedList);
  }
}
