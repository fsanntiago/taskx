import 'package:taskX/features/auth/domain/repositories/base_auth_repository.dart';

class IsSignInUseCase {
  final BaseAuthRepository authRepository;

  IsSignInUseCase({required this.authRepository});

  Future<bool> call() {
    return authRepository.isSignIn();
  }
}
