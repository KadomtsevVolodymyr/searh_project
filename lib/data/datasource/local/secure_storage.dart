import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:search_project/data/datasource/local/facade/secure_storage_interface.dart';

class SecureStorage implements ISecureStorage {
  SecureStorage({required secureStorage}) : _secureStorage = secureStorage;

  static const _accessTokenKey = "access_token";
  static const _refreshTokenKey = "refresh_token_key";

  final FlutterSecureStorage _secureStorage;

  //
  // Access token
  //
  @override
  Future<String?> getToken() async =>
      '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';

  @override
  Future<void> saveToken({required String token}) async =>
      await _secureStorage.write(
        key: _accessTokenKey,
        value: token,
      );

  @override
  Future<void> removeToken() async =>
      _secureStorage.delete(key: _accessTokenKey);

  //
  // Refresh token
  //
  @override
  Future<String?> getRefreshToken() async =>
      await _secureStorage.read(key: _refreshTokenKey);

  @override
  Future<void> removeRefreshToken() async =>
      await _secureStorage.delete(key: _refreshTokenKey);

  @override
  Future<void> saveRefreshToken({required String token}) async =>
      await _secureStorage.write(
        key: _refreshTokenKey,
        value: token,
      );
}
