import 'package:dartz/dartz.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';
import 'package:taskX/features/credential/domain/repositories/base_credential_repository.dart';

class LoginUseCase {
  final BaseCredentialRepository credentialRepository;

  LoginUseCase({required this.credentialRepository});

  Future<Either<Failure, UserEntity>> call() {
    return credentialRepository.login();
  }
}
