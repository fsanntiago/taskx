import 'package:taskX/container_injector.dart';
import 'package:taskX/features/auth/data/datasources/local/base_local_auth_datasource.dart';
import 'package:taskX/features/auth/data/datasources/local/local_auth_datasource.dart';
import 'package:taskX/features/auth/data/datasources/remote/base_remote_auth_datasource.dart';
import 'package:taskX/features/auth/data/datasources/remote/remote_auth_datasource.dart';
import 'package:taskX/features/auth/data/repositories/auth_repository.dart';
import 'package:taskX/features/auth/domain/repositories/base_auth_repository.dart';
import 'package:taskX/features/auth/domain/usecases/get_current_user_usercase.dart';
import 'package:taskX/features/auth/presentation/cubit/auth_cubit.dart';

void initAuth() {
  // Cubit
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      getCurrentUserUserCase: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(
    () => GetCurrentUserUserCase(authRepository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<BaseAuthRepository>(
    () => AuthRepository(
      checkInternetConnectivity: sl(),
      remoteAuthDataSource: sl(),
      localAuthDataSource: sl(),
    ),
  );

  // Local data sources
  sl.registerLazySingleton<BaseLocalAuthDataSource>(
    () => LocalAuthDataSource(),
  );

  // Remote data sources
  sl.registerLazySingleton<BaseRemoteAuthDataSource>(
    () => RemoteAuthDataSource(
      firebaseAuth: sl(),
      firestoreManager: sl(),
    ),
  );
}
