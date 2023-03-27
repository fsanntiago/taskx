import 'package:equatable/equatable.dart';

// part 'user_entity.g.dart';

class UserEntity extends Equatable {
  final String? uid;

  final String? name;

  final String? email;

  // will not going to store in DB
  // final File? imageFile;
  final String? password;
  final String? otherUid;

  const UserEntity({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.otherUid,
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        password,
        otherUid,
      ];
}
