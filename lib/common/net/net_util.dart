import 'package:dio/dio.dart';
import 'package:flutter_base_app/bean/result_entity.dart';
import 'package:flutter_base_app/generated/json/base/json_convert_content.dart';
import '../config.dart';
import 'interceptors/log_interceptor.dart';
import 'interceptors/token_interceptor.dart';
import 'net_code.dart';
import 'net_url.dart';

enum Method {
  GET,
  POST,
  UPLOAD,
  DOWNLOAD,
}

// typedef success = Function<T>(T t);
// typedef error = Function(String errorMsg);

class HttpManager<T> {
  static final HttpManager _singleton = HttpManager._init();

  Dio _dio;

  static HttpManager _getInstance() {
    return _singleton;
  }

  factory HttpManager() {
    return _getInstance();
  }

  HttpManager._init() {
    _dio = new Dio(BaseOptions(headers: {
      // HttpHeaders.acceptHeader:"aplication/json"
    }));
    _dio.interceptors.add(TokenInterceptor());
    if (Config.isDebug()) {
      _dio.interceptors.add(CustomLogInterceptor());
    }
  }

  Dio getDio() {
    return _dio;
  }

  Future get(url, {params}) async {
    return await _request(url, params, Method.GET);
  }

  Future post(url, {params}) async {
    return await _request(url, params, Method.POST);
  }

  Future download(url, {params, downLoadPath}) async {
    return await _request(url, params, Method.DOWNLOAD,
        downLoadPath: downLoadPath);
  }

  Future upload(url, {params, formData}) async {
    return await _request(url, params, Method.UPLOAD, formData: formData);
  }

  Future _request(url, params, Method method,
      {FormData formData, String downLoadPath}) async {
    try {
      url = base_url + url;

      Response response;

      switch (method) {
        case Method.GET:
          {
            if (params != null) {
              response = await _dio.get(url, queryParameters: params);
            } else {
              response = await _dio.get(url);
            }
          }
          break;
        case Method.POST:
          if (formData == null) {
            response = await _dio.post(url, data: params);
          } else {
            response = await _dio.post(url, data: formData);
          }
          break;
        case Method.UPLOAD:
          response = await _dio.post(url, data: formData);
          break;
        case Method.DOWNLOAD:
          response = await _dio.download(url, downLoadPath);
          break;
      }
      return await handlerResponseData(response, method);
    } catch (e) {
      return ResultEntity('自定义状态码', '${url}------>error----->${e}');
    }
  }

  handlerResponseData(Response response, Method method) async {
    ///自定义code
    String code;
    String msg;
    var data;

    if (response.statusCode == 200) {
      code = response.data['code'];
      msg = response.data['msg'];

      if (response.data['code'] == SUCESS_CODE) {
        data = response.data['data'];
        if (method == Method.DOWNLOAD) {
          msg = '下载成功';
        }
      } else {
        if (method == Method.DOWNLOAD) {
          msg = '下载失败';
        }
      }
    } else {
      code = '${response.statusCode}';
      msg = '服务器异常----------->状态码为: ${response.statusCode}';
    }
    return ResultEntity(code, msg, data: data);
  }
}
