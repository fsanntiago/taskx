import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';

import '../core/utils/app_boxes.dart';

class LocalStorage {
  LocalStorage._();

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserEntityAdapter());

    await Hive.openBox<UserEntity>(AppBoxesName.userBox);
  }
}
