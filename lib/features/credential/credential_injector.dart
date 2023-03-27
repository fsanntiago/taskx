import 'package:taskX/container_injector.dart';
import 'package:taskX/features/credential/data/datasources/remote/base_remote_credential_datasource.dart';
import 'package:taskX/features/credential/data/datasources/remote/credential_remote_datasource.dart';
import 'package:taskX/features/credential/data/repositories/credential_repository.dart';
import 'package:taskX/features/credential/domain/repositories/base_credential_repository.dart';
import 'package:taskX/features/credential/domain/usecases/login_usecase.dart';
import 'package:taskX/features/credential/domain/usecases/login_with_google_usecase.dart';
import 'package:taskX/features/credential/domain/usecases/signup_usecase.dart';
import 'package:taskX/features/credential/presentation/cubit/credential_cubit.dart';

void initCredential() {
  // Cubit
  sl.registerFactory<CredentialCubit>(
    () => CredentialCubit(
      signUpUseCase: sl(),
      loginWithGoogleUseCase: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(
    () => LoginWithGoogleUseCase(
      credentialRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoginUseCase(
      credentialRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SignUpUseCase(
      credentialRepository: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<BaseCredentialRepository>(
    () => CredentialRepository(
      remoteCredentialDataSource: sl(),
    ),
  );

  // Remote data sources
  sl.registerLazySingleton<BaseRemoteCredentialDataSource>(
    () => RemoteCredentialDataSource(
      firebaseAuth: sl(),
      firestoreManager: sl(),
    ),
  );
}
