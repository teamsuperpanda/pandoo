import 'package:hive/hive.dart';

part 'list_model.g.dart';

@HiveType(typeId: 0)
class ListModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<TodoItem> items;

  @HiveField(2)
  final int order;

  @HiveField(3)
  final bool pinned;

  ListModel({
    required this.name,
    List<TodoItem>? items,
    required this.order,
    this.pinned = false,
  }) : items = items ?? [];
}

@HiveType(typeId: 1)
class TodoItem {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final bool isCompleted;

  @HiveField(2)
  final String id;

  TodoItem({
    required this.text,
    this.isCompleted = false,
    String? id,
  }) : id = id ?? DateTime.now().toIso8601String();
}
