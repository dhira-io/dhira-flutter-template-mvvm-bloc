import '../../../core/network/dio_client.dart';
import 'auth_model.dart';
import 'models/auth_requests_responses.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String email, required String password});

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
    required String email,
    required String password,
  }) async {
    final response = await _dioClient.post(
      '/login',
      data: {'email': email, 'password': password},
    );

    final loginResponse = LoginResponse.fromJson(response.data);
    return AuthModel(
      id: '0', // ReqRes doesn't return ID on login
      email: email,
      token: loginResponse.token,
    );
  }

  @override
  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _dioClient.post(
      '/register',
      data: {'email': email, 'password': password},
    );

    final registerResponse = RegisterResponse.fromJson(response.data);
    return AuthModel(
      id: registerResponse.id.toString(),
      email: email,
      name: name,
      token: registerResponse.token,
    );
  }
}
