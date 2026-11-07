// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes -- Hive model with mutable test mock

import 'dart:math';

import 'package:hive/hive.dart';

part 'list_model.g.dart';

@HiveType(typeId: 0)
class ListModel {
  ListModel({
    required this.name,
    required this.order,
    List<TodoItem>? items,
    this.pinned = false,
  }) : items = items ?? [];

  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<TodoItem> items;

  @HiveField(2)
  final int order;

  @HiveField(3)
  final bool pinned;

  ListModel copyWith({
    String? name,
    List<TodoItem>? items,
    int? order,
    bool? pinned,
  }) {
    return ListModel(
      name: name ?? this.name,
      order: order ?? this.order,
      items: items ?? this.items,
      pinned: pinned ?? this.pinned,
    );
  }
}

/// Generates a collision-resistant item id.
///
/// The timestamp keeps ids roughly sortable, the monotonic counter makes two
/// adds in the same microsecond distinct, and the random suffix protects
/// against collisions across app restarts and devices. Existing ids are plain
/// strings and remain valid.
String newItemId() {
  _itemIdCounter++;
  final random = _random.nextInt(0xFFFFFF).toRadixString(16).padLeft(6, '0');
  return 'item_${DateTime.now().microsecondsSinceEpoch}_'
      '${_itemIdCounter.toRadixString(36)}_$random';
}

final Random _random = Random.secure();
int _itemIdCounter = 0;

@HiveType(typeId: 1)
class TodoItem {
  TodoItem({required this.text, this.isCompleted = false, String? id})
    : id = id ?? newItemId();

  @HiveField(0)
  final String text;

  @HiveField(1)
  final bool isCompleted;

  @HiveField(2)
  final String id;

  TodoItem copyWith({String? text, bool? isCompleted, String? id}) {
    return TodoItem(
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItem &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          isCompleted == other.isCompleted &&
          id == other.id;

  @override
  int get hashCode => text.hashCode ^ isCompleted.hashCode ^ id.hashCode;
}
