import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefreshAndLoad extends StatefulWidget {
  RefreshController controller;

  Widget child;
  bool enablePullDown;
  bool enablePullUp;

  Function onRefresh;
  Function onLoading;

  CustomRefreshAndLoad({
    Key key,
    @required this.controller,
    this.child,
    this.enablePullDown: true,
    this.enablePullUp: true,
    this.onRefresh,
    this.onLoading,
  }):super(key: key);

  @override
  _CustomRefreshAndLoadState createState() => _CustomRefreshAndLoadState();
}

class _CustomRefreshAndLoadState extends State<CustomRefreshAndLoad> {


  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      child: widget.child,
      enablePullDown: true,
      enablePullUp: true,
      controller: widget.controller,
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoading,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text('加载中，请稍后...zzz');
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text('加载失败，请重试...zzz');
          } else if (mode == LoadStatus.canLoading) {
            body = Text('释放加载...zzz');
          } else {
            body = Text('没有更多数据了zzz');
          }
          return Container(
            child: Center(
              child: body,
            ),
          );
        },
      ),
    );
  }
}
