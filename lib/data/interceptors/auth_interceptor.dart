import 'dart:async';
import 'package:dio/dio.dart';
import 'package:smart_courier_assistant_app/data/datasource/local/secure_storage.dart';
import 'package:smart_courier_assistant_app/data/manager/session_manager.dart';

class AuthInterceptor implements Interceptor {
  final Dio _dio;
  final SecureStorage _secureStorage;
  final SessionManager _sessionManager;

  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  AuthInterceptor(
    this._dio,
    this._secureStorage,
    this._sessionManager,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isAuthRequest(options)) {
      return handler.next(options);
    }

    final accessToken = await _secureStorage.getToken('access');

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final refreshToken = await _secureStorage.getToken('refresh');

    // Нет refresh token — пользователь не авторизован
    if (refreshToken == null) {
      return handler.next(err);
    }

    final request = err.requestOptions;

    if (request.extra['retried'] == true) {
      await _logout();
      return handler.reject(err);
    }

    if (_isRefreshRequest(request)) {
      await _logout();
      return handler.reject(err);
    }

    try {
      await _refreshToken();

      final response = await _retryRequest(request);

      return handler.resolve(response);
    } catch (e) {
      await _logout();

      return handler.reject(err);
    }
  }

  Future<void> _refreshToken() async {
    if (!_isRefreshing) {
      _isRefreshing = true;
      _refreshCompleter = Completer<void>();

      try {
        await _updateToken();

        _refreshCompleter!.complete();
      } catch (e) {
        _refreshCompleter!.completeError(e);

        rethrow;
      } finally {
        _isRefreshing = false;
        _refreshCompleter = null;
      }
    } else {
      await _refreshCompleter!.future;
    }
  }

  Future<void> _updateToken() async {
    final refreshToken = await _secureStorage.getToken('refresh');

    if (refreshToken == null) {
      throw Exception('Refresh token is missing');
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.6:8000',
      ),
    );

    final response = await dio.post(
      '/auth/refresh',
      queryParameters: {
        'token': refreshToken,
      },
    );

    final data = response.data as Map<String, dynamic>;

    await _secureStorage.saveToken(
      'access',
      data['access_token'],
    );
  }

  Future<Response<dynamic>> _retryRequest(
    RequestOptions request,
  ) async {
    final accessToken = await _secureStorage.getToken('access');

    request.extra['retried'] = true;

    return _dio.request(
      request.path,
      data: request.data,
      queryParameters: request.queryParameters,
      options: Options(
        method: request.method,
        headers: {
          ...request.headers,
          'Authorization': 'Bearer $accessToken',
        },
        extra: request.extra,
      ),
    );
  }

  bool _isAuthRequest(RequestOptions options) {
    return options.path.contains('/auth/login') ||
        options.path.contains('/auth/register');
  }

  bool _isRefreshRequest(RequestOptions options) {
    return options.path.contains('/auth/refresh');
  }

  Future<void> _logout() async {
    await Future.wait([
      _secureStorage.deleteToken('access'),
      _secureStorage.deleteToken('refresh'),
    ]);

    _sessionManager.update(null);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }
}
