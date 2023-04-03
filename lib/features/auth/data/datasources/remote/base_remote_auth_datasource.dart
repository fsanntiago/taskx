import '../../../../../core/domain/entities/user/entities/user_entity.dart';

abstract class BaseRemoteAuthDataSource {
  Future<void> signOut();
  Future<UserEntity?> getCurrentUser();
  Future<bool> isSignIn();
}
