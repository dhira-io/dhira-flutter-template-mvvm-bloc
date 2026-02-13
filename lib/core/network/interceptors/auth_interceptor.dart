import 'dart:io';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
    final packageInfo = await PackageInfo.fromPlatform();

    options.headers.addAll({
      if (token != null) 'Authorization': 'Bearer $token',
      if (token != null) 'token': token,
      'zone': DateTime.now().timeZoneName,
      'buildVersionCode': packageInfo.buildNumber,
      'buildVersionName': packageInfo.version,
      'platform': Platform.isAndroid ? 'Android' : 'iOS',
    });

    return super.onRequest(options, handler);
  }
}
