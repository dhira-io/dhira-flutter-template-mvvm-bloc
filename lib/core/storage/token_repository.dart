import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dhira_flutter_template/core/constants/app_constants.dart';

abstract class TokenRepository {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

class TokenRepositoryImpl implements TokenRepository {
  final FlutterSecureStorage _storage;

  TokenRepositoryImpl(this._storage);

  @override
  Future<void> saveToken(String token) {
    return _storage.write(key: AppConstants.accessTokenKey, value: token);
  }

  @override
  Future<String?> getToken() {
    return _storage.read(key: AppConstants.accessTokenKey);
  }

  @override
  Future<void> deleteToken() {
    return _storage.delete(key: AppConstants.accessTokenKey);
  }
}
