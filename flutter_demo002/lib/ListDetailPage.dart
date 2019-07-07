/*
 * Created by 李卓原 on 2018/9/6.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListDetailPage extends StatefulWidget {
  final title;

  ListDetailPage(this.title);

  @override
  State<StatefulWidget> createState() => PlatformPageState(title);
}

class PlatformPageState extends State<ListDetailPage> {
  static const platform = const MethodChannel('flutteraa/battery');
  String _batteryLevel = 'Unknown battery level.';
  final title;

  PlatformPageState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new Icon(Icons.arrow_back),
        backgroundColor: Colors.blue,
        title: Text('传递数据是：$title'),

      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: _goback,//返回操作
            child: Text('返回'),
          )
        ],
      ),
    );
  }
  //返回函数
  void _goback() {
    //返回上一页面并传递参数
    Navigator.pop(context,'我收到消息了。');
  }
}
