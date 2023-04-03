import '../../../../../core/domain/entities/user/entities/user_entity.dart';

abstract class BaseRemoteCredentialDataSource {
  Future<UserEntity> signIn(UserEntity user);
  Future<UserEntity?> loginWithGoogle();
  Future<UserEntity> signUp(UserEntity user);
  Future<bool> resetPassword();
}
