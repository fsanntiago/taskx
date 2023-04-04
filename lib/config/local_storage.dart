import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';

import '../core/domain/entities/user/entities/user_entity.dart';
import '../core/utils/app_boxes.dart';

class LocalStorage {
  LocalStorage._();

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserEntityAdapter());
    Hive.registerAdapter(CategoryEntityAdapter());

    await Hive.openBox<UserEntity>(AppBoxesName.userBox);
    await Hive.openBox<CategoryEntity>(AppBoxesName.categoryBox);
  }
}
