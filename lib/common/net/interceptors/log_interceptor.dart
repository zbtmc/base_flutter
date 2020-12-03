
import 'package:dio/dio.dart';

class CustomLogInterceptor extends InterceptorsWrapper{
  @override
  Future onRequest(RequestOptions options) {
    print("\n================== 请求数据 ==========================");
    print("url = ${options.uri.toString()}");
    print("headers = ${options.headers}");
    print("params = ${options}");

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print("\n================== 响应数据 ==========================");
    print("code = ${response.statusCode}");
    print("data = ${response}");
    print("\n");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError e) {
    print("\n================== 错误响应数据 ======================");
    print("type = ${e.type}");
    print("message = ${e.message}");
    print("\n");
    return super.onError(e);
  }
}