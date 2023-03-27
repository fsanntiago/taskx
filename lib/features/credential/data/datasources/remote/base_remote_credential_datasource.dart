import 'package:taskX/features/credential/domain/entities/user_entity.dart';

abstract class BaseRemoteCredentialDataSource {
  Future<UserEntity> login();
  Future<UserEntity?> loginWithGoogle();
  Future<UserEntity> signUp(UserEntity user);
  Future<bool> resetPassword();
}
