import 'package:hive/hive.dart';

import '../domain/entities/user/entities/user_entity.dart';

class AppBoxesName {
  AppBoxesName._();
  static const userBox = 'userBox';
}

class AppBoxes {
  AppBoxes._();
  static Box<UserEntity> get userBox =>
      Hive.box<UserEntity>(AppBoxesName.userBox);
}

class AppBoxesKeys {
  AppBoxesKeys._();
  static const String user = 'user';
}
