import 'package:taskX/features/category/domain/entities/category_entity.dart';

abstract class BaseRemoteCategoryDataSource {
  Future<CategoryEntity> createCategory(CategoryEntity category);
  Future<bool> IsInCategoriesLimit();
}
