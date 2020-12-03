import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/utils/price_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../common_color.dart';
import '../common_string.dart';
import 'common_cache_img_widget.dart';


///支付弹窗
class PayDialog extends Dialog {
  final dynamic _imgUrl;
  final String _title;
  final String _codeUrl;
  final int _price;
  final int _originPrice;
  final String codeDescribe;

  final bool isGiveCert;
  final bool isBuyVip;
  final VoidCallback clickSendWx;

  PayDialog(this._imgUrl, this._title, this._codeUrl, this._price,
      this._originPrice,
      {this.clickSendWx, this.isGiveCert = false,
        this.isBuyVip = false,
        this.codeDescribe = "${CommonString.BUY_COURSER}"});

  @override
  Widget build(BuildContext context) {
    return Material(
      //创建透明层
        type: MaterialType.transparency, //透明类型
        child: Center(
          child: Container(
            width: 285.w,
            height: 509.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                getTopImg(),
                getTitleText(),
                getPriceText(),
                getCenterWidget(),
              ],
            ),
          ),
        ));
  }

  ///顶部图片
  getTopImg() {
    return Container(
      width: 285.w,
      height:161.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top:Radius.circular(5))
      ),
      child: isBuyVip ? Image.asset(
        _imgUrl,fit: BoxFit.fill,
      ): CommonCacheImgWidget(_imgUrl,285.w,161.h),
    );
  }

  getTitleText() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 26.h, left: 15.w, right: 7.w),
      child: Text(
        _title ?? "",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: TextStyle(color: COLOR_2A3250, fontSize: 15.sp),
      ),
    );
  }

  ///金额
  getPriceText() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, top: 14.h),
      child: Row(
        children: [
          Text(
            '¥${PriceUtil.formatTotal(_price ?? 0)}',
            style: TextStyle(
              color: COLOR_FFA64B,
              fontSize: 14.sp,
            ),
          ),
          _originPrice == 0 ? Container() : Padding(
            padding: EdgeInsets.only(left: 5.0.h),
            child: Text(
              '¥${PriceUtil.formatTotal(_originPrice)}',
              style: TextStyle(
                  color: COLOR_777779,
                  fontSize: 14.sp,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
        ],
      ),
    );
  }

  ///中间到底部部分控件
  getCenterWidget() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: QrImage(
              data: _codeUrl,
              size: 105.w,
            ),
          ),
          Text(
            codeDescribe,
            style: TextStyle(
              color: COLOR_cc_777779,
              fontSize: 13.sp,
            ),
          ),
          InkWell(
            onTap: clickSendWx,
            child: Container(
              width: 155.w,
              height: 40.h,
              margin: EdgeInsets.only(top: 13.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: COLOR_FB9F4A, borderRadius: BorderRadius.circular(23)),
              child: Text(
                '微信好友',
                style: TextStyle(color: Colors.white, fontSize: 13.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w,top:27.h),
            child: Text(
              '${CommonString.BUY_SMALL_TIP}',
              style: TextStyle(color: COLOR_cc_777779, fontSize: 12.sp),
            ),
          )
        ],
      ),
    );
  }
}
