import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/category_entity.dart';
import '../repositories/base_category_repository.dart';

class CreateCategoryUseCase {
  final BaseCategoryRepository categoryRepository;

  CreateCategoryUseCase({required this.categoryRepository});

  Future<Either<Failure, CategoryEntity>> call(CategoryEntity category) {
    return categoryRepository.createCategory(category);
  }
}
