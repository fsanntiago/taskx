import 'package:taskX/core/utils/app_boxes.dart';
import 'package:taskX/features/auth/data/datasources/local/base_local_auth_datasource.dart';
import '../../../../../core/domain/entities/user/entities/user_entity.dart';

class LocalAuthDataSource implements BaseLocalAuthDataSource {
  @override
  UserEntity? getCurrentUser() {
    final userBox = AppBoxes.userBox;
    final user = userBox.get(AppBoxesKeys.user);

    return user;
  }
}
