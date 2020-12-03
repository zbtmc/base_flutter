import 'package:intl/intl.dart';

///服务端返回的价格单位为分
class PriceUtil {
  static String formatTotal(int totalPrice) {
    /*在这里统一处理： 现在服务端所有与金额有关的都是以“分”为单位的*/
    NumberFormat df = new NumberFormat("######0.00");
    return df.format(totalPrice / 100);
  }
}
