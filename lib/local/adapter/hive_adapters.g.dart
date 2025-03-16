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
      uuid: fields[8] as String,
      firstCreateTime: (fields[9] as num).toInt(),
      lastModifiedTime: (fields[10] as num).toInt(),
      startAt: (fields[11] as num).toInt(),
      endAt: (fields[12] as num).toInt(),
      state: fields[15] as BaseState,
      title: fields[13] == null ? '' : fields[13] as String,
      content: fields[14] == null ? '' : fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(8)
      ..writeByte(8)
      ..write(obj.uuid)
      ..writeByte(9)
      ..write(obj.firstCreateTime)
      ..writeByte(10)
      ..write(obj.lastModifiedTime)
      ..writeByte(11)
      ..write(obj.startAt)
      ..writeByte(12)
      ..write(obj.endAt)
      ..writeByte(13)
      ..write(obj.title)
      ..writeByte(14)
      ..write(obj.content)
      ..writeByte(15)
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
      uuid: fields[4] as String,
      firstCreateTime: (fields[5] as num).toInt(),
      lastModifiedTime: (fields[6] as num).toInt(),
      startAt: (fields[7] as num).toInt(),
      endAt: (fields[8] as num).toInt(),
      state: fields[11] as BaseState,
      todos: fields[13] == null ? const [] : (fields[13] as List).cast<Todo>(),
      title: fields[9] == null ? '' : fields[9] as String,
      content: fields[10] == null ? '' : fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Flow obj) {
    writer
      ..writeByte(9)
      ..writeByte(4)
      ..write(obj.uuid)
      ..writeByte(5)
      ..write(obj.firstCreateTime)
      ..writeByte(6)
      ..write(obj.lastModifiedTime)
      ..writeByte(7)
      ..write(obj.startAt)
      ..writeByte(8)
      ..write(obj.endAt)
      ..writeByte(9)
      ..write(obj.title)
      ..writeByte(10)
      ..write(obj.content)
      ..writeByte(11)
      ..write(obj.state)
      ..writeByte(13)
      ..write(obj.todos);
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

class PlanAdapter extends TypeAdapter<Plan> {
  @override
  final int typeId = 2;

  @override
  Plan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Plan(
      uuid: fields[8] as String,
      firstCreateTime: (fields[9] as num).toInt(),
      lastModifiedTime: (fields[10] as num).toInt(),
      startAt: (fields[11] as num).toInt(),
      endAt: (fields[12] as num).toInt(),
      state: fields[15] as BaseState,
      triggerTime: (fields[7] as num).toInt(),
      title: fields[13] == null ? '' : fields[13] as String,
      content: fields[14] == null ? '' : fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Plan obj) {
    writer
      ..writeByte(9)
      ..writeByte(7)
      ..write(obj.triggerTime)
      ..writeByte(8)
      ..write(obj.uuid)
      ..writeByte(9)
      ..write(obj.firstCreateTime)
      ..writeByte(10)
      ..write(obj.lastModifiedTime)
      ..writeByte(11)
      ..write(obj.startAt)
      ..writeByte(12)
      ..write(obj.endAt)
      ..writeByte(13)
      ..write(obj.title)
      ..writeByte(14)
      ..write(obj.content)
      ..writeByte(15)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BaseInfoAdapter extends TypeAdapter<BaseInfo> {
  @override
  final int typeId = 3;

  @override
  BaseInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseInfo(
      uuid: fields[0] as String,
      firstCreateTime: (fields[1] as num).toInt(),
      lastModifiedTime: (fields[2] as num).toInt(),
      startAt: (fields[3] as num).toInt(),
      endAt: (fields[4] as num).toInt(),
      state: fields[7] as BaseState,
      title: fields[5] == null ? '' : fields[5] as String,
      content: fields[6] == null ? '' : fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BaseInfo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.firstCreateTime)
      ..writeByte(2)
      ..write(obj.lastModifiedTime)
      ..writeByte(3)
      ..write(obj.startAt)
      ..writeByte(4)
      ..write(obj.endAt)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.content)
      ..writeByte(7)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BaseStateAdapter extends TypeAdapter<BaseState> {
  @override
  final int typeId = 4;

  @override
  BaseState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseState(state: fields[0] as String);
  }

  @override
  void write(BinaryWriter writer, BaseState obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
