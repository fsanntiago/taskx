import 'package:taskX/features/category/domain/usecases/is_in_categories_limit_usecase.dart';

import '../../container_injector.dart';
import 'data/datasources/remote/base_remote_category_datasource.dart';
import 'data/datasources/remote/category_remote_datasource.dart';
import 'data/repositories/category_repository.dart';
import 'domain/repositories/base_category_repository.dart';
import 'domain/usecases/create_category_usecase.dart';
import 'presentation/cubit/category_cubit.dart';

void initCategory() {
  // Cubit
  sl.registerFactory<CategoryCubit>(
    () => CategoryCubit(
      isInCategoriesLimitUseCase: sl(),
      createCategoryUseCase: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(
    () => CreateCategoryUseCase(
      categoryRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => IsInCategoriesLimitUseCase(
      categoryRepository: sl(),
    ),
  );
  // Repositories
  sl.registerLazySingleton<BaseCategoryRepository>(
    () => CategoryRepository(
      remoteCategoryDataSource: sl(),
    ),
  );

  // Local data sources

  // Remote data sources

  sl.registerLazySingleton<BaseRemoteCategoryDataSource>(
    () => CategoryRemoteDataSource(
      firebaseFirestore: sl(),
      firebaseAuth: sl(),
      firestoreManager: sl(),
    ),
  );
}
