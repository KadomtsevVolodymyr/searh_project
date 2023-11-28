import 'package:search_project/domain/entities/user.dart';
import 'package:search_project/data/model/user_entity.dart';
import 'package:search_project/core/mapper.dart';

class ToUserEntity implements Mapper<User, UserEntity> {
  @override
  UserEntity call(User user) {
    return UserEntity(
      id: user.id,
      loginDate: user.loginDate,
    );
  }
}
