import 'package:flutter/material.dart';
import './Login.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("UserPage"),
            RaisedButton(
              child: Text("前往登陆"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}