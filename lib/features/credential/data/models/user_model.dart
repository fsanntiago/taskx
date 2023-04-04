import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/domain/entities/user/entities/user_entity.dart';

class UserModel extends UserEntity {
  @override
  final String? uid;

  @override
  final String? name;

  @override
  final DateTime? createdAt;

  @override
  final String? email;

  @override
  int? totalCategory;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.createdAt,
    this.totalCategory,
  }) : super(
          createdAt: createdAt,
          email: email,
          uid: uid,
          name: name,
          totalCategory: totalCategory,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> snapshot = snap.data()! as Map<String, dynamic>;

    return UserModel(
      uid: snapshot['uid'],
      email: snapshot['email'],
      name: snapshot['name'],
      createdAt: snapshot['createdAt'].toDate(),
      totalCategory: snapshot['totalCategory'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "createdAt": createdAt,
        "totalCategory": totalCategory,
      };
}
