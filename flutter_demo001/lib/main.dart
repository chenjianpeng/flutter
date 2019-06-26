import 'package:flutter/material.dart';
void main(){
//  runApp(MyApp());
//  runApp(MyAppLocImage());
//  runApp(MyAppText());

//  runApp(TextPage());

  runApp(MaterialApp(
    title:'',
    home: SecondScreen(),
  ));
}

//读取本地图片，需要配置信息
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: Image.asset("images/share_image.png"),
      ),
    );
  }
}
//网络图片加载
class MyAppLocImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',//标题名称
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),//标题名称
        ),
        body: Image.network("https://www.baidu.com/img/bd_logo1.png"),//图片加载地图
      ),
    );
  }
}

//文本显示
class MyAppText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '你好吗？',
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}


/*****************************动态组件****************************/

class TextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyState();
}

class MyState extends State<TextPage> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Hello StatefulWidget"),
        ),
        body: new Stack(
          children: <Widget>[
            new Align(
              child: new Text(
                "count值:$_count",
                style: new TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
            new Align(
              alignment: new FractionalOffset(0.5, 0.0),
              child: new MaterialButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  //重新渲染当前的状态
                  setState(() {
                    _count++;
                  });
                },
                child: new Text('点我加下方文字自动加1'),
              ),
            ),
          ],
        ));
  }
}


/**************************标题设置****************************/

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //标题设置，包括：标题
      appBar: AppBar(
        title: new Text('首页'),
        leading: new Icon(Icons.arrow_back),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("该页面有标题，有返回"),
        ),
      ),
    );
  }
}
