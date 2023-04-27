import 'package:taskX/core/utils/app_boxes.dart';
import 'package:taskX/features/category/data/datasources/local/base_local_category_datasource.dart';

import '../../../../../core/domain/entities/category/category_entity.dart';

class CategoryLocalDataSource implements BaseLocalCategoryDataSource {
  @override
  CategoryEntity? createCategory(CategoryEntity category) {
    try {
      final categoryBox = AppBoxes.categoryBox;
      final userBox = AppBoxes.userBox;
      var user = userBox.get(AppBoxesKeys.user);
      // Storage category created in local
      AppBoxes.categoryBox.add(category);
      user!.totalCategory = user.totalCategory! + 1;
      user.save();

      return category;
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool isInCategoriesLimit() {
    final userBox = AppBoxes.userBox;
    final user = userBox.get(AppBoxesKeys.user);

    /* 
      Check if it is not extrapolating the limit of categories that the user 
      can have 
    */
    if (user!.totalCategory! >= 5) {
      return true;
    } else {
      return false;
    }
  }

  @override
  List<CategoryEntity> loadCategories() {
    List<CategoryEntity> categories = AppBoxes.categoryBox.values.map(
      (category) {
        return category;
      },
    ).toList();

    return categories;
  }
}
