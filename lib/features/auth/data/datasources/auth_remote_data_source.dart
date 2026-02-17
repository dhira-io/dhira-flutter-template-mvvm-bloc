import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String username, required String password});

  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<AuthModel> login({
    required String username,
    required String password,
  }) async {
    final response = await _dioClient.post(
      ApiConstants.endPointLogin,
      data: {'username': username, 'password': password},
    );

    return AuthModel.fromJson(response.data);
  }

  @override
  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    // DummyJSON users/add returns the added user
    final response = await _dioClient.post(
      ApiConstants.endPointRegister,
      data: {'firstName': name, 'email': email, 'password': password},
    );

    // DummyJSON doesn't return tokens on user add, so we add a placeholder
    return AuthModel.fromJson({...response.data, 'accessToken': 'dummy_token'});
  }
}
