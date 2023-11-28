import 'package:search_project/domain/entities/user.dart';
import 'package:search_project/data/model/user_entity.dart';
import 'package:search_project/core/mapper.dart';

class ToModel implements Mapper<UserEntity, User> {
  @override
  User call(UserEntity userEntity) {
    return User(
      id: userEntity.id,
      loginDate: userEntity.loginDate,
    );
  }
}
