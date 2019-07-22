
import 'package:dio/dio.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../res/historyList.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);
  
  _HistoryPageState createState() => _HistoryPageState();

}

class _HistoryPageState extends State<HistoryPage> {

  List histories = historyList;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("历史版本"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
            },
          ),
        
        ],
      ),
      body: _render(context),
    );
  }

  Widget _render(BuildContext context) {
    return Container(
      child: Column(

        children: <Widget>[
          Row(
            children: <Widget>[
              imageRRect(),
              baseInfo(),
            ],
          ),
          Container(color: Colors.grey[300], height: 10,),
          
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 0, bottom: 10),
              separatorBuilder: (context, index) => Divider(color: Colors.grey[300],),
              itemCount: histories.length,
              itemBuilder: (context, index) => ListTile(
                title: Text("版本号: ${histories[index]['package']['version']} 【构建号: ${histories[index]['package']['buildnumber']}】", style: TextStyle(fontWeight: FontWeight.w600),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("更新于: ${(histories[index]['lastmodified']).replaceAll("T", " ").replaceAll(RegExp(r"\..*$"), "")}"),
                    Offstage(
                      offstage: (histories[index]['releasenote']).length == 0 ? true : false,
                      child: Text("更新内容: ${histories[index]['releasenote']}"),
                    )
                  ],
                ),
                trailing: Container(
                  width: 70.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(width: 1, color: Colors.blue)
                  ),
                  child: FlatButton(
                    child: Text('下载', style: TextStyle(fontSize: 16.0, ), ),
                    textColor: Colors.blue,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {

                    },
                  ),
                ),

              ),
            ),
          )
          // ListView.builder(
          //   itemCount: histories.length,
          //   itemBuilder: (context, index) => ListTile(
          //     title: Text("data"),
          //   ),
          // ),



        ],
      ),
    );
  }

  Widget imageRRect() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 15, bottom: 15),
      width: 100,
      height: 100,
      child: ClipRRect(
        child: Image.network("http://tako-logo-1252100362.cosgz.myqcloud.com/prod/logo/20180628/8f53911a-640e-4cc5-59c2-289873c050a1.png"),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget baseInfo() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 15, bottom: 15),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("云裳雨衣", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          Text("com.seasun.seed.tako"),
          Text("版本: 1.1.23"),
          Text("更新于: 2019-07-14 15:43:00"),
        ],
      ),
    );
  }

  String fomatTimestamp(int timestamp) {
    return formatDate(DateTime(timestamp), [yyyy, "-", mm, "-", dd, " ", hh, ":", M, ":", "ss"]);
  }


}

