import 'package:taskX/container_injector.dart';
import 'package:taskX/features/auth/data/datasources/remote/base_remote_auth_datasource.dart';
import 'package:taskX/features/auth/data/datasources/remote/remote_auth_datasource.dart';
import 'package:taskX/features/auth/data/repositories/auth_repository.dart';
import 'package:taskX/features/auth/domain/repositories/base_auth_repository.dart';
import 'package:taskX/features/auth/domain/usecases/get_current_user_usercase.dart';
import 'package:taskX/features/auth/domain/usecases/is_sign_in_usercase.dart';
import 'package:taskX/features/auth/presentation/cubit/auth_cubit.dart';

void initAuth() {
  // Cubit
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      getCurrentUserUserCase: sl(),
      isSignInUseCase: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(
    () => GetCurrentUserUserCase(authRepository: sl()),
  );
  sl.registerLazySingleton(
    () => IsSignInUseCase(authRepository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<BaseAuthRepository>(
    () => AuthRepository(
      remoteAuthDataSource: sl(),
    ),
  );

  // Local data sources

  // Remote data sources
  sl.registerLazySingleton<BaseRemoteAuthDataSource>(
    () => RemoteAuthDataSource(
      firebaseAuth: sl(),
      firestoreManager: sl(),
    ),
  );
}
