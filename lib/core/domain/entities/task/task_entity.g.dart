// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskEntityAdapter extends TypeAdapter<TaskEntity> {
  @override
  final int typeId = 2;

  @override
  TaskEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskEntity(
      taskId: fields[0] as String?,
      name: fields[1] as String?,
      createdAt: fields[2] as DateTime?,
      updateAt: fields[3] as DateTime?,
      isDeleted: fields[4] as bool?,
      progress: fields[5] as num?,
      status: fields[6] as StatusTask?,
      dateStart: fields[7] as DateTime?,
      dateEnd: fields[8] as DateTime?,
      description: fields[9] as String?,
      category: fields[10] as String?,
      checkList: fields[11] as CheckList?,
      creatorUid: fields[12] as String?,
      files: (fields[13] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TaskEntity obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.taskId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updateAt)
      ..writeByte(4)
      ..write(obj.isDeleted)
      ..writeByte(5)
      ..write(obj.progress)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.dateStart)
      ..writeByte(8)
      ..write(obj.dateEnd)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.category)
      ..writeByte(11)
      ..write(obj.checkList)
      ..writeByte(12)
      ..write(obj.creatorUid)
      ..writeByte(13)
      ..write(obj.files);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
