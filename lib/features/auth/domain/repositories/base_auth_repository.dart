import 'package:dartz/dartz.dart';
import 'package:taskX/core/error/failure.dart';
import '../../../../core/domain/entities/user/entities/user_entity.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity?>> getCurrentUser();
}
