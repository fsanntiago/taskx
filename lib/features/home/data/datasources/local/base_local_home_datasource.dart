import 'package:taskX/core/domain/entities/category/category_entity.dart';

abstract class BaseLocalHomeDataSource {
  List<CategoryEntity> homeLoadCategories();
}
