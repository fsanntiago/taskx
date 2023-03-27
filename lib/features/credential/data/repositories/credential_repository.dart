import 'package:taskX/core/error/error_handler.dart';
import 'package:taskX/features/credential/data/datasources/remote/base_remote_credential_datasource.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:taskX/features/credential/domain/repositories/base_credential_repository.dart';

class CredentialRepository implements BaseCredentialRepository {
  final BaseRemoteCredentialDataSource remoteCredentialDataSource;

  CredentialRepository({required this.remoteCredentialDataSource});

  @override
  Future<Either<Failure, UserEntity>> login() async {
    try {
      final user = await remoteCredentialDataSource.login();
      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await remoteCredentialDataSource.loginWithGoogle();
      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword() async {
    try {
      await remoteCredentialDataSource.resetPassword();
      return const Right(true);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp() async {
    try {
      final user = await remoteCredentialDataSource.signUp();
      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
