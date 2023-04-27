// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/features/home/domain/repositories/base_home_repositoy.dart';

class HomeLoadCategoriesUseCase {
  final BaseHomeRepository homeRepository;

  HomeLoadCategoriesUseCase({
    required this.homeRepository,
  });

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return homeRepository.homeLoadCategories();
  }
}
