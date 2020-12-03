import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBtn extends StatelessWidget {
  String _btnText;
  double height;
  double width;
  VoidCallback _callback;

  CommonBtn(this._btnText, this._callback,{this.height=45,this.width=double.infinity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _callback,
      child: Container(
        ///强制充满整行
        width: width.w,
        height: height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xffFB9F4A),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        margin: EdgeInsets.only(top: 35.0, left: 25, right: 25),
        child: Text(
          _btnText,
          style: TextStyle(
              color: Colors.white, fontSize: 16.sp, wordSpacing: 12.0),
        ),
      ),
    );
  }
}
