import '../../../core/network/dio_client.dart';
import 'auth_model.dart';
import '../../../core/error/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String email, required String password});

  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(DioClient _);

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'user@dhira.io' && password == 'password123') {
      return const AuthModel(
        id: '1',
        email: 'user@dhira.io',
        name: 'Dhira User',
        token: 'dummy_token_123',
      );
    } else {
      throw ServerException(message: 'Invalid credentials', code: 401);
    }
  }

  @override
  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    return AuthModel(
      id: '2',
      email: email,
      name: name,
      token: 'dummy_token_456',
    );
  }
}
