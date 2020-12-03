import 'package:flutter/material.dart';
import 'package:flutter_base_app/common/local/local_storage.dart';
import 'package:flutter_base_app/common/local/local_storage_key.dart';

import '../main.dart';

class LoginUtils{
  static Future<bool> isLogin() async {
    String token = await LocalStorage.get(LocalStorageKey.TOKEN_KEY);
    return token?.isNotEmpty??false;
  }
}