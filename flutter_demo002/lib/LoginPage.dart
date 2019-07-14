import 'package:flutter/material.dart';
import 'package:flutter_demo001/util/MyProgress.dart';
import 'package:flutter_demo001/util/ProgressDialog.dart';
import 'package:flutter_demo001/util/CommonButton.dart';
import 'package:flutter_demo001/util/Toast.dart';

//颜色值变量
const kYellow = const Color(0xFFffd600);

class LoginPage extends StatefulWidget{
  final String title;
  LoginPage({Key key,this.title});

  @override
  createState() => new LoginPageState(title: this.title);//传递数据使用
}

class LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  String title;
  LoginPageState({Key key,this.title});
  // 是否隐藏输入的文本
  bool obscureText = true;
  // 是否正在登录
  bool isOnLogin = false;

  //输入信息变量
  final usernameCtrl = TextEditingController(text: '');//用户名信息控制器
  final passwordCtrl = TextEditingController(text: '');
  bool _isObscure = true;
  Color _eyeColor;

  @override
  Widget build(BuildContext context){
    //登录
    var loginBtn = Builder(builder: (ctx) {
      return CommonButton(text: "登录", onTap: () {
        // 拿到用户输入的账号密码
        String username = usernameCtrl.text.trim();
        String password = passwordCtrl.text.trim();
        if (username.isEmpty || password.isEmpty) {
          Scaffold.of(ctx).showSnackBar(SnackBar(
            content: Text("账号和密码不能为空！"),
          ));
          return;
        }
        // 关闭键盘
        FocusScope.of(context).requestFocus(FocusNode());
        // 发送给webview，让webview登录后再取回token
        loginPush(username, password);
      });
    });
    //界面布局
    return Scaffold(
        appBar: AppBar(//设置标题
            title: Text("登录",
                style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white)
        ),
        body: Form(//页面内容
            child: ListView(
              key: _formKey,
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                SizedBox(height: 0/*kToolbarHeight*/),//设置一个工具bar高度
                pageTitle(),//登录标题
                pageTitleLine(),//登录标题下划线
                Container(height: 20.0),//设置一个logo和上部的距离
                new Image.asset("images/user_photo.png",
                  alignment: Alignment.topCenter,height: 100,width: 100,), //设置图片logo
                Container(height: 20.0),
                //----用户名
                Row(//水平布局控件
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("用户名："),
//                    Image.asset("act_login_et_username.PNG"),
                    Expanded(child: TextField(
                      controller: usernameCtrl,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),//可以设置用户名图标在输入框中
                          hintText: "注册邮箱",//可以设置用户名在左边
                          hintStyle: TextStyle(
                              color: const Color(0xFF000000)
                          ),
                          border: OutlineInputBorder(//如果要边框，设置该属性，否则默认是底部下划线
                            borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
//                              borderSide: BorderSide(color: kYellow),//边框颜色变化
                            borderSide: BorderSide(color: Color(0x00000000)),
                          ),
                          contentPadding: const EdgeInsets.all(10.0)
                      ),
                    ))
                  ],
                ),
                Container(height: 20.0),
                //----密码
                Row(//水平布局控件
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("密    码："),
//                    Image.asset("act_login_et_username.PNG"),
                    Expanded(child: TextField(
                      controller: passwordCtrl,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),//可以设置用户名图标在输入框中
                          hintText: "注册密码",//可以设置用户名在左边
                          hintStyle: TextStyle(
                              color: const Color(0xFF000000)
                          ),
                          border: OutlineInputBorder(//如果要边框，设置该属性，否则默认是底部下划线
                            borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
//                              borderSide: BorderSide(color: kYellow),//边框颜色变化
                            borderSide: BorderSide(color: Color(0x00000000)),
                          ),
                          contentPadding: const EdgeInsets.all(10.0),
                          suffixIcon: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: _eyeColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                  _eyeColor = _isObscure
                                      ? Colors.grey
                                      : Theme.of(context).iconTheme.color;
                                  obscureText = !obscureText;
                                });
                              }
                          )
                      ),
                    ))
                  ],
                ),
                //---忘记密码
                pageForgetPassword(),
                //----登录按钮
                loginBtn,

              ],
            )
        )
    );
  }
  //顶部登录标题（文本介绍）
  Padding pageTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, top: 15.0,bottom: 5.0,right: 5.0),// 1. EdgeInsets.all(8.0) 所有内边距  2. EdgeInsets.only(left: 12.0, top: 4.0) 设置内边距
      child: Text(
        '欢迎进入登录界面',
        textAlign: TextAlign.center,
        //字体是否隐藏 inherit: true,
        //字体样式 大小,颜色 color: Color(0xFFffffff) ，color: Color.fromARGB(255, 150, 150, 150),
        //字体斜体  fontStyle: FontStyle.italic
        //字体间距  letterSpacing: 10.0,
        //上划线 decoration: TextDecoration.overline,(lineThrough 删除线)(underline 下划线)
        //波浪线 decorationStyle: TextDecorationStyle.wavy (dashed)(dotted)
        //字重 fontWeight: FontWeight.w700
        style: TextStyle(inherit: false,fontSize: 22.0,color: Color(0xFF000000),/*fontStyle: FontStyle.italic,*/letterSpacing: 2.0,/*decoration: TextDecoration.overline,
            decorationStyle: TextDecorationStyle.wavy,*/fontWeight: FontWeight.w700),
      ),
    );
  }
  //顶部标题分割线
  Padding pageTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 5.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.black,
          width: 100.0,
          height: 2.0,
        ),
      ),
    );
  }
  //忘记密码
  Padding pageForgetPassword(){
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text(
          "忘记密码？",
          style: TextStyle(fontSize: 15,color: Colors.black),
        )),

      ),
    );
  }
  //登录接口
  void loginPush(String username ,String password){
    setState(() {
      isOnLogin = true;
    });
//    Navigator.pop(context);
      Toast.show(context, "加载完成");
  }

}

//class LoginPage extends StatefulWidget{
//  final String title;
//  LoginPage({Key key,this.title});
//
//  @override
//  createState() => new LoginPageState(title: this.title);//传递数据使用
//}
//
//class LoginPageState extends State<LoginPage>{
//  final _formKey = GlobalKey<FormState>();
//  String title;
//  LoginPageState({Key key,this.title});
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: '加载动画'),
//    );
//  }
//}
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  bool _loading = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: ProgressDialog(
//        loading: _loading,
//        progress: MyProgress(size: new Size(100.0, 20.0),color: Colors.white,),
//        msg: '正在加载...',
//        alpha: 0.5,
//        child: Center(
//          child: RaisedButton(
//            onPressed: () => _onRefresh(),
//            child: Text('显示加载动画'),
//          ),
//        ),
//      ),
//    );
//  }
//
//  Future<Null> _onRefresh() async {
//    setState(() {
//      _loading = !_loading;
//    });
//    await Future.delayed(Duration(seconds: 3), () {
//      setState(() {
//        _loading = !_loading;
////        Toast.show(context, "加载完成");
//      });
//    });
//  }
//}
