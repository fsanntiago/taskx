// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/error/error_handler.dart';
import 'package:taskX/core/error/failure.dart';
import 'package:taskX/core/network/connectivity_checker.dart';
import 'package:taskX/features/home/data/datasources/local/base_local_home_datasource.dart';
import 'package:taskX/features/home/domain/repositories/base_home_repositoy.dart';

import '../datasources/remote/base_remote_home_datasource.dart';

class HomeRepositoy extends BaseHomeRepository {
  final BaseRemoteHomeDataSource remoteHomeDataSource;
  final BaseLocalHomeDataSource localHomeDataSource;
  final BaseCheckInternetConnectivity checkInternetConnectivity;

  HomeRepositoy({
    required this.remoteHomeDataSource,
    required this.localHomeDataSource,
    required this.checkInternetConnectivity,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> homeLoadCategories() async {
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final categories = await remoteHomeDataSource.homeLoadCategories();
        return Right(categories);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      final user = localHomeDataSource.homeLoadCategories();
      return Right(user);
    }
  }
}
