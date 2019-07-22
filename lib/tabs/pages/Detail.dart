
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/widgetOnTap.dart';
import './History.dart';
import './ScreenImage.dart';


class DetailPage extends StatefulWidget {
  final String title;
  DetailPage({Key key, this.title}) : super(key: key);

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var list = List<int>();
    jsonDecode(widget.title).forEach(list.add);
    final String titleString = Utf8Decoder().convert(list);

    return Scaffold(
      appBar: AppBar(
        title: Text(titleString),
      ),
      body: _renderDetail(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        isExtended: true,
        child: Icon(Icons.cloud_download),
      ),
    );
  }
}

Widget _renderDetail(BuildContext context) {

  return ListView(
    padding: EdgeInsets.all(20.0),
    children: <Widget>[
      _header(context),
      _title(context, "屏幕快照"),
      _screenShort(context),
      _description(context),
    ],
  );
} 

Widget _header(BuildContext context) {

  final size = MediaQuery.of(context).size;
  final width = size.width;

  return Row(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        child: Image.network("http://tako-logo-1252100362.cosgz.myqcloud.com/prod/logo/20180606/0cdedcdf-4732-4191-782d-cd534bcd072f.png", width: 100, height: 100, fit: BoxFit.fill,),
      ),
      SizedBox(width: 15.0),
      Container(
        width: width - 155,
        padding: EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("剑网3助手-官方资讯，江湖百态", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("com.seasun.tmgp.jx3m"),
                Text("更新于：2019-07-17 14:28:35")
              ],
            )
          ],
        ),
      ),
    ]
  );
}

Widget _title(BuildContext context, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 20,),
      Divider(color: Colors.black54),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
          OnTapWidget(
            child: Text("历史版本", style: TextStyle(color: Colors.blue[700])), 
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage()));
            },
          ),
        ],
      ),
    ],
  );
}

Widget _screenShort(BuildContext context) {

  final size = MediaQuery.of(context).size;
  final width = size.width;

  return Container(
    height: 400,
    width: width,
    padding: EdgeInsets.only(top: 20, bottom: 20),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        ClipRRect(
          child: OnTapWidget(
            child: Image.asset("images/230x0w.jpg", fit: BoxFit.cover,), 
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScreenImage(assets: "images/230x0w.jpg",)));
            },
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        SizedBox(width: 10,),
        ClipRRect(
          child: OnTapWidget(
            child: Image.asset("images/230x1w.jpg", fit: BoxFit.cover,), 
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScreenImage(assets: "images/230x1w.jpg",)));
            },
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        SizedBox(width: 10,),
        ClipRRect(
          child: OnTapWidget(
            child: Image.asset("images/230x2w.jpg", fit: BoxFit.cover,), 
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScreenImage(assets: "images/230x2w.jpg",)));
            },
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        SizedBox(width: 10,),
        ClipRRect(
          child: OnTapWidget(
            child: Image.asset("images/230x3w.jpg", fit: BoxFit.cover,), 
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScreenImage(assets: "images/230x3w.jpg",)));
            },
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        SizedBox(width: 10,),
        ClipRRect(
          child: OnTapWidget(
            child: Image.asset("images/230x4w.jpg", fit: BoxFit.cover,), 
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScreenImage(assets: "images/230x4w.jpg",)));
            },
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ],
    )
  );
}

Widget _description(BuildContext context) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Divider(color: Colors.black54),
      Text("介绍", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      SizedBox(height: 15,),
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("【剑网3推栏】是《剑网3》系列IP的专属应用，为热爱《剑网3》IP的用户提供官方资讯、趣味内容、玩家社交、创作分享、专业攻略和辅助工具等功能与服务。实时专业的竞技数据，游戏互通的社交服务，功能强大的便捷工具，【剑网3推栏】为每一位侠士打造专属移动社区。\n"),
            Text("应用功能：\n", style: TextStyle(fontWeight: FontWeight.w500),),
            Text("""1、官方资讯、江湖要闻、研发交流、游戏攻略，尽在手中掌握；
2、好友聊天，关注私信，世界、门派、阵营频道随时畅聊。社区宇宙频道，有爱网友互动嗨翻天；
3、江湖竞技，周月榜单、论剑排名，展示玩家详细的竞技场数据信息；
4、作品投稿，衍生创作、同人小说，分享你的创作心得，大唐名士等你加入；
5、游戏工具，自由配装、通宝充值，秘境大全，行走江湖必备宝典；
6、战绩分析，图文回放，一招一式分秒不差，复盘分锅好帮手。""")
          ],
        ),
      )
    ],
  );
}


