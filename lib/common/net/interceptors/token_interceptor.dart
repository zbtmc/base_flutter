import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/common/local/local_storage.dart';
import 'package:flutter_base_app/common/local/local_storage_key.dart';
import 'package:flutter_base_app/pages/login/login_page.dart';

import '../../../main.dart';

class TokenInterceptor extends InterceptorsWrapper {
  String token;

  @override
  Future onRequest(RequestOptions options) async {
    await getAuthorization();

    if (token != null && token != "") {
      options.headers['token'] = token;
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    ///登录失效
    if ((response.data['code'] is int) && response.data['code'] == 401) {
      clearToken();
     // jumpToLogin();
    }

    return super.onResponse(response);
  }

  getAuthorization() async {
    token = await LocalStorage.get(LocalStorageKey.TOKEN_KEY);
  }

  clearToken() async {
    await LocalStorage.remove(LocalStorageKey.TOKEN_KEY);
  }

  void jumpToLogin() {
    Navigator.push(
      navigatorKey.currentContext,
      MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      }),
    );
  }
}
