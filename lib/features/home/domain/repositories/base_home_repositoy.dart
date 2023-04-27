import 'package:dartz/dartz.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/error/failure.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> homeLoadCategories();
}
