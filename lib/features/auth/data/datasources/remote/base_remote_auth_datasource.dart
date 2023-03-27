import 'package:taskX/features/credential/domain/entities/user_entity.dart';

abstract class BaseRemoteAuthDataSource {
  Future<void> signOut();
  Future<UserEntity?> getCurrentUser();
  Future<bool> isSignIn();
}
