import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'course/course_page.dart';
import 'home/home_page.dart';
import 'mine/mine_page.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  PageController _pageController;

  ///状态保持,避免每次回调页面都会重新加载页面

  ///初始化数据
  List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.computer_outlined), label: '课程'),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_rounded), label: '我的')
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    CoursePage(),
    MinePage(),
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];

    _pageController = PageController()
      ..addListener(() {
        if (currentPage != _pageController.page.round()) {
          setState(() {
            currentPage = _pageController.page.round();
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    ///隐藏顶部状态栏
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: IndexedStack(
        ///显示tabBodies中的第index个布局
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}
