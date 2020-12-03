import 'package:flutter/material.dart';
import 'package:flutter_base_app/route/rout_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          RoutUtils.jump2Login();
        },
        child: Container(
          width: 500,
          height: 1000,
          child: Text('主页'),
        ));
  }
}
