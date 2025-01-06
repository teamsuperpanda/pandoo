// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListModelAdapter extends TypeAdapter<ListModel> {
  @override
  final int typeId = 0;

  @override
  ListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListModel(
      name: fields[0] as String,
      items: (fields[1] as List?)?.cast<TodoItem>(),
      order: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ListModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.items)
      ..writeByte(2)
      ..write(obj.order);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodoItemAdapter extends TypeAdapter<TodoItem> {
  @override
  final int typeId = 1;

  @override
  TodoItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoItem(
      text: fields[0] as String,
      isCompleted: fields[1] as bool,
      id: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TodoItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.isCompleted)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
