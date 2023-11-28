import 'dart:async';
import 'package:dio/dio.dart';
import 'package:search_project/data/datasource/network/exchange_models/response.dart';
import 'package:search_project/data/datasource/network/exchange_models/request.dart';

typedef OnParse<T> = T Function(Response<dynamic>);

abstract interface class INetworkService {
  INetworkService({
    String? baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    Iterable<Interceptor>? interceptors,
  });

  set baseUrl(String url);

  Future<NetworkResponse<T>> request<T>(
    NetworkRequest request, {
    OnParse? onParse,
    ProgressCallback? onSentProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  });
}
