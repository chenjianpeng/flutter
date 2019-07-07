import 'dart:convert';
import 'package:flutter/material.dart';
//import '../util/NetUtils.dart';
//import '../api/Api.dart';
//import '../pages/CommonWebPage.dart';

//
class dongtai extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return dongtaiState();
  }
}

class dongtaiState extends State<dongtai> {
  String eventTypeLatest = "latest";
  String eventTypeRec = "recommend";
  int curPage = 1;

  TextStyle titleTextStyle = TextStyle(color: Colors.black, fontSize: 18.0);

  List recData, latestData;

  @override
  void initState() {
    super.initState();
    getData(eventTypeRec);
    getData(eventTypeLatest);
  }

  void getData(String type) {
//    String url = Api.eventList;
//    url += "$type?pageIndex=$curPage&pageSize=5";
//    NetUtils.get(url).then((data) {
//      if (data != null) {
//        var obj = json.decode(data);
//        if (obj != null && obj['code'] == 0) {
//          print(obj);
//          setState(() {
//            if (type == eventTypeRec) {
//              recData = obj['msg'];
//            } else if (type == eventTypeLatest) {
//              latestData = obj['msg'];
//            } else {
//              ychData = obj['msg'];
//            }
//          });
//        }
//      }
//    });
  }

  Widget getRecBody() {
    if (recData == null) {
      return Center(child: CircularProgressIndicator());
    } else if (recData.length == 0) {
      return Center(child: Text("暂无数据"));
    } else {
      return ListView.builder(itemBuilder: _renderRecRow, itemCount: recData.length);
    }
  }

  Widget getLatestBody() {
    if (latestData == null) {
      return Center(child: CircularProgressIndicator());
    } else if (latestData.length == 0) {
      return Center(child: Text("暂无数据"));
    } else {
      return ListView.builder(itemBuilder: _renderLatestRow, itemCount: latestData.length);
    }
  }

//  Widget getCard(itemData) {
//    return Card(
//      child: Column(
//        children: <Widget>[
//          Image.network(itemData['cover'], fit: BoxFit.cover,),
//          Container(
//            margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
//            alignment: Alignment.centerLeft,
//            child: Text(itemData['title'], style: titleTextStyle,),
//          ),
//          Container(
//              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
//              child: Row(
//                children: <Widget>[
//                  Expanded(child: Text(itemData['authorName']), flex: 1,),
//                  Text(itemData['timeStr'])
//                ],
//              )
//          )
//        ],
//      ),
//    );
//  }

  Widget _renderRecRow(BuildContext ctx, int i) {
    Map itemData = recData[i];
    return InkWell(
//      child: getCard(itemData),//界面显示
      onTap: () {
        _showDetail(itemData['detailUrl']);
      },
    );
  }

  Widget _renderLatestRow(BuildContext ctx, int i) {
    Map itemData = latestData[i];
    return InkWell(
//      child: getCard(itemData),
      onTap: () {
        _showDetail(itemData['detailUrl']);
      },
    );
  }

  _showDetail(detailUrl) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) {
//          return CommonWebPage(title: '活动详情', url: detailUrl);
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: TabBar(
              labelColor: Colors.black,
              tabs: <Widget>[
                Tab(
                  text: "星球动态",
                ),
                Tab(
                  text: "与我相关",
                )
              ],
            ),
            body: TabBarView(
              children: <Widget>[
                getRecBody(),
                getLatestBody(),
              ],
            )),
      ),
    );
  }
}
