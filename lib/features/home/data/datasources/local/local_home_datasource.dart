import 'package:taskX/core/domain/entities/category/category_entity.dart';

import '../../../../../core/utils/app_boxes.dart';
import 'base_local_home_datasource.dart';

class LocalHomeDataSource implements BaseLocalHomeDataSource {
  @override
  List<CategoryEntity> homeLoadCategories() {
    List<CategoryEntity> categories = AppBoxes.categoryBox.values.map(
      (category) {
        return category;
      },
    ).toList();

    return categories;
  }
}
