import 'package:dartz/dartz.dart';
import 'package:taskX/core/domain/entities/task/task_entity.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/features/task/domain/repositories/base_task_repository.dart';

class CreateTaskUseCase {
  final BaseTaskRepository baseTaskRepository;

  CreateTaskUseCase({
    required this.baseTaskRepository,
  });

  Future<Either<Failure, TaskEntity>> call(TaskEntity task) {
    return baseTaskRepository.createTask(task);
  }
}
