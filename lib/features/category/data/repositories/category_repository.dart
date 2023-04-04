// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:taskX/core/error/error_handler.dart';
import 'package:taskX/core/error/error_messages.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/core/network/connectivity_checker.dart';
import 'package:taskX/features/category/data/datasources/local/base_local_category_datasource.dart';
import 'package:taskX/features/category/data/datasources/remote/base_remote_category_datasource.dart';
import 'package:taskX/features/category/domain/repositories/base_category_repository.dart';

import '../../../../core/domain/entities/category/category_entity.dart';

class CategoryRepository implements BaseCategoryRepository {
  final BaseRemoteCategoryDataSource remoteCategoryDataSource;
  final BaseLocalCategoryDataSource localCategoryDataSource;
  final BaseCheckInternetConnectivity checkInternetConnectivity;

  CategoryRepository({
    required this.remoteCategoryDataSource,
    required this.localCategoryDataSource,
    required this.checkInternetConnectivity,
  });

  @override
  Future<Either<Failure, CategoryEntity>> createCategory(
    CategoryEntity category,
  ) async {
    try {
      if (await checkInternetConnectivity.isConnected()) {
        final result = await remoteCategoryDataSource.createCategory(category);
        return Right(result);
      } else {
        final result = localCategoryDataSource.createCategory(category);
        if (result == null) {
          return const Left(Failure(ErrorMessages.networkConnectionFailed));
        }

        return Right(result);
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> IsInCategoriesLimit() async {
    try {
      if (await checkInternetConnectivity.isConnected()) {
        final result = await remoteCategoryDataSource.isInCategoriesLimit();
        return Right(result);
      } else {
        final result = localCategoryDataSource.isInCategoriesLimit();
        return Right(result!);
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
