import 'package:search_project/domain/entities/result.dart';
import 'package:search_project/domain/entities/user.dart';

abstract interface class IAuthRepository {
  Future<Result<User>> register({
    required String email,
    required String password,
  });

  Future<Result<User>> login({required String email, required String password});

  Future<Result<User>> googleLogin();

  Future<void> saveAuthToken(String token);
}
