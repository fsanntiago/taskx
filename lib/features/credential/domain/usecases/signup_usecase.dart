import 'package:dartz/dartz.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';
import 'package:taskX/features/credential/domain/repositories/base_credential_repository.dart';

class SignUpUseCase {
  final BaseCredentialRepository credentialRepository;

  SignUpUseCase({required this.credentialRepository});

  Future<Either<Failure, UserEntity>> call(UserEntity user) {
    return credentialRepository.signUp(user);
  }
}
