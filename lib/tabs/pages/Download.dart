import 'package:flutter/material.dart';

class DownloadPage extends StatefulWidget {
  DownloadPage({Key key}) : super(key: key);

  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下载"),
      ),
      body: Center(
        child: Text("DownloadPage"),
      ),
    );
  }
}