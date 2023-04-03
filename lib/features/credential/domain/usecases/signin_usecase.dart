import 'package:dartz/dartz.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/features/credential/domain/repositories/base_credential_repository.dart';
import '../../../../core/domain/entities/user/entities/user_entity.dart';

class SignInUseCase {
  final BaseCredentialRepository credentialRepository;

  SignInUseCase({required this.credentialRepository});

  Future<Either<Failure, UserEntity>> call(UserEntity user) {
    return credentialRepository.signIn(user);
  }
}
