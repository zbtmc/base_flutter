import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/base/base_view_model.dart';
import 'package:flutter_base_app/bean/login_entity.dart';
import 'package:flutter_base_app/bean/result_entity.dart';
import 'package:flutter_base_app/common/common_string.dart';
import 'package:flutter_base_app/common/local/local_storage.dart';
import 'package:flutter_base_app/common/local/local_storage_key.dart';
import 'package:flutter_base_app/common/net/net_code.dart';
import 'package:flutter_base_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_base_app/service/login_service.dart';
import 'package:flutter_base_app/utils/reg_utils.dart';
import 'package:flutter_base_app/utils/toast_util.dart';

class LoginViewModel extends BaseViewModel {
  LoginService _loginService = LoginService();

  TextEditingController accountController =
      TextEditingController(text: "18333333333");
  TextEditingController pwdController = TextEditingController(text: "abc123");

  LoginViewModel();

  void doLogin(BuildContext context) {
    if (!validInput()) return;

    _loginService
        .doLogin(accountController.text, pwdController.text)
        .then((value) async {
      if (value.code == SUCESS_CODE) {
        LoginEntity loginBean = JsonConvert.fromJsonAsT<LoginEntity>(value.data);
        await LocalStorage.save(LocalStorageKey.TOKEN_KEY, loginBean.token);
      } else {
        ToastUtil.showToast(value.msg ?? CommonString.UNKNOWN_EXCEPTION);
        setViewState(ViewState.IDLE);
      }
    });
  }

  bool validInput() {
    if (accountController.text == null || accountController.text.isEmpty) {
      ToastUtil.showToast('账号不能为空');
      return false;
    }
    if (!RegUtils.isPhone(accountController.text)) {
      ToastUtil.showToast("账号不正确");
      return false;
    }
    if (pwdController.text == null || pwdController.text == '') {
      ToastUtil.showToast('密码不能为空');
      return false;
    }
    if (pwdController.text.length < 6 ||
        !RegUtils.checkPwd(pwdController.text)) {
      ToastUtil.showToast('密码不符合要求,字母和数字组合,6–12位');
      return false;
    }

    return true;
  }
}
