import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/category/category_entity.dart';
import '../../../../core/error/failure.dart';
import '../repositories/base_category_repository.dart';

class CreateCategoryUseCase {
  final BaseCategoryRepository categoryRepository;

  CreateCategoryUseCase({required this.categoryRepository});

  Future<Either<Failure, CategoryEntity>> call(CategoryEntity category) {
    return categoryRepository.createCategory(category);
  }
}
