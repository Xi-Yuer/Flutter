import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Instance {
  static final Dio dio =
      Dio(BaseOptions(baseUrl: "http://112.124.28.77:8888", connectTimeout: const Duration(seconds: 10000)));

  static Future request(String url, {String method = 'GET', Map<String, dynamic>? params, Interceptor? inter}) async {
    // 请求的单独配置
    final option = Options(method: method);

    // 全局拦截器
    Interceptor interceptor = InterceptorsWrapper(
      // 请求拦截
      onRequest: (options, handler) {
        if (kDebugMode) {
          print("请求拦截");
        }
        handler.next(options);
      },
      // 响应拦截
      onResponse: (response, responseInterceptorHandler) {
        if (kDebugMode) {
          print("响应拦截");
        }
        return responseInterceptorHandler.next(response);
      },
      // 错误拦截
      onError: (e, handler) => handler.next(e),
    );

    // 拦截器数组
    List<Interceptor> interceptorlist = [interceptor];

    // 添加单个请求的拦截器
    if (inter != null) {
      interceptorlist.add(inter);
    }

    dio.interceptors.addAll(interceptorlist);

    try {
      Response response = await dio.request(url, queryParameters: params, options: option);
      return response.data;
    } catch (err) {
      if (kDebugMode) {
        print("发生了错误");
      }
      return Future.error(err);
    }
  }

  static Future get(String url, {Map<String, dynamic>? params, Interceptor? inter}) {
    return request(url, method: 'GET', params: params, inter: inter);
  }

  static Future post(String url, {Map<String, dynamic>? params, Interceptor? inter}) {
    return request(url, method: 'POST', params: params, inter: inter);
  }

  static Future delete(String url, {Map<String, dynamic>? params, Interceptor? inter}) {
    return request(url, method: 'delete', params: params, inter: inter);
  }
}
