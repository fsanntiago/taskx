import 'package:dartz/dartz.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';

abstract class BaseCredentialRepository {
  Future<Either<Failure, UserEntity>> login();
  Future<Either<Failure, UserEntity>> loginWithGoogle();
  Future<Either<Failure, UserEntity>> signUp(UserEntity user);
  Future<Either<Failure, bool>> resetPassword();
}
