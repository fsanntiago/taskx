// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/domain/entities/category/category_entity.dart';

class CategoryModel extends CategoryEntity {
  @override
  final String? uid;
  @override
  final DateTime? createdAt;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? icon;
  @override
  final int? color;
  @override
  final DateTime? updateAt;
  @override
  final bool? isDeleted;
  @override
  final int? totalTasks;

  CategoryModel({
    this.uid,
    this.createdAt,
    this.name,
    this.color,
    this.description,
    this.icon,
    this.updateAt,
    this.isDeleted,
    this.totalTasks,
  }) : super(
          createdAt: createdAt,
          uid: uid,
          name: name,
          color: color,
          description: description,
          icon: icon,
          updateAt: updateAt,
          isDeleted: isDeleted,
          totalTasks: totalTasks,
        );

  factory CategoryModel.fromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> snapshot = snap.data()! as Map<String, dynamic>;

    return CategoryModel(
      uid: snapshot['uid'],
      color: snapshot['color'] as int,
      icon: snapshot['icon'] as int,
      name: snapshot['name'],
      description: snapshot['name'],
      createdAt: snapshot['createdAt'].toDate(),
      updateAt: snapshot['updateAt'].toDate(),
      isDeleted: snapshot['isDeleted'] as bool,
      totalTasks: snapshot['totalTasks'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        "color": color,
        "icon": icon,
        "description": description,
        "updateAt": updateAt,
        "uid": uid,
        "name": name,
        "createdAt": createdAt,
        "isDeleted": isDeleted,
        "totalTasks": totalTasks,
      };

  CategoryModel copyWith({
    String? uid,
    DateTime? createdAt,
    String? name,
    String? description,
    int? icon,
    int? color,
    DateTime? updateAt,
    bool? isDeleted,
    int? totalTasks,
  }) {
    return CategoryModel(
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      updateAt: updateAt ?? this.updateAt,
      isDeleted: isDeleted ?? this.isDeleted,
      totalTasks: totalTasks ?? this.totalTasks,
    );
  }
}
