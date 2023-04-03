import 'package:dartz/dartz.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/features/category/domain/entities/category_entity.dart';

abstract class BaseCategoryRepository {
  Future<Either<Failure, CategoryEntity>> createCategory(
    CategoryEntity category,
  );

  Future<Either<Failure, bool>> IsInCategoriesLimit();
}
