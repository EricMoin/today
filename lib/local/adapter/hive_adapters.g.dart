// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final int typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      firstCreateTime: (fields[0] as num).toInt(),
      lastModifiedTime: (fields[1] as num).toInt(),
      startAt: (fields[2] as num).toInt(),
      endAt: (fields[3] as num).toInt(),
      state: fields[6] as TodoState,
      title: fields[4] == null ? '' : fields[4] as String,
      content: fields[5] == null ? '' : fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.firstCreateTime)
      ..writeByte(1)
      ..write(obj.lastModifiedTime)
      ..writeByte(2)
      ..write(obj.startAt)
      ..writeByte(3)
      ..write(obj.endAt)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.content)
      ..writeByte(6)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FlowAdapter extends TypeAdapter<Flow> {
  @override
  final int typeId = 1;

  @override
  Flow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Flow(
      title: fields[0] == null ? '' : fields[0] as String,
      content: fields[1] == null ? '' : fields[1] as String,
      todos: fields[2] == null ? const [] : (fields[2] as List).cast<Todo>(),
      state: fields[3] as FlowState,
    );
  }

  @override
  void write(BinaryWriter writer, Flow obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.todos)
      ..writeByte(3)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
