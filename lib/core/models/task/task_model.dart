import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:taskX/core/domain/entities/task/task_entity.dart';

class TaskModel extends TaskEntity {
  @override
  final String? taskId;
  @override
  final String? name;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updateAt;
  @override
  final bool? isDeleted;
  @override
  final num? progress;
  @override
  final StatusTask? status;
  @override
  final DateTime? dateStart;
  @override
  final DateTime? dateEnd;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final CheckList? checkList;
  @override
  final String? creatorUid;
  @override
  final List<String>? files;

  TaskModel({
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
  }) : super(
          taskId: taskId,
          name: name,
          createdAt: createdAt,
          updateAt: updateAt,
          isDeleted: isDeleted,
          progress: progress,
          status: status,
          dateStart: dateStart,
          dateEnd: dateEnd,
          description: description,
          category: category,
          checkList: checkList,
          creatorUid: creatorUid,
          files: files,
        );

  factory TaskModel.fromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> snapshot = snap.data()! as Map<String, dynamic>;

    return TaskModel(
      taskId: snapshot['taskId'],
      name: snapshot['name'],
      createdAt: snapshot['createdAt'].toDate(),
      updateAt: snapshot['updateAt'].toDate(),
      isDeleted: snapshot['isDeleted'] as bool,
      progress: snapshot['progress'] as num,
      status: snapshot['status'] as StatusTask,
      dateStart: snapshot['dateStart'].toDate(),
      dateEnd: snapshot['dateEnd'].toDate(),
      description: snapshot['description'],
      category: snapshot['category'],
      checkList: snapshot['checkList'] as CheckList,
      creatorUid: snapshot['creatorUid'],
      files: snapshot['files'],
    );
  }

  Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "name": name,
        "createdAt": createdAt,
        "updateAt": updateAt,
        "isDeleted": isDeleted,
        "progress": progress,
        "status": status,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "description": description,
        "category": category,
        "checkList": checkList,
        "creatorUid": creatorUid,
        "files": files,
      };

  TaskModel copyWith({
    String? taskId,
    String? name,
    DateTime? createdAt,
    DateTime? updateAt,
    bool? isDeleted,
    num? progress,
    StatusTask? status,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? description,
    String? category,
    CheckList? checkList,
    String? creatorUid,
    List<String>? files,
  }) {
    return TaskModel(
      taskId: taskId ?? this.taskId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      isDeleted: isDeleted ?? this.isDeleted,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      description: description ?? this.description,
      category: category ?? this.category,
      checkList: checkList ?? this.checkList,
      creatorUid: creatorUid ?? this.creatorUid,
      files: files ?? this.files,
    );
  }
}
