import 'package:search_project/data/datasource/network/exchange_models/response.dart';
import 'package:search_project/domain/entities/user.dart';

abstract interface class IAuthenticationApi {
  Future<NetworkResponse<User>> register(
    String email,
    String password,
  );

  Future<NetworkResponse<User>> login(
    String email,
    String password,
  );

  Future<NetworkResponse<User>> googleLogin();
}
