// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:taskX/core/error/error_handler.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/features/category/data/datasources/remote/base_remote_category_datasource.dart';
import 'package:taskX/features/category/domain/entities/category_entity.dart';
import 'package:taskX/features/category/domain/repositories/base_category_repository.dart';

class CategoryRepository implements BaseCategoryRepository {
  final BaseRemoteCategoryDataSource remoteCategoryDataSource;

  CategoryRepository({
    required this.remoteCategoryDataSource,
  });

  @override
  Future<Either<Failure, CategoryEntity>> createCategory(
    CategoryEntity category,
  ) async {
    try {
      final result = await remoteCategoryDataSource.createCategory(category);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> IsInCategoriesLimit() async {
    try {
      final result = await remoteCategoryDataSource.IsInCategoriesLimit();
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
