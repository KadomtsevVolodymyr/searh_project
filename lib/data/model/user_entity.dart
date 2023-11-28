import 'package:floor/floor.dart';

@entity
class UserEntity {
  UserEntity({required this.id, this.email, this.password, required this.loginDate});

  @PrimaryKey()
  final String id;
  final String? email;
  final String? password;
  final DateTime loginDate;
}
