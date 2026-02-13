import 'package:dio/dio.dart';
import '../../storage/token_repository.dart';

class AuthInterceptor extends Interceptor {
  final TokenRepository _tokenRepository;

  AuthInterceptor(this._tokenRepository);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenRepository.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }
}
