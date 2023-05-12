import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task_entity.g.dart';

@HiveType(typeId: 2)
class TaskEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String? taskId;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final DateTime? createdAt;
  @HiveField(3)
  final DateTime? updateAt;
  @HiveField(4)
  final bool? isDeleted;
  @HiveField(5)
  final num? progress;
  @HiveField(6)
  final StatusTask? status;
  @HiveField(7)
  final DateTime? dateStart;
  @HiveField(8)
  final DateTime? dateEnd;
  @HiveField(9)
  final String? description;
  @HiveField(10)
  final String? category;
  @HiveField(11)
  final CheckList? checkList;
  @HiveField(12)
  final String? creatorUid;
  @HiveField(13)
  final List<String>? files;

  TaskEntity({
    this.taskId,
    this.name,
    this.createdAt,
    this.updateAt,
    this.isDeleted,
    this.progress,
    this.status,
    this.dateStart,
    this.dateEnd,
    this.description,
    this.category,
    this.checkList,
    this.creatorUid,
    this.files,
  });

  @override
  List<Object?> get props => [
        taskId,
        name,
        createdAt,
        updateAt,
        isDeleted,
        progress,
        status,
        dateStart,
        dateEnd,
        description,
        category,
        checkList,
        files,
        creatorUid,
      ];
}

class CheckList {
  final String name;
  final bool isCheck;

  CheckList({
    required this.name,
    required this.isCheck,
  });
}

enum StatusTask {
  todo,
  inProgress,
  done,
}
