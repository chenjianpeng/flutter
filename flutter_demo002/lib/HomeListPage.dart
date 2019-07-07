import 'package:flutter/material.dart';
import 'package:flutter_demo001/LoginPage.dart';

class HomeListPage extends StatefulWidget {
  @override
  createState() => new MyHomePageState();
}

class MyHomePageState extends State<HomeListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text("Hello 欢迎来到星球"),
                    Text("必须登录后才能查看星球信息")
                  ],
                ),
              )
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
              child: Text("去登录"),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
            ),
            onTap: () async {
              final result = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return LoginPage(title:"我是从上一层带过来的数据：小蜗");
              }));
              if (result != null && result == "refresh") {//做一些进入处理操作，比如加载效果
//                Constants.eventBus.fire(LoginEvent());
              }
            },
          ),
        ],
      ),
    );

  }

}