import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './utils/routes.dart';
import './tabs/pages/Apps.dart';
import './tabs/pages/Download.dart';
import './tabs/pages/User.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final router = new Router();
    Routers.configRouters(router);

    return new MaterialApp(
      home: Main(),
      onGenerateRoute: Routers.router.generator,
    );
  }
}

class ImageAsset {
  final String assets;

  ImageAsset(this.assets);
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  var _currentIndex = 0;
  var _tabBars = [AppsPage(), DownloadPage(), UserPage()];
  var navigators = [
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.appStore), title: Text('应用')),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cloudDownloadAlt), title: Text('下载')),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userAlt), title: Text('我的'))
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _tabBars[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.redAccent,
        backgroundColor: Colors.grey[100],
        currentIndex: _currentIndex,
        onTap: (index) {
          this.setState((){
            _currentIndex = index;
          });
        },
        items: navigators,
      ),
    );
  }
}
