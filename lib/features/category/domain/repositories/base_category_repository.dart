import 'package:dartz/dartz.dart';
import 'package:taskX/core/error/failure.dart';

import '../../../../core/domain/entities/category/category_entity.dart';

abstract class BaseCategoryRepository {
  Future<Either<Failure, CategoryEntity>> createCategory(
    CategoryEntity category,
  );
  Future<Either<Failure, bool>> IsInCategoriesLimit();
  Future<Either<Failure, List<CategoryEntity>>> loadCategories();
}
