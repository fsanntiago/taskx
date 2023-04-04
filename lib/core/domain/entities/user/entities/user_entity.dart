import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final DateTime? createdAt;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? email;
  @HiveField(4, defaultValue: 0)
  int? totalCategory;

  // will not going to store in DB
  // final File? imageFile;
  final String? password;
  final String? otherUid;

  UserEntity({
    this.uid,
    this.createdAt,
    this.name,
    this.email,
    this.password,
    this.otherUid,
    this.totalCategory,
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        createdAt,
        email,
        password,
        otherUid,
        totalCategory,
      ];
}
