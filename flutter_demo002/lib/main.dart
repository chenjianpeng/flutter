import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo001/util/ThemeColorUtils.dart';
import 'package:flutter_demo001/util/ChangeThemeEvent.dart';
import 'package:flutter_demo001/HomeListPage.dart';
import 'package:flutter_demo001/dongtai.dart';


void main() {
  runApp(MyXQClient());
}

class MyXQClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyXQClientState();
}

class MyXQClientState extends State<MyXQClient> {
  final appBarTitles = ['星球', '动态', '发现', '我的'];
  final tabTextStyleSelected = TextStyle(color: const Color(0xff3B9AFF));
  final tabTextStyleNormal = TextStyle(color: const Color(0xff969696));

  Color themeColor = ThemeColorUtils.currentColorTheme;//设置主题标题背景颜色
  int _tabIndex = 0;

  var tabImages;
  var _body;
  var pages;

  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  void initState() {
    super.initState();
    pages = <Widget>[HomeListPage(), dongtai(), HomeListPage(), HomeListPage()];
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
  }

  TextStyle getTabTextStyle(int curIndex) {//设置tabbar 选中和未选中的状态文本
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {//设置tabbar选中和未选中的状态图标
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return MaterialApp(
      theme: ThemeData(
          primaryColor: themeColor
      ),
      home: Scaffold(//布局结构
          appBar: AppBar(//选中每一项的标题和图标设置
              title: Text(appBarTitles[_tabIndex],
                  style: TextStyle(color: Colors.white)),
              iconTheme: IconThemeData(color: Colors.white)
          ),
          body: _body,
          bottomNavigationBar: CupertinoTabBar(//
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: getTabIcon(0),
                  title: getTabTitle(0)),
              BottomNavigationBarItem(
                  icon: getTabIcon(1),
                  title: getTabTitle(1)),
              BottomNavigationBarItem(
                  icon: getTabIcon(2),
                  title: getTabTitle(2)),
              BottomNavigationBarItem(
                  icon: getTabIcon(3),
                  title: getTabTitle(3)),
            ],
            currentIndex: _tabIndex,
            onTap: (index) {
              setState((){
                _tabIndex = index;
              });
            },
          ),
//          drawer: MyDrawer()
      ),
    );
  }
}
