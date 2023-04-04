import 'package:hive/hive.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';

import '../domain/entities/user/entities/user_entity.dart';

class AppBoxesName {
  AppBoxesName._();
  static const userBox = 'userBox';
  static const categoryBox = 'categoryBox';
}

class AppBoxes {
  AppBoxes._();
  static Box<UserEntity> get userBox =>
      Hive.box<UserEntity>(AppBoxesName.userBox);

  static Box<CategoryEntity> get categoryBox =>
      Hive.box<CategoryEntity>(AppBoxesName.categoryBox);
}

class AppBoxesKeys {
  AppBoxesKeys._();
  static const String user = 'user';
  static const String category = 'category';
}
