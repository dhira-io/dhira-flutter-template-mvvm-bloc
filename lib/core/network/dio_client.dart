import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_di;
import '../error/exceptions.dart';
import '../storage/token_repository.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'session_manager.dart';

class DioClient {
  final String baseUrl;
  final SessionManager? sessionManager;
  late Dio _dio;

  DioClient({
    required this.baseUrl,
    this.sessionManager,
    List<Interceptor>? interceptors,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(get_di.Get.find<SecureStorageRepository>()),
      LoggingInterceptor(),
      if (interceptors != null) ...interceptors,
    ]);
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return NetworkException(message: 'Connection Timeout');
    }

    if (e.response != null) {
      if (e.response?.statusCode == 401) {
        sessionManager?.triggerSessionExpired();
        return UnauthorizedException(message: 'Unauthorized');
      }

      String? errorMessage;
      final data = e.response?.data;

      if (data is Map<String, dynamic>) {
        errorMessage = data['message'] ?? data['error'] ?? data['errorMessage'];
      } else if (data is String && data.isNotEmpty) {
        errorMessage = data;
      }

      return ServerException(
        message: errorMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
      );
    }

    return NetworkException(message: 'No Internet Connection');
  }
}
