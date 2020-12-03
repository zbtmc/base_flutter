import 'package:flutter/material.dart';
import 'package:flutter_base_app/utils/reg_utils.dart';
import 'package:flutter_base_app/utils/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_color.dart';
import '../common_string.dart';

typedef ClickConfirm = Function(String inputText);
typedef ClickCancel = Function();

class BindCompanyDialog extends Dialog {
  final String title;
  final String content;
  final ClickCancel clickCancel;
  final ClickConfirm _clickConfirm;

  final TextEditingController _controller = TextEditingController();

  BindCompanyDialog(this._clickConfirm,
      {this.title, this.content, this.clickCancel});

  @override
  Widget build(BuildContext context) {
    return Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型
        child: Center(
          child: Container(
            width: 300.w,
            height: 205.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    title ?? "",
                    style: TextStyle(fontSize: 18.sp, color: COLOR_494949),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    content ?? "",
                    style: TextStyle(fontSize: 14.sp, color: COLOR_666666),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50.h,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: CommonString.INPUT_HOUSE_KEEPER_PHONE,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.w, color: Colors.black))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Divider(
                    height: 1.h,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: clickCancel ??
                            () {
                              closeDialog(context);
                            },
                        child: Text(
                          CommonString.CANCEL,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      )),
                      VerticalDivider(
                        width: 1.w,
                        color: Colors.black,
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          doConfirm(context);
                        },
                        child: Text(
                          CommonString.CONFIRM,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void doConfirm(BuildContext context) {

    if (_controller.text.isEmpty) {
      ToastUtil.showToast('请输入手机号');
      return;
    }

    if (_controller.text.length<11 ||!RegUtils.isPhone(_controller.text)) {
      ToastUtil.showToast('请输入正确的手机号');
      return;
    }

    _clickConfirm(_controller.text);
    closeDialog(context);
  }

  void closeDialog(BuildContext context){
    _controller.dispose();
    Navigator.pop(context);
  }
}
