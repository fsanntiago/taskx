import 'package:taskX/core/domain/entities/category/category_entity.dart';

abstract class BaseRemoteHomeDataSource {
  Future<List<CategoryEntity>> homeLoadCategories();
}
