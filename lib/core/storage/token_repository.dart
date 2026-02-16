import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_app/core/constants/app_constants.dart';

abstract class SecureStorageRepository {
  Future<void> saveValue(String key, String value);
  Future<String?> getValue(String key);
  Future<void> deleteValue(String key);
  Future<void> deleteAll();

  // Convenience methods for tokens
  Future<void> saveAccessToken(String token);
  Future<String?> getAccessToken();
  Future<void> saveRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> deleteAuthData();
}

class SecureStorageRepositoryImpl implements SecureStorageRepository {
  final FlutterSecureStorage _storage;

  SecureStorageRepositoryImpl(this._storage);

  @override
  Future<void> saveValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> getValue(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> deleteValue(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  @override
  Future<void> saveAccessToken(String token) {
    return saveValue(AppConstants.accessTokenKey, token);
  }

  @override
  Future<String?> getAccessToken() {
    return getValue(AppConstants.accessTokenKey);
  }

  @override
  Future<void> saveRefreshToken(String token) {
    return saveValue('refresh_token', token);
  }

  @override
  Future<String?> getRefreshToken() {
    return getValue('refresh_token');
  }

  @override
  Future<void> deleteAuthData() async {
    await deleteValue(AppConstants.accessTokenKey);
    await deleteValue('refresh_token');
  }
}
