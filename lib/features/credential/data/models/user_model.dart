import 'package:taskX/features/credential/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  @override
  final String? uid;

  @override
  final String? name;

  @override
  final String? email;

  const UserModel({
    this.uid,
    this.email,
    this.name,
  }) : super(
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
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
      };
}
