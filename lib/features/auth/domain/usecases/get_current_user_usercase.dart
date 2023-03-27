import 'package:dartz/dartz.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/features/auth/domain/repositories/base_auth_repository.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';

class GetCurrentUserUserCase {
  final BaseAuthRepository authRepository;

  GetCurrentUserUserCase({required this.authRepository});

  Future<Either<Failure, UserEntity?>> call() {
    return authRepository.getCurrentUser();
  }
}
