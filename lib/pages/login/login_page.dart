import 'package:flutter/material.dart';
import 'package:flutter_base_app/base/base_view_model.dart';
import 'package:flutter_base_app/base/base_view_model_page.dart';
import 'package:flutter_base_app/common/widget/common_button.dart';
import 'package:flutter_base_app/common/widget/page_scaffold.dart';
import 'package:flutter_base_app/view_model/login_view_model.dart';
import '../../common/common_color.dart';

///登录页面
class LoginPage extends BaseViewModelPage<LoginViewModel> {

  LoginPage():super(provider: LoginViewModel());

  @override
  Widget buildContent(BuildContext context) {
    return LoginContent(provider);
  }
}

///登录控件
class LoginContent extends StatelessWidget {
  final LoginViewModel _loginViewModel;

  LoginContent(this._loginViewModel);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "登录",
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
        child: Column(
          children: [
            InputFiedWithEaysWidget(
              labelText: '请输入手机号',
              hintText: '请输入手机号',
              controller: _loginViewModel.accountController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: InputFiedWithEaysWidget(
                labelText: '请输入密码',
                hintText: '请输入密码，字母和数字组合，6–12位',
                isPwd: true,
                controller: _loginViewModel.pwdController,
              ),
            ),
            CommonBtn(
                _loginViewModel.viewState == ViewState.FINISH ? "登录成功啦" : "登录",
                () {
              _loginViewModel.doLogin(context);
            })
          ],
        ),
      ),
    );
  }
}

class InputFiedWithEaysWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String imgPath;
  final bool isPwd;
  final TextEditingController controller;

  InputFiedWithEaysWidget(
      {this.labelText,
      this.hintText,
      this.isPwd = false,
      this.imgPath,
      @required this.controller});

  @override
  _InputFiedWithEaysWidgetState createState() =>
      _InputFiedWithEaysWidgetState();
}

class _InputFiedWithEaysWidgetState extends State<InputFiedWithEaysWidget> {
  bool showPwd = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: widget.controller,
          cursorColor: COLOR_PRIMARY,
          obscureText: widget.isPwd && showPwd,
          //是否是密码
          cursorHeight: 23,
          decoration: InputDecoration(
              suffix: getEyesImg(),
              labelText: widget.labelText,
              hintText: widget.hintText,
              border: OutlineInputBorder()),
        ),
      ],
    );
  }

  getEyesImg() {
    return InkWell(
      onTap: () {
        setState(() {
          showPwd = !showPwd;
        });
      },
      child: Icon(
          showPwd ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_sharp),
    );
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }
}
