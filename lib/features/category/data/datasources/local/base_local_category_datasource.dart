import '../../../../../core/domain/entities/category/category_entity.dart';

abstract class BaseLocalCategoryDataSource {
  CategoryEntity? createCategory(CategoryEntity category);
  bool isInCategoriesLimit();
  List<CategoryEntity> loadCategories();
}
