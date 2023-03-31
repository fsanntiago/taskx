import 'package:taskX/features/credential/domain/entities/user_entity.dart';

abstract class BaseLocalAuthDataSource {
  UserEntity? getCurrentUser();
}
