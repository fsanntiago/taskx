import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/base_category_repository.dart';

class IsInCategoriesLimitUseCase {
  final BaseCategoryRepository categoryRepository;

  IsInCategoriesLimitUseCase({required this.categoryRepository});

  Future<Either<Failure, bool>> call() {
    return categoryRepository.IsInCategoriesLimit();
  }
}
