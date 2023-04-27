import 'package:taskX/container_injector.dart';
import 'package:taskX/features/home/data/datasources/local/base_local_home_datasource.dart';
import 'package:taskX/features/home/data/datasources/local/local_home_datasource.dart';
import 'package:taskX/features/home/data/datasources/remote/base_remote_home_datasource.dart';
import 'package:taskX/features/home/data/datasources/remote/remote_home_datasource.dart';
import 'package:taskX/features/home/data/repositories/home_repository.dart';
import 'package:taskX/features/home/domain/repositories/base_home_repositoy.dart';
import 'package:taskX/features/home/domain/usecases/home_load_categories.dart';
import 'package:taskX/features/home/presentation/cubit/home_cubit.dart';

void initHome() {
  // Cubit
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      homeLoadCategoriesUseCase: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(
    () => HomeLoadCategoriesUseCase(
      homeRepository: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<BaseHomeRepository>(
    () => HomeRepositoy(
      remoteHomeDataSource: sl(),
      localHomeDataSource: sl(),
      checkInternetConnectivity: sl(),
    ),
  );

  // Local data sources
  sl.registerLazySingleton<BaseLocalHomeDataSource>(
    () => LocalHomeDataSource(),
  );

  // Remote data sources
  sl.registerLazySingleton<BaseRemoteHomeDataSource>(
    () => RemoteHomeDataSource(
      firebaseAuth: sl(),
      firebaseFirestore: sl(),
      firestoreManager: sl(),
    ),
  );
}
