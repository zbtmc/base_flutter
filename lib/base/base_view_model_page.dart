import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///viewmodel包装类
abstract class BaseViewModelPage<T extends ChangeNotifier>
    extends StatelessWidget {
  final T provider;

  /// 构造函数
  /// [params] 页面跳转的参数
  BaseViewModelPage({@required this.provider, List<dynamic> params});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: provider, child: buildContent(context));
  }

  Widget buildContent(BuildContext context);
}
