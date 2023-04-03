import 'package:taskX/core/error/error_handler.dart';
import 'package:taskX/core/utils/app_boxes.dart';
import 'package:taskX/features/credential/data/datasources/remote/base_remote_credential_datasource.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:taskX/features/credential/domain/repositories/base_credential_repository.dart';

import '../../../../core/domain/entities/user/entities/user_entity.dart';

class CredentialRepository implements BaseCredentialRepository {
  final BaseRemoteCredentialDataSource remoteCredentialDataSource;

  CredentialRepository({required this.remoteCredentialDataSource});

  @override
  Future<Either<Failure, UserEntity>> signIn(UserEntity user) async {
    try {
      final response = await remoteCredentialDataSource.signIn(user);
      AppBoxes.userBox.put(AppBoxesKeys.user, response);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await remoteCredentialDataSource.loginWithGoogle();
      AppBoxes.userBox.put(AppBoxesKeys.user, user!);
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
  Future<Either<Failure, UserEntity>> signUp(UserEntity user) async {
    try {
      final response = await remoteCredentialDataSource.signUp(user);
      AppBoxes.userBox.put(AppBoxesKeys.user, response);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
