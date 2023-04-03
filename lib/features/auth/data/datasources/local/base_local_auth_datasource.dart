import '../../../../../core/domain/entities/user/entities/user_entity.dart';

abstract class BaseLocalAuthDataSource {
  UserEntity? getCurrentUser();
}
