import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:mockito/mockito.dart';

class MockBox extends Fake implements Box<ListModel> {
  final Map<dynamic, ListModel> _store = {};
  bool _isOpen = true;

  @override
  ListModel? get(dynamic key, {ListModel? defaultValue}) =>
      _store[key] ?? defaultValue;

  @override
  Future<void> put(dynamic key, ListModel value) async {
    _store[key] = value;
  }

  @override
  bool containsKey(dynamic key) => _store.containsKey(key);

  @override
  Iterable<ListModel> get values => _store.values;

  @override
  Future<int> clear() async {
    final count = _store.length;
    _store.clear();
    return count;
  }

  @override
  Future<void> delete(dynamic key) async {
    _store.remove(key);
  }

  @override
  int get length => _store.length;

  @override
  bool get isOpen => _isOpen;

  @override
  Future<void> close() async {
    _isOpen = false;
  }

  ValueListenable<Box<ListModel>> listenable({List<dynamic>? keys}) {
    return _MockValueListenable(this);
  }

  // Helper method for creating mock lists
  static ListModel createMockList(String name, int order, {List<TodoItem>? items, bool pinned = false}) {
    return ListModel(
      name: name,
      order: order,
      items: items,
      pinned: pinned,
    );
  }
}

class _MockValueListenable extends ValueListenable<Box<ListModel>> {
  final Box<ListModel> box;
  final List<VoidCallback> _listeners = [];

  _MockValueListenable(this.box);

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  @override
  Box<ListModel> get value => box;
}
