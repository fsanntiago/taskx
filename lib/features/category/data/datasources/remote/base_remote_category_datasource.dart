import '../../../../../core/domain/entities/category/category_entity.dart';

abstract class BaseRemoteCategoryDataSource {
  Future<CategoryEntity> createCategory(CategoryEntity category);
  Future<bool> isInCategoriesLimit();
}
