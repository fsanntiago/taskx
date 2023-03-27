// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:taskX/core/error/error_handler.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/features/auth/data/datasources/remote/base_remote_auth_datasource.dart';
import 'package:taskX/features/auth/domain/repositories/base_auth_repository.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';

class AuthRepository implements BaseAuthRepository {
  final BaseRemoteAuthDataSource remoteAuthDataSource;

  AuthRepository({
    required this.remoteAuthDataSource,
  });

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = await remoteAuthDataSource.getCurrentUser();
      if (user != null) {
        return Right(user);
      } else {
        return const Right(null);
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteAuthDataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<bool> isSignIn() async => await remoteAuthDataSource.isSignIn();
}
