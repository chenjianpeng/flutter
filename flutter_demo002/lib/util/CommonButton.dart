import 'package:flutter/material.dart';
import 'package:flutter_demo001/util/ThemeColorUtils.dart';
//自定义按钮
class CommonButton extends StatefulWidget {
  final String text;
  final GestureTapCallback onTap;

  CommonButton({@required this.text, @required this.onTap});

  @override
  State<StatefulWidget> createState() => CommonButtonState();
}

class CommonButtonState extends State<CommonButton> {

  Color color = ThemeColorUtils.currentColorTheme;
  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.widget.onTap();
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: const Color(0xffcccccc)),
            borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: Center(
          child: Text(this.widget.text, style: textStyle,),
        ),
      ),
    );
  }

}