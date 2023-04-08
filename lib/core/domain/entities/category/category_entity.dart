import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 1)
class CategoryEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final DateTime? createdAt;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final int? icon;
  @HiveField(5)
  final int? color;
  @HiveField(6)
  final DateTime? updateAt;
  @HiveField(7)
  final bool? isDeleted;

  CategoryEntity({
    this.uid,
    this.createdAt,
    this.name,
    this.color,
    this.description,
    this.icon,
    this.updateAt,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        uid,
        createdAt,
        name,
        color,
        description,
        icon,
        updateAt,
        isDeleted,
      ];
}
