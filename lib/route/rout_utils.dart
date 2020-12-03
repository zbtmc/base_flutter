

import 'package:flutter/material.dart';
import 'package:flutter_base_app/pages/login/login_page.dart';

import '../main.dart';

class RoutUtils{
  static jump2Login(){
    Navigator.push(navigatorKey.currentContext, MaterialPageRoute(builder: (BuildContext context)=>LoginPage()));
  }
}