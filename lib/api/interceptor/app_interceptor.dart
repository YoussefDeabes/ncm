import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ncm/api/api_keys.dart';

class AppInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[ApiKeys.accept] = ApiKeys.applicationJson;
    options.headers[ApiKeys.contentType] = ApiKeys.applicationJson;

    log("Request Path :: ${options.path}  -- Data :: ${options.data}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("Response :: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("error : ${err.error.toString()}");
    handler.resolve(err.response!);
  }
}