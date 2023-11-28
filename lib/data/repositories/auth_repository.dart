import 'package:search_project/data/datasource/local/facade/secure_storage_interface.dart';
import 'package:search_project/data/datasource/network/api/authentication/authentication_api_interface.dart';
import 'package:search_project/domain/entities/result.dart';
import 'package:search_project/domain/entities/user.dart';
import 'package:search_project/domain/repository/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({
    required IAuthenticationApi authService,
    required ISecureStorage secureStorage,
  })  : _authService = authService,
        _secureStorage = secureStorage;
  final IAuthenticationApi _authService;
  final ISecureStorage _secureStorage;

  @override
  Future<Result<User>> login({
    required String email,
    required String password,
  }) async {
    // Request
    final response = await _authService.login(email, password);
    return response.when(
      onSuccess: Result<User>.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<User>> register({
    required String email,
    required String password,
  }) async {
    final response = await _authService.register(email, password);
    return response.when(
      onSuccess: Result<User>.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<User>> googleLogin() async {
    final response = await _authService.googleLogin();
    return response.when(
      onSuccess: Result<User>.success,
      onError: Result.error,
    );
  }

  @override
  Future<void> saveAuthToken(String token) async =>
      _secureStorage.saveToken(token: token);
}
