import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:core';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:barcode_scan/barcode_scan.dart';
import '../../res/appList.dart';
import '../../utils/routes.dart';
import 'Detail.dart';


class AppsPage extends StatefulWidget {
  AppsPage({Key key}) : super(key: key);

  _AppsPageState createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {
  var apps = AppList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("应用"),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.barcode), 
          onPressed: (){
            _scanning();
          },
        ),
      ),
      body: RefreshIndicator(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(color: Colors.black12),
          itemCount: apps.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(5.0),
            child: renderListTile(context, index, apps)
          ),
        ),
        onRefresh: _refresh,
      ),
    );
  }

  Future _scanning() async {
    try {
      String barcode = await BarcodeScanner.scan();
      print(barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print(e.code);
      } else {
        print(e);
      }
    }
  }

  Future<Null> _refresh() async {
    print('refreshed');
  }
}


ListTile renderListTile(BuildContext context, int index, List apps) {
  return ListTile(
    onTap: () {
      var json = jsonEncode(Utf8Encoder().convert(apps[index]['title']));
      // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(id: "剑网3手机助手",)));
      Routers.router.navigateTo(context, "detail?title=$json");
    },
    leading: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Image.network(apps[index]['image'], fit: BoxFit.cover),
    ),
    title: Text(apps[index]['title'], style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
    subtitle: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Text("版本:${apps[index]['version']}")),
              Expanded(child: Text("${humanSize(apps[index]['size'])}")),
            ],
          ),
          Text(apps[index]['updated'])
        ],
      )
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
          print("下载最新版本");
        },
      ),
    )
  );
}

String humanSize(int bytes) {
  const List Units = ['K','M','G','T','P','E','Z','Y'];
  var magnitude = (log(bytes)/log(1024)).floor();
  var res = (bytes / pow(1024, magnitude)).toStringAsFixed(1);
  var suffix = Units[magnitude];
  return "$res$suffix";
}



