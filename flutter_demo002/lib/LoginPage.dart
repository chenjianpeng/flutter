import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  LoginPage({Key key, this.title});//接收数据

  @override
  createState() => new LoginPageState(title: this.title);//传递数据使用
}

class LoginPageState extends State<LoginPage> {
  String title;
  LoginPageState({Key key,this.title});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(//标题bar
          title: Text("登录", style: TextStyle(color: Colors.white)),//标题和颜色
          iconTheme: IconThemeData(color: Colors.white),//返回键和颜色
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Center(child: Text("欢迎进入星球")),
              Center(child: Text(title)),
            ],
          ),
        )
    );

  }
}
