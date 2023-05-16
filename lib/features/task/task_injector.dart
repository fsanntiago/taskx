import 'package:taskX/container_injector.dart';

import 'package:taskX/features/task/presentation/cubit/task_cubit.dart';

void initTask() {
  // Cubit
  sl.registerFactory<TaskCubit>(
    () => TaskCubit(
        // homeLoadCategoriesUseCase: sl(),
        ),
  );
}
