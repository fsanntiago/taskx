import 'package:taskX/core/domain/entities/task/task_entity.dart';

abstract class BaseRemoteTaskDataSource {
  Future<TaskEntity> createTask(TaskEntity task);
}
