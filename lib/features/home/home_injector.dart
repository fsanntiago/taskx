import 'package:taskX/container_injector.dart';
import 'package:taskX/features/home/presentation/cubit/home_cubit.dart';

void initHome() {
  // Cubit
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );

  // Use Cases

  // Repositories

  // Remote data sources
}
