import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:search_project/core/logger.dart';
import 'package:search_project/data/datasource/local/facade/secure_storage_interface.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({
    required ISecureStorage authStore,
  }) : _authStore = authStore {
    logger.i('Create TokenInterceptor');
  }

  final ISecureStorage _authStore;

  final Logger logger = getLogger('TokenInterceptor');

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logger.i('onRequest, ${options.baseUrl + options.path}');

    final String token = await _authStore.getToken() ?? '';

    options.headers['Authorization'] = 'Bearer $token';

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.i('in onError, code: ${err.response?.statusCode}');

    // On Unauthenticated error
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      logger.i('defined unauthenticated error');

      // Refresh token
      logger.i('refresh token ...');
      //final refreshResult = await GetIt.I.get<SessionCubit>().refreshToken();
      final refreshResult = true;
      logger.i('... refreshResult: $refreshResult');

      // If refresh successful, repeat request
      if (refreshResult) {
        /*// New options
        final newOptions = Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
        );
        logger.i('created new options: $newOptions');

        // Repeat request
        logger.i('perform new request');
        final cloneRequest = await GetIt.I.get<Dio>().request(
              err.requestOptions.path,
              options: newOptions,
              data: err.requestOptions.data,
              queryParameters: err.requestOptions.queryParameters,
            );

        // Return updated response
        logger.i('resolve handler with new response');
        handler.resolve(cloneRequest);*/

        return;
      }
    }

    logger.i('proceed with error');
    handler.next(err);
  }
}
