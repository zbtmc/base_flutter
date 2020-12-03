import 'package:flutter_base_app/bean/login_entity.dart';
import 'package:flutter_base_app/bean/result_entity.dart';
import 'package:flutter_base_app/common/net/net_url.dart';
import 'package:flutter_base_app/common/net/net_util.dart';
import 'package:flutter_base_app/utils/app_util.dart';

class LoginService {
  // Stream<ResultBean> doLogin(String account, String pwd) =>
  //     Stream.fromFuture(HttpManager().post(servicePath[login], params: {
  //       "mobile": account,
  //       "uuid": AppUtil.getUUid(),
  //       "terminal": "1",
  //       "password": pwd
  //     }));
  Future<ResultEntity> doLogin(String account, String pwd) async=>
      await HttpManager().post(servicePath[login], params: {
        "mobile": account,
        "uuid": await AppUtil.getUUid(),
        "terminal": "1",
        "password": pwd
      }).then((value) => value) ;
}
