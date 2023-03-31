import 'package:taskX/features/credential/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  @override
  final String? uid;

  @override
  final String? name;

  @override
  final DateTime? createdAt;

  @override
  final String? email;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.createdAt,
  }) : super(
          createdAt: createdAt,
          email: email,
          uid: uid,
          name: name,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> snapshot = snap.data()! as Map<String, dynamic>;

    return UserModel(
      uid: snapshot['uid'],
      email: snapshot['email'],
      name: snapshot['name'],
      createdAt: snapshot['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "createdAt": createdAt,
      };
}
