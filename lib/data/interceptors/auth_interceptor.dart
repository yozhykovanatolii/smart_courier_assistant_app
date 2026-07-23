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
    if (options.path.contains('/auth/login') ||
        options.path.contains('/auth/register')) {
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
    if (_isRefreshRequest(err.requestOptions)) {
      await _logOut();
      return handler.next(err);
    }
    try {
      await _refreshToken();
      final response = await _retryRequest(err.requestOptions);
      return handler.resolve(response);
    } catch (_) {
      await _logOut();
      return handler.next(err);
    }
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final token = await _secureStorage.getToken('access');
    requestOptions.headers['Authorization'] = 'Bearer $token';
    return _dio.fetch(requestOptions);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  Future<void> _refreshToken() async {
    if (_isRefreshing) {
      return _refreshCompleter!.future;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<void>();
    try {
      final refreshToken = await _secureStorage.getToken('refresh');
      print(refreshToken);
      final response = await _dio.post(
        '/auth/refresh',
        queryParameters: {'token': refreshToken},
      );
      final data = response.data as Map<String, dynamic>;
      await _secureStorage.saveToken('access', data['access_token']);
      _refreshCompleter!.complete();
    } catch (e) {
      _refreshCompleter!.completeError(e);
      rethrow;
    } finally {
      _isRefreshing = false;
    }
  }

  bool _isRefreshRequest(RequestOptions options) {
    return options.path == '/auth/refresh';
  }

  Future<void> _logOut() async {
    await Future.wait([
      _secureStorage.deleteToken('access'),
      _secureStorage.deleteToken('refresh'),
    ]);
    _sessionManager.update(null);
  }
}
