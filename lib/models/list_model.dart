// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes -- Hive model with mutable test mock

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

  /// Maximum length of a list name after trimming.
  static const int maxNameLength = 80;

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

@HiveType(typeId: 1)
class TodoItem {
  TodoItem({required this.text, this.isCompleted = false, String? id})
    : id = id ?? 'item_${DateTime.now().microsecondsSinceEpoch}';

  /// Maximum length of todo item text after trimming.
  static const int maxTextLength = 500;

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
