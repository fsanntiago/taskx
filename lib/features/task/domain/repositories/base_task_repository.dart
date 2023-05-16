import 'package:dartz/dartz.dart';
import 'package:taskX/core/domain/entities/task/task_entity.dart';
import 'package:taskX/core/error/failure.dart';

abstract class BaseTaskRepository {
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity task);
}
